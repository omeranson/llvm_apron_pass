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
	m_mayPointsTo["null"].insert("null");
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
	// TODO definitely make into a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

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
	ApronAbstractState aas = ApronAbstractState::bottom();
	aas.join(values);
	m_apronAbstractState = aas;
}

bool AbstractState::joinUserPointers(
		std::set<std::string> & dest,
		std::set<std::string>& src) {
	bool isChanged = false;
	for (const std::string & userPtr : src)
	{
		auto inserted = dest.insert(userPtr);
		isChanged = isChanged || inserted.second;
	}
	return isChanged;
}

bool AbstractState::joinMayPointsTo(may_points_to_t &otherMayPointsTo)
{
	bool isChanged = false;

	/***************************************/
	/* Iterate over otherMayPointsTo       */
	/* REMINDER:                           */
	/* map[p] = {buf1,buf2}                */
	/***************************************/
	for (auto &allPointersIterator:otherMayPointsTo)
	{
		/************************/
		/* [1] pointer name ... */
		/************************/
		std::string name = allPointersIterator.first;

		/***************************************************/
		/* [2] name does not appear in this->m_MayPointsTo */
		/***************************************************/
		/***************************************************/
		/* This could happen for example in the join of    */
		/* line 6                                          */
		/*                                                 */
		/* LINE 0: int f9(char *buf1) {                    */
		/* LINE 1: char *p;                                */
		/* LINE 2: if (?)                                  */
		/* LINE 3: {                                       */
		/* LINE 4:     p = buf1 + 3;                       */
		/* LINE 5: }                                       */
		/* LINE 6: ...                                     */
		/* LINE 7: }                                       */
		/*                                                 */
		/***************************************************/
		auto userPointerOffsetsIt = m_mayPointsTo.find(name);
		if (userPointerOffsetsIt == m_mayPointsTo.end())
		{
			isChanged = true;
			m_mayPointsTo[name] = allPointersIterator.second;
		}
		else
		{
			isChanged = joinUserPointers(
					userPointerOffsetsIt->second,
					allPointersIterator.second) || isChanged;

		}
	}
	return isChanged;
}

bool AbstractState::join(AbstractState &other)
{
	bool isChanged = false;
	// Join 'May' reference
	isChanged = joinMayPointsTo(other.m_mayPointsTo) || isChanged;
	// Join (Apron) analysis of integers
	isChanged = m_apronAbstractState.join(other.m_apronAbstractState) || isChanged;
	// Join (Apron) analysis of (user) read/write/last0 pointers
	// TODO(oanson) TBD
	return isChanged;
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
