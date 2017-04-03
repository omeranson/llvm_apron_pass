#include <AbstractState.h>
#include <BasicBlock.h>

extern bool Debug;

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
	typedef ap_environment_t * ap_environment_t_p;
	unsigned size = memoryAccessAbstractValues.size();
	if (Debug) {
		llvm::errs() << "Updating: " << size << " maavs\n";
	}
	ap_environment_t * environment = 0;
	if (size > 0) {
		// Construct the abstract value for each maav
		ap_abstract1_t values[size];
		ap_environment_t_p envs[size];
		for (unsigned idx = 0; idx < size; idx++) {
			envs[idx] = memoryAccessAbstractValues[idx].m_environment;
		}
		ap_dimchange_t** ptdimchange;
		environment = ap_environment_lce_array(envs, size, &ptdimchange);

		for (unsigned idx = 0; idx < size; idx++) {
			values[idx] = ap_abstract1_of_tcons_array(manager,
					memoryAccessAbstractValues[idx].m_environment,
					&memoryAccessAbstractValues[idx].m_constraints);
			values[idx] = ap_abstract1_change_environment(manager, false, &values[idx], environment, true);
		}
		// Set the new environment for each maav's abstract value (Don't have to)
		// Join all maav's abstract values
		ap_abstract1_t abstract = ap_abstract1_join_array(manager, values, size);
		joinAbstract1(&abstract);
		if (Debug) {
			char * buffer;
			size_t size;
			FILE * bufferfp = open_memstream(&buffer, &size);
			ap_abstract1_fprint(bufferfp, manager, &m_abstract1);
			ap_environment_fdump(bufferfp, environment);
			fclose(bufferfp);
			llvm::errs() << "Updated: Abstract value: " <<
					buffer << "\n";
		}
	}
}

bool AbstractState::joinMayPointsTo(std::map<std::string, may_points_to_t > mpts){
	bool isChanged = false;
	for (auto & mpt : mpts) {
		std::string alias = mpt.first;
		may_points_to_t & other_pointers = mpt.second;
		may_points_to_t & my_pointers = may_points_to[alias];
		if (my_pointers == other_pointers) {
			continue;
		}
		isChanged = true;
		for (auto & pointer : other_pointers) {
			std::string ptrName = pointer.first;
			std::set<llvm::Value *> & offsets = pointer.second;
			my_pointers[ptrName].insert(
					offsets.begin(), offsets.end());
		}
	}
	return isChanged;
}

bool AbstractState::joinAbstract1(ap_abstract1_t * abstract1) {
	ap_manager_t * manager = getManager();
	ap_abstract1_t prev = m_abstract1;
	ap_dimchange_t * dimchange1 = NULL;
	ap_dimchange_t * dimchange2 = NULL;
	ap_environment_t * environment = ap_environment_lce(
			ap_abstract1_environment(manager, &m_abstract1),
			ap_abstract1_environment(manager, abstract1),
			&dimchange1, &dimchange2);
	m_abstract1 = ap_abstract1_change_environment(manager, false, &m_abstract1, environment, true);
	ap_abstract1_t lcl_abst_val = ap_abstract1_change_environment(manager, false, abstract1, environment, true);
	m_abstract1 = ap_abstract1_join(manager, false,
			&m_abstract1, &lcl_abst_val);
	bool isChanged = !(ap_environment_is_eq(
				ap_abstract1_environment(manager, &m_abstract1),
				ap_abstract1_environment(manager, &prev)) &&
			(ap_abstract1_is_eq(manager, &m_abstract1, &prev)));
	return isChanged;
}

bool AbstractState::join(AbstractState & as) {
	bool isChanged = false;
	// Join 'May' reference
	//typedef std::map<std::string, std::set<llvm::Value *> > may_points_to_t;
	//std::map<std::string, may_points_to_t > may_points_to;
	joinMayPointsTo(as.may_points_to);
	// Join (Apron) analysis of integers
	// TODO(oanson) TBD
	// Join (Apron) analysis of (user) read/write/last0 pointers
	isChanged = joinAbstract1(&as.m_abstract1) | isChanged;
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_abstract1_fprint(bufferfp, getManager(), &m_abstract1);
	fclose(bufferfp);
	if (Debug) {
		llvm::errs() << "Joined. changed: " << isChanged << " Abstract value: " <<
				buffer << "\n";
	}
	return isChanged;
}

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, AbstractState & as) {
	ro << "{'mpt':{";
	for (auto & mpt : as.may_points_to) {
		ro << "'" << mpt.first << "':{";
		for (auto & userPtrs : mpt.second) {
			ro << "'" << userPtrs.first << "':{";
			for (auto & offset : userPtrs.second) {
				ro << *offset << ",";
			}
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
