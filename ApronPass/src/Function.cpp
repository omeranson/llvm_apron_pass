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
	// 	varname is last(*)
	// 	varname is size(*)
	// 	varname is the return value
	// XXX Memoize this value?
	if ((strncmp(varname, "last(", sizeof("last(")-1) == 0) &&
			varname[strlen(varname)-1] == ')') {
		return true;
	}
	if ((strncmp(varname, "size(", sizeof("size(")-1) == 0) &&
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

std::map<std::string, ApronAbstractState> Function::generateErrorStates() {
	//ap_abstract1_t trimmedASAbstract1 = trimmedLastASAbstractValue();
	BasicBlock * returnBasicBlock = getReturnBasicBlock();
	AbstractState & as = returnBasicBlock->getAbstractState();
	ApronAbstractState apronAbstractState = as.m_apronAbstractState;
	ap_manager_t * manager = apron_manager;
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	// for each buf : user buffer:
	// 	create constraints: size(buf) > last(buf,read)
	// 	                    size(buf) > last(buf,write)
	// 	newAbstract1 <- meet with these constraints
	// 	newAbstract2 <- forget all last(*) values
	// 	push_back newAbstract2
	std::map<std::string, ApronAbstractState> result;
	std::vector<std::string> userBuffers = getUserPointers();
	for (std::string & userBuffer : userBuffers) {
		ApronAbstractState aas = apronAbstractState;
		std::string name;
		llvm::raw_string_ostream rso(name);
		rso << "size(" << userBuffer << ")";
		aas.extend(rso.str());

		const std::string & last_read_name = AbstractState::generateLastName(
				userBuffer, user_pointer_operation_read);
		aas.extend(last_read_name);

		const std::string & last_write_name = AbstractState::generateLastName(
				userBuffer, user_pointer_operation_write);
		aas.extend(last_write_name);

		ap_texpr1_t * size = aas.asTexpr(name);

		ap_texpr1_t * last_read = aas.asTexpr(last_read_name);
		ap_texpr1_t * size_last_read_diff = ap_texpr1_binop(
				AP_TEXPR_SUB, last_read, ap_texpr1_copy(size),
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t size_gt_last_read = ap_tcons1_make(
				AP_CONS_SUP, size_last_read_diff, zero);

		ap_texpr1_t * last_write = aas.asTexpr(last_write_name);
		ap_texpr1_t * size_last_write_diff = ap_texpr1_binop(
				AP_TEXPR_SUB, last_write, size,
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t size_gt_last_write = ap_tcons1_make(
				AP_CONS_SUP, size_last_write_diff, zero);

		aas.start_meet_aggregate();
		aas.meet(size_gt_last_read);
		aas.meet(size_gt_last_write);
		aas.finish_meet_aggregate();
		result.insert(std::make_pair(userBuffer, aas));
	}
	return result;
}

ApronAbstractState Function::minimize(ApronAbstractState & state) {
	// Forget all variables that are not arguments, 'last(*,*)', size(*),
	// or the return value
	std::vector<ap_var_t> forgetVars;
	ap_environment_t * environment = state.getEnvironment();
	int env_size = environment->intdim;
	for (int cnt = 0; cnt < env_size; cnt++) {
		ap_var_t var = ap_environment_var_of_dim(environment, cnt);
		const char * varName = (const char*)var;
		if (!isVarInOut(varName)) {
			forgetVars.push_back(var);
		}
	}
	if (forgetVars.empty()) {
		return state;
	}
	ap_abstract1_t abstract1 = state.m_abstract1;
	ap_abstract1_t result = ap_abstract1_forget_array(apron_manager, false, &abstract1,
			forgetVars.data(), forgetVars.size(), false);
	result = ap_abstract1_minimize_environment(apron_manager, false, &result);
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
