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

MemoryAccessAbstractValue::MemoryAccessAbstractValue(const std::string & pointer, const std::string & buffer,
		ap_texpr1_t * size, user_pointer_operation_e operation)
		: pointer(pointer), buffer(buffer), size(size), operation(operation) {}

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
	ap_scalar_t* zero = ApronAbstractState::zero();
	m_apronAbstractState.start_meet_aggregate();
	for (const std::string & buffer : userBuffers) {
		const std::string & offsetName = generateOffsetName(buffer, buffer);
		ap_texpr1_t * offsetTexpr = m_apronAbstractState.asTexpr(offsetName);
		ap_tcons1_t offsetGeq0 = ap_tcons1_make(AP_CONS_SUPEQ, offsetTexpr, zero);
		m_apronAbstractState.meet(offsetGeq0);
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

ap_manager_t * AbstractState::getManager() const {
	return apron_manager;
}

void AbstractState::updateUserOperationAbstract1() {
	if (memoryAccessAbstractValues.empty()) {
		return;
	}
	ap_scalar_t* zero = ApronAbstractState::zero();

	ap_manager_t * manager = getManager();
	// Construct the environment
	unsigned size = memoryAccessAbstractValues.size();
	std::vector<ApronAbstractState> values;
	for (MemoryAccessAbstractValue & maav : memoryAccessAbstractValues) {
		const std::string & offsetName = generateOffsetName(maav.pointer, maav.buffer);
		const std::string & lastName = generateLastName(maav.buffer, maav.operation);
		ApronAbstractState apronState = m_apronAbstractState;
		apronState.extend(offsetName);
		apronState.forget(lastName);
		apronState.extend(lastName);
		ap_texpr1_t * offset = apronState.asTexpr(offsetName);
		ap_texpr1_t * last = apronState.asTexpr(lastName);

		apronState.start_meet_aggregate();
		// last >= offset
		ap_texpr1_t * startOffset = ap_texpr1_binop(
				AP_TEXPR_SUB, ap_texpr1_copy(last), ap_texpr1_copy(offset),
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t lastGeqOffset = ap_tcons1_make(AP_CONS_SUPEQ, startOffset, zero);
		apronState.meet(lastGeqOffset);

		// last <= offset + size
		apronState.extendEnvironment(maav.size);
		ap_texpr1_t * end = ap_texpr1_binop(
				AP_TEXPR_ADD, offset, maav.size,
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_texpr1_t * endOffset = ap_texpr1_binop(
				AP_TEXPR_SUB, end, last,
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t lastLeqEnd = ap_tcons1_make(AP_CONS_SUPEQ, endOffset, zero);
		apronState.meet(lastLeqEnd);
		apronState.finish_meet_aggregate();

		values.push_back(apronState);
	}
	memoryAccessAbstractValues.clear();
	m_apronAbstractState.join(values);
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
}
