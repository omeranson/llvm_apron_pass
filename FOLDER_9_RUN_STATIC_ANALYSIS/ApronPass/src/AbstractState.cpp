#include <APStream.h>
#include <AbstractState.h>
#include <BasicBlock.h>

extern "C" {
#include <Adaptor.h>
}

ap_manager_t * apron_manager = create_manager();

class raw_uniq_string_ostream : public llvm::raw_string_ostream {
	std::set<std::string> & m_cache;
	std::string buf;
public:
	raw_uniq_string_ostream(std::set<std::string> & cache) :
		m_cache(cache), llvm::raw_string_ostream(buf) {}
	const std::string & uniq_str() {
		std::pair<std::set<std::string>::iterator,bool> inserted =
				m_cache.insert(str());
		return *inserted.first;
	}
};

MemoryAccessAbstractValue::MemoryAccessAbstractValue(const std::string & var, const std::string & pointer, const std::string & buffer,
		ap_texpr1_t * size, user_pointer_operation_e operation)
		: var(var), pointer(pointer), buffer(buffer), size(size), operation(operation) {}

///////////////////////////////////////////////////////////////////////////////

AbstractState::AbstractState() : m_apronAbstractState(ApronAbstractState::bottom()) {
	m_mayPointsTo.m_mayPointsTo["null"].insert("null");
}

template <class T>
bool inVector(const std::vector<T> & v, const T & item) {
	for (const T & t : v) {
		if (t == item) {
			return true;
		}
	}
	return false;
}

template <class T>
bool joinVectors(std::vector<T> & dest, const std::vector<T> & src) {
	bool isChanged = false;
	for (const T & item : src) {
		if (!inVector(dest, item)) {
			dest.push_back(item);
			isChanged = true;
		}
	}
	return isChanged;
}

template <class T>
bool meetVectors(std::vector<T> & dest, const std::vector<T> & src) {
	bool isChanged = false;
	for (auto it = dest.begin(), ie = dest.end();
			it != ie; it++) {
		if (!inVector(src, *it)) {
			it = dest.erase(it);
			isChanged = true;
		}
	}
	return isChanged;
}

// This is the constructor used for the root abstract state - which is Top,
// and not Bottom
AbstractState::AbstractState(std::vector<std::string> & userBuffers) :
		m_apronAbstractState(ApronAbstractState::top()),
		m_mayPointsTo(userBuffers) {
	m_apronAbstractState.start_meet_aggregate();
	for (const std::string & buffer : userBuffers) {
		const std::string & offsetName = generateOffsetName(buffer, buffer);
		ap_texpr1_t * zero = m_apronAbstractState.asTexpr((int64_t)0);
		m_apronAbstractState.assign(offsetName, zero);
	}
	m_apronAbstractState.finish_meet_aggregate();
}

const std::string & AbstractState::generateOffsetName(const std::string & valueName, const std::string & bufname) {
	static std::set<std::string> names;
	raw_uniq_string_ostream rso(names);
	rso << "offset(" << valueName << "," << bufname << ")";
	return rso.uniq_str();
}

const std::string & AbstractState::generateLastName(const std::string & bufname, user_pointer_operation_e op) {
	static std::set<std::string> names;
	raw_uniq_string_ostream rso(names);
	rso << "last(" << bufname << "," << op << ")";
	return rso.uniq_str();
}

const std::string & AbstractState::generateSizeName(const std::string & bufname) {
	static std::set<std::string> names;
	raw_uniq_string_ostream rso(names);
	rso << "size(" << bufname << ")";
	return rso.uniq_str();
}

ap_manager_t * AbstractState::getManager() const {
	return apron_manager;
}

void AbstractState::updateByMemoryOperation(MemoryAccessAbstractValue & maav) {
	const std::string & offsetName = generateOffsetName(maav.pointer, maav.buffer);
	const std::string & lastName = generateLastName(maav.buffer, maav.operation);
	bool isLastKnown = m_apronAbstractState.isKnown(lastName);

	m_apronAbstractState.extend(offsetName);
	m_apronAbstractState.extend(lastName);
	ap_texpr1_t * offset = m_apronAbstractState.asTexpr(offsetName);

	// last <= offset + size
	m_apronAbstractState.extendEnvironment(maav.size);
	ap_texpr1_t * last_value = ap_texpr1_binop(
			AP_TEXPR_ADD, offset, maav.size,
			AP_RTYPE_INT, AP_RDIR_ZERO);

	if (!m_apronAbstractState.isKnown(lastName)) {
		m_apronAbstractState.assign(lastName, last_value);
	} else {
		ap_texpr1_t * difference = ap_texpr1_binop(
				AP_TEXPR_SUB, m_apronAbstractState.asTexpr(lastName), ap_texpr1_copy(last_value),
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t cons = ap_tcons1_make(AP_CONS_SUPEQ, difference, m_apronAbstractState.zero());
		if (!ap_abstract1_sat_tcons(apron_manager, &m_apronAbstractState.m_abstract1, &cons)) {
			m_apronAbstractState.assign(lastName, last_value);
		}
		ap_tcons1_clear(&cons);
	}
}

void AbstractState::updateUserOperationAbstract1() {
	if (memoryAccessAbstractValues.empty()) {
		return;
	}
	m_isHasMemoryOperation = true;
	for (MemoryAccessAbstractValue & maav : memoryAccessAbstractValues) {
		updateByMemoryOperation(maav);
	}
}

bool AbstractState::joinMemoryOperationState(const memory_operation_state_e & other) {
	if (other == m_mos) {
		return false;
	}
	if (m_mos == memory_operation_state_top) {
		return false;
	}
	if (other == memory_operation_state_bottom) {
		return false;
	}
	if (m_mos == memory_operation_state_bottom) {
		m_mos = other;
		return true;
	}
	// Not equal, not top, nor bottom, so I must change to top
	m_mos = memory_operation_state_top;
	return true;
}

bool AbstractState::join(AbstractState &other)
{
	bool isChanged = false;
	// Join 'May' reference
	isChanged = m_mayPointsTo.join(other.m_mayPointsTo) || isChanged;
	// Join (Apron) analysis of integers
	isChanged = m_apronAbstractState.join(other.m_apronAbstractState) || isChanged;
	// Join (Apron) analysis of (user) read/write/last0 pointers
	isChanged = joinVectors(m_importedIovecCalls, other.m_importedIovecCalls) || isChanged;
	isChanged = joinVectors(m_copyMsghdrFromUserCalls, other.m_copyMsghdrFromUserCalls) || isChanged;
	isChanged = joinMemoryOperationState(other.m_mos) || isChanged;
	return isChanged;
}

bool AbstractState::widen(AbstractState &other)
{
	bool isChanged = false;
	// Join 'May' reference
	isChanged = m_mayPointsTo.join(other.m_mayPointsTo) || isChanged;
	// Join (Apron) analysis of integers
	isChanged = m_apronAbstractState.widen(other.m_apronAbstractState) || isChanged;
	// Join (Apron) analysis of (user) read/write/last0 pointers
	isChanged = joinVectors(m_importedIovecCalls, other.m_importedIovecCalls) || isChanged;
	isChanged = joinVectors(m_copyMsghdrFromUserCalls, other.m_copyMsghdrFromUserCalls) || isChanged;
	return isChanged;
}

bool AbstractState::meet(AbstractState & other) {
	bool isChanged = false;
	// Meet 'May' reference
	isChanged = m_mayPointsTo.meet(other.m_mayPointsTo) || isChanged;
	// Meet (Apron) analysis of integers
	isChanged = m_apronAbstractState.meet(other.m_apronAbstractState) || isChanged;
	// Join (Apron) analysis of (user) read/write/last0 pointers
	isChanged = meetVectors(m_importedIovecCalls, other.m_importedIovecCalls) || isChanged;
	isChanged = meetVectors(m_copyMsghdrFromUserCalls, other.m_copyMsghdrFromUserCalls) || isChanged;
	return isChanged;
}

bool AbstractState::reduce(std::vector<std::string> & userBuffers) {
	AbstractState prev = *this;
	for (std::pair<const std::string, MPTItemAbstractState > & pt : m_mayPointsTo.m_mayPointsTo) {
		if (pt.second.empty()) {
			llvm::errs() << "Setting state to bottom in reduction, since " <<
					pt.first << " doesn't point to anything\n";
			makeBottom();
			return true;
		}
		for (const std::string & buffer : userBuffers) {
			if (pt.second.contains(buffer)) {
				continue;
			}
			const std::string & offsetName = generateOffsetName(
					pt.first, buffer);
			m_apronAbstractState.forget(offsetName, true);
		}
	}
	return (prev.m_apronAbstractState != m_apronAbstractState);
}

void AbstractState::assignPtrToPtr(const std::string & dest, const std::string & src) {
	MPTItemAbstractState *srcBuffers = m_mayPointsTo.find(src);
	if (!srcBuffers) {
		m_mayPointsTo.forget(dest);
		return;
	}
	m_mayPointsTo.extend(dest) = *srcBuffers;
	for (auto & buffer : *srcBuffers) {
		const std::string & destOffsetName = AbstractState::generateOffsetName(
				dest, buffer);
		m_apronAbstractState.forget(destOffsetName);
		const std::string & srcOffsetName = AbstractState::generateOffsetName(
				src, buffer);
		ap_texpr1_t * srcOffsetTexpr =
				m_apronAbstractState.asTexpr(srcOffsetName);
		m_apronAbstractState.assign(destOffsetName, srcOffsetTexpr);
	}
}

bool AbstractState::operator==(const AbstractState & other) const {
	return ((m_mayPointsTo == other.m_mayPointsTo) &&
			(m_apronAbstractState == other.m_apronAbstractState) &&
			(m_importedIovecCalls == other.m_importedIovecCalls) &&
			(m_copyMsghdrFromUserCalls == other.m_copyMsghdrFromUserCalls));
}

bool AbstractState::operator!=(const AbstractState & other) const {
	return !(*this == other);
}

void AbstractState::makeTop() {
	assert(0 && "TODO: Not yet implemented");
}

void AbstractState::makeBottom() {
	m_mayPointsTo.clear();
	m_apronAbstractState.makeBottom();
	memoryAccessAbstractValues.clear();
	m_importedIovecCalls.clear();
	m_copyMsghdrFromUserCalls.clear();
	m_mos = memory_operation_state_bottom;
}
