#include <AbstractState.h>
#include <BasicBlock.h>

ap_texpr1_t* MemoryAccessAbstractValue::createMemoryPointerTExpr(
		std::string & name) {
	ap_var_t var = (ap_var_t)name.c_str();
	if (!ap_environment_mem_var(m_environment, var)) {
		m_environment = ap_environment_add(m_environment, &var, 1,
				0, 0);
	}
	ap_texpr1_t* result = ap_texpr1_var(m_environment, var);
	return result;
}


MemoryAccessAbstractValue::MemoryAccessAbstractValue(ap_environment_t * env,
		std::string & userPtr,
		ap_texpr1_t * offset,
		ap_texpr1_t * size) : m_environment(env) {
	// TODO definitely make into a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	ap_texpr1_t * apUserPtr = createMemoryPointerTExpr(userPtr);
	offset = ap_texpr1_extend_environment(offset, m_environment);
	size = ap_texpr1_extend_environment(size, m_environment);
	ap_texpr1_t * end = ap_texpr1_binop(
			AP_TEXPR_ADD, ap_texpr1_copy(offset), size,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_texpr1_t * startExpr = ap_texpr1_binop(
			AP_TEXPR_SUB, ap_texpr1_copy(apUserPtr), offset,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t start = ap_tcons1_make(AP_CONS_SUPEQ, startExpr, zero);
	ap_texpr1_t * endExpr = ap_texpr1_binop(
			AP_TEXPR_SUB, end, apUserPtr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t endCons = ap_tcons1_make(AP_CONS_SUPEQ, endExpr, zero);
	m_constraints = ap_tcons1_array_make(m_environment, 2);
	ap_tcons1_array_set(&m_constraints, 0, &start);
	ap_tcons1_array_set(&m_constraints, 1, &endCons);
}

///////////////////////////////////////////////////////////////////////////////

AbstractState::AbstractState() :
		m_abstract1(ap_abstract1_bottom(getManager(), ap_environment_alloc_empty())) {
}

std::map<std::string, std::string> AbstractState::g_userPointerNames[user_pointer_operation_count];

std::string & AbstractState::getUserPointerName(std::string & userPtr, user_pointer_operation_e op) {
	std::map<std::string, std::string> & opNames = g_userPointerNames[op];
	// TODO(oanson) Optimise with lower_bound
	auto it = opNames.find(userPtr);
	if (it != opNames.end()) {
		return it->second;
	}
	std::string value = userPtr;
	switch (op) {
	case user_pointer_operation_read:
		value += "_read";
		break;
	case user_pointer_operation_write:
		value += "_write";
		break;
	case user_pointer_operation_first0:
		value += "_first0";
		break;
	default:
		llvm::errs() << "getUserPointerName: unknown operation\n";
		abort();
	}
	opNames[userPtr] = value;
	// We return the actual object in the map, in case the inner pointer
	// during copy
	return opNames[userPtr];
}

ap_manager_t * AbstractState::getManager() const {
	return BasicBlockManager::getInstance().m_manager;
}

void AbstractState::updateUserOperationAbstract1() {
	ap_manager_t * manager = getManager();
	// Construct the environment
	unsigned size = memoryAccessAbstractValues.size();
	std::vector<ap_abstract1_t> values;
	for (unsigned idx = 0; idx < size; idx++) {
		values.push_back(ap_abstract1_of_tcons_array(manager,
				memoryAccessAbstractValues[idx].m_environment,
				&memoryAccessAbstractValues[idx].m_constraints));
	}
	ap_abstract1_t abstract = join(values);
	joinAbstract1(&abstract);
}

template <class T>
bool AbstractState::joinGeneral(T & dest, T & src) {
	if (dest == src) {
		return false;
	}
	dest = src;
	return true;
}

bool AbstractState::joinUserPointerOffsetsType(
		user_pointer_offsets_type & dest,
		user_pointer_offsets_type & src) {
	bool isChanged = false;
	for (auto &srcUserPtrOffsets : src)
	{
		/************************************************************/
		/* [2] extract the set of pairs <bufi, OFFSET_LINE(*)_BUFi> */
		/************************************************************/
		std::string srcUserBufferName = srcUserPtrOffsets.first;

		/********************************************/
		/* [3] extract all pairs <BUFi,OFFSET_BUFi> */
		/********************************************/
		auto userBufferNameIt = dest.find(srcUserBufferName);
		if (userBufferNameIt == dest.end()) {
			isChanged = true;
			dest[srcUserBufferName] = srcUserPtrOffsets.second;
		} else {
			isChanged = joinGeneral(userBufferNameIt->second,
					srcUserPtrOffsets.second) || isChanged;
		}
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
			isChanged = joinUserPointerOffsetsType(
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
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_abstract1_fprint(bufferfp, getManager(), &m_abstract1);
	fclose(bufferfp);
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
	return ap_abstract1_join(manager, false, &lcl_val1, &lcl_val2);
}

ap_abstract1_t AbstractState::join(std::vector<ap_abstract1_t> & a_values) {
	unsigned size = a_values.size();
	ap_manager_t * manager = getManager();
	if (size == 0) {
		ap_environment_t * env = ap_environment_alloc_empty();
		return ap_abstract1_bottom(manager, env);
	}
	ap_abstract1_t values[size];
	typedef ap_environment_t* ap_environment_t_p;
	ap_environment_t_p envs[size];
	for (unsigned idx = 0; idx < size; idx++) {
		envs[idx] = ap_abstract1_environment(manager, &a_values[idx]);
	}
	ap_dimchange_t** ptdimchange;
	ap_environment_t * environment = ap_environment_lce_array(envs, size,
			&ptdimchange);
	for (unsigned idx = 0; idx < size; idx++) {
		values[idx] = ap_abstract1_change_environment(manager, false,
				&a_values[idx], environment, true);
	}
	return ap_abstract1_join_array(manager, values, size);
}

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, AbstractState & as) {
	ro << "{'mpt':{";
	for (auto & mpt : as.m_mayPointsTo) {
		ro << "'" << mpt.first << "':{";
		for (auto & userPtrs : mpt.second) {
			ro << "'" << userPtrs.first << "':{";
			//for (auto & offset : userPtrs.second) {
			//	ro << *offset << ",";
			//}
			ro << "},";
		}
		ro << "},";
	}
	ro << "},abstract1:{";
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_abstract1_canonicalize(as.getManager(), &as.m_abstract1);
	ap_abstract1_fprint(bufferfp, as.getManager(), &as.m_abstract1);
	fclose(bufferfp);
	ro << buffer << "}";
	return ro;
}
