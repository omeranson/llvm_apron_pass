#include <AbstractState.h>
#include <APStream.h>
#include <Function.h>
#include <BasicBlock.h>

#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalAlias.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

FunctionManager FunctionManager::instance;
FunctionManager & FunctionManager::getInstance() {
	return instance;
}

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

Function * FunctionManager::getFunction(llvm::GlobalAlias * alias) {
	llvm::GlobalValue * aliasee = alias->getAliasedGlobal();
	llvm::Function * function = llvm::dyn_cast<llvm::Function>(aliasee);
	if (!function) {
		return 0;
	}
	std::map<llvm::Function *, Function *>::iterator it =
			instances.find(function);
	Function * result;
	if (it == instances.end()) {
		result = new Alias(alias, function);
		instances.insert(std::make_pair(function, result));
	} else {
		result = it->second;
	}
	return result;
}

Function::Function(llvm::Function * function) : m_function(function), m_name(function->getName()) {}
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

const std::string & Function::getReturnValueName() {
	llvm::ReturnInst * returnInst = getReturnInstruction();
	llvm::Value * returnValue = returnInst->getReturnValue();
	ValueFactory * factory = ValueFactory::getInstance();
	Value * returnValueValue = factory->getValue(returnValue);
	return returnValueValue->getName();
}

bool Function::isSizeVariable(const char * varname) {
	if ((strncmp(varname, "size(", sizeof("size(")-1) == 0) &&
			varname[strlen(varname)-1] == ')') {
		return true;
	}
	return false;
}

bool Function::isOffsetVariable(const char * varname) {
	if ((strncmp(varname, "offset(", sizeof("offset(")-1) == 0) &&
			varname[strlen(varname)-1] == ')') {
		return true;
	}
	return false;
}

bool Function::isLastVariable(const char * varname) {
	if ((strncmp(varname, "last(", sizeof("last(")-1) == 0) &&
			varname[strlen(varname)-1] == ')') {
		return true;
	}
	return false;
}

bool Function::isFunctionParameter(const char * varname) {
	const llvm::Function::ArgumentListType & arguments = m_function->getArgumentList();
	for (const llvm::Argument & argument : arguments) {
		if (argument.getName() == varname) {
			return true;
		}
	}
	return false;
}

bool Function::isReturnValue(const char * varname) {
	llvm::ReturnInst * returnInst = getReturnInstruction();
	llvm::Value * returnValue = returnInst->getReturnValue();
	return (returnValue && (returnValue->getName() == varname));
}

bool Function::isVarInOut(const char * varname) {
	// Return true iff:
	// 	varname is argument
	// 	varname is last(*)
	// 	varname is size(*)
	// 	varname is the return value
	// XXX Memoize this value?
	return isSizeVariable(varname) ||
			// isOffsetVariable(varname) ||
			isLastVariable(varname) ||
			isReturnValue(varname) ||
			isFunctionParameter(varname);
}

ap_abstract1_t Function::trimAbstractValue(AbstractState & state) {
	ApronAbstractState apronAbstractState = state.m_apronAbstractState;
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
	result = ap_abstract1_minimize_environment(manager, true, &result);
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

std::vector<std::string> Function::getConstrainedUserPointers(AbstractState & state) {
	std::vector<std::string> userBuffers = getUserPointers();
	std::vector<std::string> result;
	for (const std::string & userBuffer : userBuffers) {
		const std::string & lastName = state.generateLastName(userBuffer, user_pointer_operation_write);
		if (state.m_apronAbstractState.isConstrained(lastName)) {
			result.push_back(userBuffer);
		}
	}
	return result;
}

void Function::pushBackIfConstrainsUserPointers(
		std::map<std::string, ApronAbstractState> & result,
		AbstractState & state,
		std::vector<std::string> & userBuffers) {
	std::vector<std::string> constrainedBuffers = getConstrainedUserPointers(state);
	for (const std::string & userBuffer : constrainedBuffers) {
		result.insert(std::make_pair(userBuffer, state.m_apronAbstractState));
	}
}

void Function::insertErrorState(std::multimap<std::string, ApronAbstractState> & states,
		const ApronAbstractState & baseState, const std::string & userBuffer, user_pointer_operation_e op) {
	const std::string & lastName = AbstractState::generateLastName(userBuffer, op);
	if (!baseState.isKnown(lastName)) {
		return;
	}
	auto copypair = states.insert(std::make_pair(
			userBuffer, baseState));
	ApronAbstractState & copy = copypair->second;
	// Add constraint: last() > size
	const std::string & sizeName = AbstractState::generateSizeName(userBuffer);
	copy.extend(lastName);
	copy.extend(sizeName);
	ap_texpr1_t * lastExpr = copy.asTexpr(lastName);
	ap_texpr1_t * sizeExpr = copy.asTexpr(sizeName);
	ap_texpr1_t * diff = ap_texpr1_binop(
			AP_TEXPR_SUB, lastExpr, sizeExpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t cons= ap_tcons1_make(AP_CONS_SUP, diff, copy.zero());
	copy.meet(cons);
}

std::multimap<std::string, ApronAbstractState> Function::getErrorStates() {
	std::multimap<std::string, ApronAbstractState> result;
	std::vector<std::string> userBuffers = getUserPointers();
	for (auto & memOpsState : m_successMemOpsAbstractStates) {
		for (std::string & userBuffer : userBuffers) {
			insertErrorState(result, memOpsState.second.m_apronAbstractState, userBuffer, user_pointer_operation_write);
			insertErrorState(result, memOpsState.second.m_apronAbstractState, userBuffer, user_pointer_operation_read);
		}

	}
	return result;
}

// TODO(oanson) This will have to be a map: buffer -> state
ApronAbstractState Function::getSuccessState() {
	ApronAbstractState result = ApronAbstractState::bottom();
	std::vector<ApronAbstractState> successStates;
	for (auto & memOpsState : m_successMemOpsAbstractStates) {
		successStates.push_back(memOpsState.second.m_apronAbstractState);
	}
	result.join(successStates);
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

const std::string & Function::getName() const {
	return m_name;
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

BasicBlock * Function::getRoot() const {
	BasicBlockManager & factory = BasicBlockManager::getInstance();
	llvm::BasicBlock & llvmEntry = m_function->getEntryBlock();
	BasicBlock * root = factory.getBasicBlock(&llvmEntry);
	return root;
}

Alias::Alias(llvm::GlobalAlias * alias, llvm::Function * function) :
		Function(function), m_alias(alias) {
	m_name = alias->getName();
}

std::vector<std::pair<std::string, std::string> > Alias::getArgumentStrings() {
	std::vector<std::pair<std::string, std::string> > result;
	const llvm::Function::ArgumentListType & arguments = m_function->getArgumentList();
	llvm::Instruction * bitCastInst = llvm::dyn_cast<llvm::ConstantExpr>(m_alias->getAliasee())->getAsInstruction();
	llvm::Type * type = bitCastInst->getType();
	int idx = 0;
	llvm::FunctionType * ftype = llvm::dyn_cast<llvm::FunctionType>(type->getPointerElementType());
	for (const llvm::Argument & argument : arguments) {
		result.push_back(std::make_pair(getTypeString(ftype->getParamType(idx)), argument.getName()));
		idx++;
	}
	delete bitCastInst;
	return result;
}

