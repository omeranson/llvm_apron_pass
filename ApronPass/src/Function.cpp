#include <APStream.h>
#include <Function.h>
#include <BasicBlock.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

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
	ap_abstract1_t & asAbstract1 = as.m_abstract1;
	ap_manager_t * manager = BasicBlockManager::getInstance().m_manager;
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
	return result;
}

ap_abstract1_t Function::trimmedLastBBAbstractValue() {
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	ap_abstract1_t & abstract1 = returnBasicBlock->getAbstractValue();
	ap_manager_t * manager = BasicBlockManager::getInstance().m_manager;
	ap_environment_t * environment = ap_abstract1_environment(manager, &abstract1);

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
	ap_abstract1_t result = ap_abstract1_forget_array(manager, false, &abstract1,
			forgetVars.data(), forgetVars.size(), false);
	return result;
}

ap_abstract1_t Function::trimmedLastJoinedAbstractValue() {
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	ap_manager_t * manager = BasicBlockManager::getInstance().m_manager;
	ap_environment_t * asEnv = ap_abstract1_environment(manager, &as.m_abstract1);
	ap_environment_t * bbEnv = ap_abstract1_environment(manager, &returnBasicBlock->getAbstractValue());
	ap_dimchange_t * dimchange1 = NULL;
	ap_dimchange_t * dimchange2 = NULL;
	ap_environment_t * environment = ap_environment_lce(
			asEnv, bbEnv, &dimchange1, &dimchange2);
	ap_abstract1_t asAbstract1 = ap_abstract1_change_environment(manager, false,
			&as.m_abstract1, environment, true);
	ap_abstract1_t bbAbstract1 = ap_abstract1_change_environment(manager, false,
			&returnBasicBlock->getAbstractValue(), environment, true);
	ap_abstract1_t abstract1 = ap_abstract1_join(manager, false, &asAbstract1, &bbAbstract1);

	llvm::errs() << "LastAbstrctValue, untrimmed: " << std::make_pair(manager, &abstract1);

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
	ap_abstract1_t result = ap_abstract1_forget_array(manager, false, &abstract1,
			forgetVars.data(), forgetVars.size(), false);
	return result;
}
