#include <BasicBlock.h>
#include <Value.h>
#include <Function.h>
extern "C" {
#include <Adaptor.h>
}
#include <APStream.h>

#include <cstdio>
#include <iostream>
#include <sstream>

#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Instructions.h>

#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>
#include <ap_tcons1.h>
#include <ap_lincons1.h>
#include <box.h>
#include <oct.h>
#include <pk.h>
#include <pkeq.h>
#include <ap_ppl.h>

unsigned WideningThreshold = 11;
extern bool Debug;
// TODO This should go in apron lib
void ap_tcons1_array_resize(ap_tcons1_array_t * array, size_t size) {
	ap_tcons0_array_resize(&(array->tcons0_array), size);
}

/*			       BasicBlockManager			     */
BasicBlockManager BasicBlockManager::instance;
BasicBlockManager & BasicBlockManager::getInstance() {
	return instance;
}

BasicBlock * BasicBlockManager::createBasicBlock(llvm::BasicBlock * basicBlock) {
	BasicBlock * result = new BasicBlock(basicBlock);
	return result;
}

BasicBlock * BasicBlockManager::getBasicBlock(llvm::BasicBlock * basicBlock) {
	std::map<llvm::BasicBlock *, BasicBlock *>::iterator it =
			instances.find(basicBlock);
	BasicBlock * result;
	if (it == instances.end()) {
		result = createBasicBlock(basicBlock);
		instances.insert(std::pair<llvm::BasicBlock *, BasicBlock *>(
				basicBlock, result));
	} else {
		result = it->second;
	}
	return result;
}

/*				   BasicBlock				     */
int BasicBlock::basicBlockCount = 0;

BasicBlock::BasicBlock(llvm::BasicBlock * basicBlock) :
		m_basicBlock(basicBlock),
		m_markedForChanged(false),
		updateCount(0) {
	if (!basicBlock->hasName()) {
		initialiseBlockName();
	}
}

void BasicBlock::initialiseBlockName() {
	std::ostringstream oss;
	oss << "BasicBlock-" << ++basicBlockCount;
	std::string sname = oss.str();
	llvm::Twine name(sname);
	m_basicBlock->setName(name);
}

std::string BasicBlock::getName() {
	return m_basicBlock->getName();
}

llvm::BasicBlock * BasicBlock::getLLVMBasicBlock() {
	return m_basicBlock;
}

ap_abstract1_t & BasicBlock::getAbstractValue() {
	return getAbstractState().m_apronAbstractState.m_abstract1;
}

ap_manager_t * BasicBlock::getManager() {
	// In a function, since manager is global, and this impl. may change
	return apron_manager;
}

ap_environment_t * BasicBlock::getEnvironment() {
	return getAbstractState().m_apronAbstractState.getEnvironment();
}

void BasicBlock::extendEnvironment(const std::string & varname) {
	getAbstractState().m_apronAbstractState.extend(varname, false);
}

void BasicBlock::extendEnvironment(Value * value) {
	extendEnvironment(value->getName());
}

void BasicBlock::forget(Value * value) {
	forget(value->getName());
}

void BasicBlock::forget(const std::string & varname) {
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	aas.forget(varname);
}

ap_interval_t * BasicBlock::getVariableInterval(const std::string & value) {
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	aas.extend(value);
	ap_var_t var = (ap_var_t)value.c_str();
	ap_interval_t* result = ap_abstract1_bound_variable(
			getManager(), &aas.m_abstract1, var);
	return result;
}

ap_interval_t * BasicBlock::getVariableInterval(Value * value) {
	return getVariableInterval(value->getName());
}

ap_texpr1_t* BasicBlock::getVariableTExpr(const std::string & value) {
	extendEnvironment(value);
	ap_var_t var = (ap_var_t)value.c_str();
	ap_texpr1_t* result = ap_texpr1_var(getEnvironment(), var);
	return result;
}

ap_texpr1_t* BasicBlock::getVariableTExpr(Value * value) {
	return getVariableTExpr(value->getName());
}

ap_texpr1_t* BasicBlock::getConstantTExpr(unsigned value) {
	return ap_texpr1_cst_scalar_int(getEnvironment(), value);
}

void BasicBlock::extendTexprEnvironment(ap_texpr1_t * texpr) {
	getAbstractState().m_apronAbstractState.extendEnvironment(texpr);
}

void BasicBlock::extendTconsEnvironment(ap_tcons1_t * tcons) {
	getAbstractState().m_apronAbstractState.extendEnvironment(tcons);
}

void BasicBlock::addOffsetConstraint(std::vector<ap_tcons1_t> & constraints,
		ap_texpr1_t * value_texpr, Value * dest, const std::string & pointerName) {
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	ap_texpr1_t * var_texpr = createUserPointerOffsetTreeExpression(
			dest, pointerName);
	ap_environment_t * environment = getEnvironment();
	ap_texpr1_extend_environment_with(value_texpr, environment);
	ap_texpr1_extend_environment_with(var_texpr, environment);
	ap_tcons1_t greaterThan0 = ap_tcons1_make(
			AP_CONS_SUPEQ, ap_texpr1_copy(var_texpr), zero);
	constraints.push_back(greaterThan0);
	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_SUB, value_texpr, var_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t result = ap_tcons1_make(AP_CONS_SUPEQ, texpr, zero);
	constraints.push_back(result);
}

ap_abstract1_t BasicBlock::getAbstract1MetWithIncomingPhis(BasicBlock & basicBlock) {
	ap_tcons1_array_t tconstraints_array = basicBlock.getBasicBlockConstraints(this);
	llvm::BasicBlock * llvmBB = getLLVMBasicBlock();
	ValueFactory * factory = ValueFactory::getInstance();
	std::vector<ap_tcons1_t> tconstraints;
	std::vector<ap_environment_t*> envs;
	std::vector<ap_var_t> phiVars;
	ap_abstract1_t other = basicBlock.getAbstractState().m_apronAbstractState.m_abstract1;
	ap_manager_t* manager = getManager();
	ap_environment_t * other_env = ap_abstract1_environment(manager, &other);
	for (auto iit = llvmBB->begin(), iie = llvmBB->end(); iit != iie; iit++) {
		// XXX(oanson) There is a mish-mash of GepValue code and BasicBlock code here.
		// Including but not limited to a lot of repeated code
		llvm::PHINode * phi = llvm::dyn_cast<llvm::PHINode>(iit);
		if (!phi) {
			continue;
		}
		Value * phiValue = factory->getValue(phi);
		llvm::Value * incoming = phi->getIncomingValueForBlock(
				basicBlock.getLLVMBasicBlock());
		Value * incomingValue = factory->getValue(incoming);
		if (!phi->getType()->isPointerTy()) {
			ap_tcons1_t tcons = phiValue->getSetValueTcons(this, incomingValue);
			tconstraints.push_back(tcons);
			envs.push_back(ap_tcons1_envref(&tcons));
			ap_var_t phiVar = (ap_var_t)phiValue->getName().c_str();
			if (ap_environment_mem_var(other_env, phiVar)) {
				phiVars.push_back(phiVar);
			}
		} else {
			// XXX(oanson) So basically this is the same as in GepValue
			std::string & incomingValueName = incomingValue->getName();
			if (llvm::isa<llvm::Argument>(incoming)) {
				if (getFunction()->isUserPointer(incomingValueName)) {
					const std::string & generatedName = AbstractState::generateOffsetName(phiValue->getName(), incomingValueName);
					ap_var_t phiVar = (ap_var_t)generatedName.c_str();
					if (ap_environment_mem_var(other_env, phiVar)) {
						phiVars.push_back(phiVar);
					}
					ap_texpr1_t * value_texpr = ap_texpr1_cst_scalar_int(
							getEnvironment(), 0);
					addOffsetConstraint(tconstraints, value_texpr,
							phiValue, incomingValueName);
				}
			} else {
				AbstractState & otherAS = basicBlock.getAbstractState();
				std::set<std::string> & userPtrs = otherAS.m_mayPointsTo[incomingValueName];
				for (auto & srcPtrName : userPtrs) {
					const std::string & generatedName = AbstractState::generateOffsetName(phiValue->getName(), srcPtrName);
					ap_var_t phiVar = (ap_var_t)generatedName.c_str();
					if (ap_environment_mem_var(other_env, phiVar)) {
						phiVars.push_back(phiVar);
					}
					const std::string & generatedNameIncoming = AbstractState::generateOffsetName(incomingValue->getName(), srcPtrName);
					ap_texpr1_t * value_texpr = getVariableTExpr(generatedNameIncoming);
					addOffsetConstraint(tconstraints, value_texpr,
							phiValue, srcPtrName);
				}
			}
		}
	}
	unsigned oldsize = ap_tcons1_array_size(&tconstraints_array);
	unsigned size = tconstraints.size();
	unsigned newsize = oldsize + size;
	other = ap_abstract1_forget_array(manager, false, &other,
			phiVars.data(), phiVars.size(), false);
	if (newsize > 0) {
		ap_environment_t * environment = getEnvironment();
		envs.push_back(environment);
		envs.push_back(ap_tcons1_array_envref(&tconstraints_array));
		envs.push_back(ap_abstract1_environment(manager, &other));
		ap_dimchange_t ** ptdimchange = 0;
		environment = ap_environment_lce_array(envs.data(), envs.size(), &ptdimchange);
		ap_tcons1_array_extend_environment_with(&tconstraints_array, environment);
		other = ap_abstract1_change_environment(manager, false,
				&other, environment, false);
		if (size > 0) {
			ap_tcons1_array_resize(&tconstraints_array, newsize);
			for (unsigned idx = 0; idx < size; idx++) {
				ap_tcons1_t & tcons = tconstraints[idx];
				ap_tcons1_extend_environment_with(&tcons, environment);
				bool failed = ap_tcons1_array_set(&tconstraints_array,
						oldsize+idx, &tcons);
				assert(!failed);
			}
		}

		if (ap_abstract1_is_bottom(manager, &other)) {
			other = ap_abstract1_of_tcons_array(manager, environment, &tconstraints_array);
		} else {
			other = ap_abstract1_meet_tcons_array(manager, false, &other, &tconstraints_array); 
		}
	}
	return other;
}

ap_texpr1_t * BasicBlock::createUserPointerOffsetTreeExpression(
		Value * value, const std::string & bufname) {
	return createUserPointerOffsetTreeExpression(value->getName(), bufname);
}

ap_texpr1_t * BasicBlock::createUserPointerOffsetTreeExpression(
		const std::string & valueName, const std::string & bufname) {
	const std::string & generatedName = AbstractState::generateOffsetName(valueName, bufname);
	return getVariableTExpr(generatedName);
}

ap_texpr1_t * BasicBlock::createUserPointerLastTreeExpression(
		const std::string & bufname, user_pointer_operation_e op) {
	const std::string & generatedName = AbstractState::generateLastName(bufname, op);
	return getVariableTExpr(generatedName);
}

AbstractState BasicBlock::getAbstractStateMetWithIncomingPhis(BasicBlock & basicBlock) {
	AbstractState & otherAS = basicBlock.getAbstractState();
	llvm::BasicBlock * llvmBB = getLLVMBasicBlock();
	ValueFactory * factory = ValueFactory::getInstance();
	for (auto iit = llvmBB->begin(), iie = llvmBB->end(); iit != iie; iit++) {
		llvm::PHINode * phi = llvm::dyn_cast<llvm::PHINode>(iit);
		if (!phi) {
			continue;
		}
		if (!phi->getType()->isPointerTy()) {
			continue;
		}
		Value * phiValue = factory->getValue(phi);
		llvm::Value * incoming = phi->getIncomingValueForBlock(
				basicBlock.getLLVMBasicBlock());
		Value * incomingValue = factory->getValue(incoming);
		std::set<std::string> &dest =
				otherAS.m_mayPointsTo[phiValue->getName()];
		dest.clear();
		incomingValue->populateMayPointsToUserBuffers(dest);
	}
	return otherAS;
}

bool BasicBlock::join(BasicBlock & basicBlock) {
	ap_abstract1_t other = getAbstract1MetWithIncomingPhis(basicBlock);
	AbstractState otherAS = getAbstractStateMetWithIncomingPhis(basicBlock);
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	bool isChanged = aas.join(other);
	bool isASChanged = m_abstractState.join(otherAS);
	return isChanged || isASChanged;
}


bool BasicBlock::isTop(ap_abstract1_t & value) {
	return ap_abstract1_is_top(getManager(), &value);
}

bool BasicBlock::isBottom(ap_abstract1_t & value) {
	return ap_abstract1_is_bottom(getManager(), &value);
}

bool BasicBlock::isTop() {
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	return aas.isTop();
}

bool BasicBlock::isBottom() {
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	return aas.isBottom();
}

void BasicBlock::setChanged() {
	m_markedForChanged = true;
}

bool BasicBlock::update() {
	++updateCount;
	/* Process the block. Return true if the block's context is modified.*/
	std::list<ap_tcons1_t> constraints;

	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	ap_abstract1_t prev = aas.m_abstract1;
	llvm::BasicBlock::iterator it;
	for (it = m_basicBlock->begin(); it != m_basicBlock->end(); it ++) {
		llvm::Instruction & inst = *it;
		processInstruction(constraints, inst);
	}

	ap_manager_t * manager = getManager();
	ap_environment_t* env = getEnvironment();
	ap_abstract1_t abs = applyConstraints(constraints);
	m_abstractState.updateUserOperationAbstract1();

	if (Debug) {
		llvm::errs() << getName() << ": Update: " <<std::make_pair(manager, &abs);
	}
	bool markedForChanged = m_markedForChanged;
	m_markedForChanged = false;
	bool isChanged = (aas != prev);
	return markedForChanged || isChanged;
}

void BasicBlock::makeTop() {
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	aas = ApronAbstractState::top();
}

ap_tcons1_array_t BasicBlock::getBasicBlockConstraints(BasicBlock * basicBlock) {
	llvm::BasicBlock * llvmThis = getLLVMBasicBlock();
	llvm::Instruction * terminator = llvmThis->getTerminator();
	ValueFactory * factory = ValueFactory::getInstance();
	TerminatorInstructionValue * terminatorValue = static_cast<TerminatorInstructionValue*>(
			factory->getValue(terminator));
	return terminatorValue->getBasicBlockConstraints(basicBlock);
}

ap_abstract1_t BasicBlock::applyConstraints(
		std::list<ap_tcons1_t> & constraints) {
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	if (!constraints.empty()) {
		ap_tcons1_array_t array = createTcons1Array(constraints);
		ap_abstract1_t abs = ap_abstract1_meet_tcons_array(
				getManager(), false, &aas.m_abstract1, &array);
		aas.m_abstract1 = abs;
	}
	return aas.m_abstract1;
}

ap_abstract1_t BasicBlock::abstractOfTconsList(
		std::list<ap_tcons1_t> & constraints) {
	if (constraints.empty()) {
		return ap_abstract1_bottom(getManager(), getEnvironment());
	}
	ap_tcons1_array_t array = createTcons1Array(constraints);
	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			getManager(), getEnvironment(), &array);
	return abs;
}

ap_tcons1_array_t BasicBlock::createTcons1Array(
		std::list<ap_tcons1_t> & constraints) {
	ap_tcons1_array_t array = ap_tcons1_array_make(
			getEnvironment(), constraints.size());
	int idx = 0;
	std::list<ap_tcons1_t>::iterator it;
	for (it = constraints.begin(); it != constraints.end(); it++) {
		ap_tcons1_t & constraint = *it;
		ap_tcons1_t constraint2 = ap_tcons1_copy(&constraint);
		extendTconsEnvironment(&constraint2);
		bool failed = ap_tcons1_array_set(&array, idx++, &constraint2);
		assert(!failed);
	}
	return array;
}

void BasicBlock::processInstruction(std::list<ap_tcons1_t> & constraints,
		llvm::Instruction & inst) {
	const llvm::DebugLoc & debugLoc = inst.getDebugLoc();
	// TODO Circular dependancy
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(&inst);
	if (!value) {
		//llvm::errs() << "Skipping UNKNOWN instruction: ";
		//inst.print(llvm::errs());
		//llvm::errs() << "\n";
		return;
	}
	if (value->isSkip()) {
		/*llvm::errs() << "Skipping set-skipped instruction: " << value->toString() << "\n";*/
		return;
	}
	//llvm::errs() << "Apron: Instruction: "
			//// << scope->getFilename() << ": "
			//<< debugLoc.getLine() << ": "
			//<< value->toString() << "\n";
	forget(value);
	InstructionValue * instructionValue =
			static_cast<InstructionValue*>(value);
	instructionValue->populateTreeConstraints(constraints);
}

std::string BasicBlock::toString() {
	std::ostringstream oss;
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	oss << getName() << ": " << &aas.m_abstract1
			<< "AND " << getAbstractState() << "\n";
	return oss.str();
}


AbstractState & BasicBlock::getAbstractState() {
	return m_abstractState;
}

Function * BasicBlock::getFunction() {
	FunctionManager & manager = FunctionManager::getInstance();
	llvm::Function * function = m_basicBlock->getParent();
	return manager.getFunction(function);
}

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock& basicBlock) {
	ro << basicBlock.toString();
	return ro;
}

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock* basicBlock) {
	ro << basicBlock->toString();
	return ro;
}

std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock) {
	os << basicBlock->toString();
	return os;
}

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock) {
	os << basicBlock.toString();
	return os;
}
