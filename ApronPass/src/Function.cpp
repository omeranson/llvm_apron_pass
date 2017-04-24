#include <AbstractState.h>
#include <APStream.h>
#include <Function.h>
#include <BasicBlock.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

FunctionManager FunctionManager::instance;
FunctionManager & FunctionManager::getInstance() {
	return instance;
}
Function * getFunction(llvm::Function * function);

Function * FunctionManager::getFunction(llvm::Function * function) {
	std::map<llvm::Function *, Function *>::iterator it =
			instances.find(function);
	Function * result;
	if (it == instances.end()) {
		result = new Function(function);
		instances.insert(std::make_pair(function, result));
	} else {
		result = it->second;
	}
	return result;
}

bool Function::isUserPointer(std::string & ptrname) {
	return ptrname.find("buf") == 0;
}

llvm::ReturnInst * Function::getReturnInstruction() {
	llvm::Function &F = *m_function;
	for (auto bbit = F.begin(), bbie = F.end(); bbit != bbie; bbit++) {
		llvm::BasicBlock & bb = *bbit;
		for (auto iit = bb.begin(), iie = bb.end(); iit != iie; iit++) {
			llvm::Instruction & inst = *iit;
			if (llvm::isa<llvm::ReturnInst>(inst)) {
				llvm::ReturnInst & result = llvm::cast<llvm::ReturnInst>(inst);
				return &result;
			}
		}
	}
	return NULL;
}

BasicBlock * Function::getReturnBasicBlock() {
	llvm::ReturnInst * returnInst = getReturnInstruction();
	llvm::BasicBlock * basicBlock = returnInst->getParent();
	BasicBlockManager & basicBlockManager = BasicBlockManager::getInstance();
	return basicBlockManager.getBasicBlock(basicBlock);
}

bool Function::isVarInOut(const char * varname) {
	// Return true iff:
	// 	varname is argument
	// 	varname is last(*,*)
	// 	varname is the return value
	// XXX Memoize this value?
	if ((strncmp(varname, "last(", sizeof("last(")-1) == 0) &&
			varname[strlen(varname)-1] == ')') {
		return true;
	}
	const llvm::Function::ArgumentListType & arguments = m_function->getArgumentList();
	for (const llvm::Argument & argument : arguments) {
		if (argument.getName() == varname) {
			return true;
		}
	}
	llvm::ReturnInst * returnInst = getReturnInstruction();
	llvm::Value * returnValue = returnInst->getReturnValue();
	if (returnValue->getName() == varname) {
		return true;
	}
	return false;
}

ap_abstract1_t Function::trimmedLastASAbstractValue() {
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	ApronAbstractState apronAbstractState = as.m_apronAbstractState;
	apronAbstractState.renameVarsForC();
	ap_abstract1_t & asAbstract1 = apronAbstractState.m_abstract1;
	ap_manager_t * manager = apron_manager;
	ap_environment_t * environment = ap_abstract1_environment(manager, &asAbstract1);

	// Forget all variables that are not arguments, 'last(*,*)', or the return value
	std::vector<ap_var_t> forgetVars;
	int env_size = environment->intdim;
	for (int cnt = 0; cnt < env_size; cnt++) {
		ap_var_t var = ap_environment_var_of_dim(environment, cnt);
		const char * varName = (const char*)var;
		if (!isVarInOut(varName)) {
			forgetVars.push_back(var);
		}
	}
	ap_abstract1_t result = ap_abstract1_forget_array(manager, false, &asAbstract1,
			forgetVars.data(), forgetVars.size(), false);
	result = ap_abstract1_minimize_environment(manager, false, &result);
	return result;
}

AbstractState & Function::getReturnAbstractState() {
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	return as;
}

std::vector<std::string> Function::getUserPointers() {
	std::vector<std::string> result;
	const llvm::Function::ArgumentListType & arguments = m_function->getArgumentList();
	for (const llvm::Argument & argument : arguments) {
		std::string name = argument.getName().str();
		if (isUserPointer(name)) {
			result.push_back(name);
		}
	}
	return result;
}

std::map<std::string, ap_abstract1_t> Function::generateErrorStates() {
	//ap_abstract1_t trimmedASAbstract1 = trimmedLastASAbstractValue();
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	ApronAbstractState apronAbstractState = as.m_apronAbstractState;
	apronAbstractState.renameVarsForC();
	ap_abstract1_t & trimmedASAbstract1 = apronAbstractState.m_abstract1;
	BasicBlock * basicBlock = getReturnBasicBlock();
	ap_manager_t * manager = apron_manager;
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	// for each buf : user buffer:
	// 	create constraints: size(buf) > last(buf,read)
	// 	                    size(buf) > last(buf,write)
	// 	newAbstract1 <- meet with these constraints
	// 	newAbstract2 <- forget all last(*) values
	// 	push_back newAbstract2
	std::map<std::string, ap_abstract1_t> result;
	std::vector<std::string> userBuffers = getUserPointers();
	for (std::string & userBuffer : userBuffers) {
		std::string name;
		llvm::raw_string_ostream rso(name);
		rso << "size(" << userBuffer << ")";
		rso.str();
		ap_var_t name_var = (ap_var_t)name.c_str();

		ap_environment_t * environment = ap_abstract1_environment(
				manager, &trimmedASAbstract1);
		if (!ap_environment_mem_var(environment, name_var)) {
			environment = ap_environment_add(environment, &name_var, 1, NULL, 0);
		}
		const std::string & last_read_name = basicBlock->getAbstractState().generateLastName(
				userBuffer, user_pointer_operation_read);
		ap_var_t last_read_var = (ap_var_t)last_read_name.c_str();
		if (!ap_environment_mem_var(environment, last_read_var)) {
			environment = ap_environment_add(environment, &last_read_var, 1, NULL, 0);
		}
		const std::string & last_write_name = basicBlock->getAbstractState().generateLastName(
				userBuffer, user_pointer_operation_write);
		ap_var_t last_write_var = (ap_var_t)last_write_name.c_str();
		if (!ap_environment_mem_var(environment, last_write_var)) {
			environment = ap_environment_add(environment, &last_write_var, 1, NULL, 0);
		}

		ap_texpr1_t * size = ap_texpr1_var(environment, name_var);

		ap_texpr1_t * last_read = ap_texpr1_var(environment, last_read_var);
		ap_texpr1_t * size_last_read_diff = ap_texpr1_binop(
				AP_TEXPR_SUB, last_read, ap_texpr1_copy(size),
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t size_gt_last_read = ap_tcons1_make(
				AP_CONS_SUP, size_last_read_diff, zero);

		ap_texpr1_t * last_write = ap_texpr1_var(environment, last_write_var);
		ap_texpr1_t * size_last_write_diff = ap_texpr1_binop(
				AP_TEXPR_SUB, last_write, size,
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t size_gt_last_write = ap_tcons1_make(
				AP_CONS_SUP, size_last_write_diff, zero);

		ap_tcons1_array_t array = ap_tcons1_array_make(environment, 2);
		ap_tcons1_array_set(&array, 0, &size_gt_last_read);
		ap_tcons1_array_set(&array, 1, &size_gt_last_write);
		ap_abstract1_t abstract1_newenv = ap_abstract1_change_environment(
				manager, false, &trimmedASAbstract1, environment, false);
		ap_abstract1_t abstract1_with_size = ap_abstract1_meet_tcons_array(
				manager, false, &abstract1_newenv, &array);

		llvm::errs() << "Error state before forget for: " << name << ":" <<
				std::make_pair(manager, &abstract1_with_size);
		std::vector<ap_var_t> forgetVars;
		forgetVars.push_back(last_read_var);
		forgetVars.push_back(last_write_var);
		ap_abstract1_t abstract1_with_size_trimmed = ap_abstract1_forget_array(
				manager, false, &abstract1_with_size,
				forgetVars.data(), forgetVars.size(), false);
		ap_abstract1_t abstract1_minimized = ap_abstract1_minimize_environment(
				manager, false, &abstract1_with_size_trimmed);
		result[userBuffer] = abstract1_minimized;
	}
	return result;
}

std::string Function::getName() {
	return m_function->getName();
}

std::string Function::getTypeString(llvm::Type * type) {
		std::string result;
		llvm::raw_string_ostream rso(result);
		if (!type->isPointerTy()) {
			rso << *type;
			return rso.str();
		}
		llvm::Type * pointedType = type->getPointerElementType();
		if (pointedType->isStructTy()) {
			if (pointedType->getStructName() == "struct.iovec") {
				return "struct iovec *";
			}
			rso << "/*" << pointedType->getStructName() << "*/ ";
			// Fall through
		}
		rso << "char *";
		return rso.str();
}

std::string Function::getReturnTypeString() {
	return getTypeString(m_function->getReturnType());
}

std::vector<std::pair<std::string, std::string> > Function::getArgumentStrings() {
	std::vector<std::pair<std::string, std::string> > result;
	const llvm::Function::ArgumentListType & arguments = m_function->getArgumentList();
	for (const llvm::Argument & argument : arguments) {
		result.push_back(std::make_pair(getTypeString(argument.getType()), argument.getName()));
	}
	return result;
}

std::string Function::getSignature() {
	std::string result;
	llvm::raw_string_ostream rso(result);
	rso << getTypeString(m_function->getReturnType()) << " " << getName() << "(";
	auto arguments = getArgumentStrings();
	bool first = true;
	for (auto & argumentPair : arguments) {
		if (!first) {
			rso << ", ";
		}
		first = false;
		rso << argumentPair.first << " " << argumentPair.second;
	}
	rso << ")";
	return rso.str();
}

const std::vector<ImportIovecCall> & Function::getImportIovecCalls() {
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	return as.m_importedIovecCalls;
}

const std::vector<CopyMsghdrFromUserCall> & Function::getCopyMsghdrFromUserCalls() {
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	return as.m_copyMsghdrFromUserCalls;
}