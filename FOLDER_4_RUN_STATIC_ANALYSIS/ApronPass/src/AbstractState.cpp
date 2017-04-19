#include <APStream.h>
#include <AbstractState.h>
#include <BasicBlock.h>

MemoryAccessAbstractValue::MemoryAccessAbstractValue(ap_environment_t * env,
		ap_texpr1_t * last,
		ap_texpr1_t * offset,
		ap_texpr1_t * size) : m_environment(env) {
	// TODO definitely make into a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	last = ap_texpr1_extend_environment(last, m_environment);
	offset = ap_texpr1_extend_environment(offset, m_environment);
	size = ap_texpr1_extend_environment(size, m_environment);
	// last >= offset
	ap_texpr1_t * startOffset = ap_texpr1_binop(
			AP_TEXPR_SUB, ap_texpr1_copy(last), ap_texpr1_copy(offset),
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t lastGeqOffset = ap_tcons1_make(AP_CONS_SUPEQ, startOffset, zero);

	// last <= offset + size
	ap_texpr1_t * end = ap_texpr1_binop(
			AP_TEXPR_ADD, offset, size,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_texpr1_t * endOffset = ap_texpr1_binop(
			AP_TEXPR_SUB, end, last,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t lastLeqEnd = ap_tcons1_make(AP_CONS_SUPEQ, endOffset, zero);

	m_constraints = ap_tcons1_array_make(m_environment, 2);
	ap_tcons1_array_set(&m_constraints, 0, &lastGeqOffset);
	ap_tcons1_array_set(&m_constraints, 1, &lastLeqEnd);
}

///////////////////////////////////////////////////////////////////////////////

AbstractState::AbstractState() :
		m_abstract1(ap_abstract1_bottom(getManager(), ap_environment_alloc_empty())) {
}

ap_manager_t * AbstractState::getManager() const {
	return BasicBlockManager::getInstance().m_manager;
}

void AbstractState::updateUserOperationAbstract1(ap_abstract1_t & abstract1) {
	ap_manager_t * manager = getManager();
	// Construct the environment
	unsigned size = memoryAccessAbstractValues.size();
	std::vector<ap_abstract1_t> values;
	ap_environment_t * new_env = ap_abstract1_environment(manager, &abstract1);
	for (MemoryAccessAbstractValue & maav : memoryAccessAbstractValues) {
		ap_tcons1_array_extend_environment_with(
				&maav.m_constraints, new_env);
		ap_abstract1_t abstract_value = ap_abstract1_meet_tcons_array(
			manager, false, &abstract1, &maav.m_constraints);
		values.push_back(abstract_value);
	}
	ap_abstract1_t abstract = join(values);
	joinAbstract1(&abstract);
	//m_abstract1 = abstract;
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

	/***************************************************/
	/* OREN ISH SHALOM: just numbered what we're doing */
	/***************************************************/
	/***************************************/
	/* OREN ISH SHALOM:                    */
	/* Iterate over otherMayPointsTo       */
	/*                                     */
	/* REMINDER:                           */
	/*                                     */
	/* map[p] =                            */
	/* {                                   */
	/*     pair(buf1,OFFSET_LINE(*)_BUF1), */
	/*     pair(buf2,OFFSET_LINE(**)_BUF2) */
	/* }                                   */
	/*                                     */
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

bool AbstractState::joinAbstract1(ap_abstract1_t * abstract1)
{
	ap_manager_t * manager = getManager();
	ap_abstract1_t prev = m_abstract1;
	m_abstract1 = join(&m_abstract1, abstract1);
	bool isChanged = !(ap_environment_is_eq(
				ap_abstract1_environment(manager, &m_abstract1),
				ap_abstract1_environment(manager, &prev)) &&
			(ap_abstract1_is_eq(manager, &m_abstract1, &prev)));
	return isChanged;
}

bool AbstractState::join(AbstractState &other)
{
	bool isChanged = false;
	// Join 'May' reference
	/********************************************************/
	/* OREN ISH SHALOM remarks: I'm removing this duplicate */
	/* typedef and force everyone to use the type already   */
	/* defined in AbstractState.h                           */
	/********************************************************/
	//typedef std::map<std::string, std::set<llvm::Value *> > may_points_to_t;

	/********************************************************/
	/* OREN ISH SHALOM remarks: I'm removing this temporary */
	/* local variable and join in place with this           */
	/********************************************************/
	//std::map<std::string, may_points_to_t > may_points_to;

	/********************************************************/
	/* OREN ISH SHALOM remarks: I'm removing this duplicate */
	/* typedef and force everyone to use the type already   */
	/* defined in AbstractState.h                           */
	/********************************************************/
	joinMayPointsTo(other.m_mayPointsTo);
	// Join (Apron) analysis of integers
	// TODO(oanson) TBD
	// Join (Apron) analysis of (user) read/write/last0 pointers
	isChanged = joinAbstract1(&other.m_abstract1) | isChanged;
	return isChanged;
}

ap_abstract1_t AbstractState::join(ap_abstract1_t * val1, ap_abstract1_t * val2) {
	ap_manager_t * manager = getManager();
	ap_dimchange_t * dimchange1 = NULL;
	ap_dimchange_t * dimchange2 = NULL;
	ap_environment_t * environment = ap_environment_lce(
			ap_abstract1_environment(manager, val1),
			ap_abstract1_environment(manager, val2),
			&dimchange1, &dimchange2);
	ap_abstract1_t lcl_val1 = ap_abstract1_change_environment(
			manager, false, val1, environment, true);
	ap_abstract1_t lcl_val2 = ap_abstract1_change_environment(
			manager, false, val2, environment, true);
	ap_abstract1_t result = ap_abstract1_join(manager, false, &lcl_val1, &lcl_val2);
	return result;
}

ap_abstract1_t AbstractState::join(std::vector<ap_abstract1_t> & a_values) {
	unsigned size = a_values.size();
	ap_manager_t * manager = getManager();
	if (size == 0) {
		ap_environment_t * env = ap_environment_alloc_empty();
		return ap_abstract1_bottom(manager, env);
	}
	std::vector<ap_environment_t*> envs;
	std::vector<ap_abstract1_t> values;
	envs.reserve(size);
	typedef ap_environment_t* ap_environment_t_p;
	for (ap_abstract1_t & abs : a_values) {
		envs.push_back(ap_abstract1_environment(manager, &abs));
	}
	ap_dimchange_t** ptdimchange;
	ap_environment_t * environment = ap_environment_lce_array(
			envs.data(), envs.size(), &ptdimchange);
	values.reserve(size);
	for (ap_abstract1_t & abs : a_values) {
		values.push_back(ap_abstract1_change_environment(
				manager, false, &abs, environment, true));
	}
	return ap_abstract1_join_array(manager, values.data(), values.size());
}

