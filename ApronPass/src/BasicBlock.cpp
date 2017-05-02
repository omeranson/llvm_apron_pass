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

void BasicBlock::updateAbstract1MetWithIncomingPhis(BasicBlock & basicBlock, AbstractState & otherAS) {
	Value * terminator = basicBlock.getTerminatorValue();
	terminator->updateAssumptions(&basicBlock, this, otherAS);
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::BasicBlock * llvmBB = getLLVMBasicBlock();
	for (auto iit = llvmBB->begin(), iie = llvmBB->end(); iit != iie; iit++) {
		llvm::PHINode * phi = llvm::dyn_cast<llvm::PHINode>(iit);
		if (!phi) {
			continue;
		}
		Value * phiValue = factory->getValue(phi);
		phiValue->updateAssumptions(&basicBlock, this, otherAS);
	}
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

void BasicBlock::updateAbstractStateMetWithIncomingPhis(
		BasicBlock & basicBlock, AbstractState & otherAS) {
	llvm::BasicBlock * llvmBB = getLLVMBasicBlock();
	ValueFactory * factory = ValueFactory::getInstance();
	for (auto iit = llvmBB->begin(), iie = llvmBB->end(); iit != iie; iit++) {
		llvm::PHINode * phi = llvm::dyn_cast<llvm::PHINode>(iit);
		if (!phi) {
			continue;
		}
		Value * phiValue = factory->getValue(phi);
		if (!phiValue->isPointer()) {
			continue;
		}
		llvm::Value * incoming = phi->getIncomingValueForBlock(
				basicBlock.getLLVMBasicBlock());
		Value * incomingValue = factory->getValue(incoming);
		const std::string & phiname = phiValue->getName();
		otherAS.m_mayPointsTo.forget(phiname);
		const std::set<std::string> * buffers = incomingValue->mayPointsToUserBuffers(otherAS);
		if (buffers) {
			auto & dest = otherAS.m_mayPointsTo.extend(phiname);
			for (const std::string & buffer : *buffers) {
				dest.insert(buffer);
			}
		}
	}
}

AbstractState BasicBlock::getAbstractStateWithAssumptions(
		BasicBlock & predecessor, AbstractState & state) {
	AbstractState otherAS = state;
	updateAbstractStateMetWithIncomingPhis(predecessor, otherAS);
	updateAbstract1MetWithIncomingPhis(predecessor, otherAS);
	return otherAS;
}

bool BasicBlock::join(BasicBlock & basicBlock, AbstractState & state) {
	AbstractState prev = getAbstractState();
	AbstractState otherAS = getAbstractStateWithAssumptions(basicBlock, state);
	bool isChanged = m_abstractState.join(otherAS);
	llvm::errs() << getName() << ": Joined from " << basicBlock.getName() << ":\n";
	llvm::errs() << "Prev: " << prev << "Other: " << otherAS << " New: " << getAbstractState();
	llvm::errs() << "isChanged: " << isChanged << " and " << bool(prev != getAbstractState()) << "\n";
	return isChanged;
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

void BasicBlock::update(AbstractState & state) {
	++updateCount;
	/* Process the block. Return true if the block's context is modified.*/

	ApronAbstractState & aas = state.m_apronAbstractState;
	AbstractState prev = state;
	llvm::BasicBlock::iterator it;
	for (it = m_basicBlock->begin(); it != m_basicBlock->end(); it ++) {
		llvm::Instruction & inst = *it;
		processInstruction(state, inst);
	}
	state.updateUserOperationAbstract1();
	std::vector<std::string> userBuffers = getFunction()->getUserPointers();
	bool isReduceChanged = state.reduce(userBuffers);
	if (Debug) {
		llvm::errs() << getName() << ": Update: " << prev << " -> " << state;
	}
}

Value * BasicBlock::getTerminatorValue() {
	llvm::BasicBlock * llvmThis = getLLVMBasicBlock();
	llvm::Instruction * terminator = llvmThis->getTerminator();
	ValueFactory * factory = ValueFactory::getInstance();
	return factory->getValue(terminator);
}

void BasicBlock::applyConstraints(
		std::list<ap_tcons1_t> & constraints) {
	if (constraints.empty()) {
		return;
	}
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	ap_tcons1_array_t array = createTcons1Array(getEnvironment(), constraints);
	aas.meet(array);
}

ap_abstract1_t BasicBlock::abstractOfTconsList(
		std::list<ap_tcons1_t> & constraints) {
	if (constraints.empty()) {
		return ap_abstract1_bottom(getManager(), getEnvironment());
	}
	ap_tcons1_array_t array = createTcons1Array(getEnvironment(), constraints);
	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			getManager(), getEnvironment(), &array);
	return abs;
}

void BasicBlock::processInstruction(AbstractState & state,
		llvm::Instruction & inst) {
	// TODO Circular dependancy (Still?)
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(&inst);
	if (!value) {
		//llvm::errs() << "Skipping UNKNOWN instruction: ";
		//inst.print(llvm::errs());
		//llvm::errs() << "\n";
		return;
	}
	if (value->isSkip()) {
		return;
	}
	//const llvm::DebugLoc & debugLoc = inst.getDebugLoc();
	//llvm::errs() << "Apron: Instruction: "
			//// << scope->getFilename() << ": "
			//<< debugLoc.getLine() << ": "
			//<< value->toString() << "\n";
	// TODO Is this needed?
	state.m_apronAbstractState.forget(value->getName());
	InstructionValue * instructionValue =
			static_cast<InstructionValue*>(value);
	instructionValue->update(state);
	if (state.m_apronAbstractState.isTop()) {
		llvm::errs() << "Warning: Instruction " << value->getName() << " caused state to be top\n";
	}
}

std::string BasicBlock::toString() {
	std::ostringstream oss;
	ApronAbstractState & aas = getAbstractState().m_apronAbstractState;
	oss << getName() << ": " << getAbstractState() << "\n";
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
