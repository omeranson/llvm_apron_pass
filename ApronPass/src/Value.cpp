/************************/
/* INCLUDE FILES :: STL */
/************************/
#include <sstream>
#include <string>
#include <iostream>
#include <cstdlib>

/*************************/
/* PROJECT INCLUDE FILES */
/*************************/
#include <APStream.h>
#include <AbstractState.h>
#include <Function.h>
#include <Value.h>

/*************************/
/* INCLUDE FILES :: llvm */
/*************************/
#include <llvm/Pass.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Module.h>
//#include <llvm/IR/DebugLoc.h>
#include <llvm/DebugInfo.h>
#include <llvm/IR/Constants.h>

typedef enum {
	cons_cond_eq,
	cons_cond_eqmod,
	cons_cond_neq,
	cons_cond_gt,
	cons_cond_ge,
	cons_cond_lt,
	cons_cond_le,
	cons_cond_true,
	cons_cond_false
} constraint_condition_t;

void appendValueName(std::ostringstream & oss,
		Value * value, std::string missing) {
	if (value) {
		oss << value->getName();
	} else {
		oss << missing;
	}
}

void appendValue(std::ostringstream & oss,
		Value * value, std::string missing) {
	if (value) {
		oss << value->getValueString();
	} else {
		oss << missing;
	}
}

class NopInstructionValue : public InstructionValue {
public:
	NopInstructionValue(llvm::Value * value) : InstructionValue(value) {}
	virtual bool isSkip() { return true; }
};

class AllocaValue : public InstructionValue {
public:
	AllocaValue(llvm::Value * value) : InstructionValue(value) {}
	virtual void update(AbstractState & state);
	virtual bool isSkip();
};

bool AllocaValue::isSkip() {
	return false;
}

void AllocaValue::update(AbstractState & state) {
	MPTItemAbstractState & pt = state.m_mayPointsTo.m_mayPointsTo[getName()];
	pt.clear();
	pt.insert("kernel");
}

class LoadValue : public InstructionValue {
protected:
	llvm::LoadInst * asLoadInst();
public:
	LoadValue(llvm::Value * value) : InstructionValue(value) {}
	virtual void update(AbstractState & state);
	virtual bool isSkip();
};

llvm::LoadInst * LoadValue::asLoadInst() {
	return &llvm::cast<llvm::LoadInst>(*m_value);
}

void LoadValue::update(AbstractState & state) {
	Value * srcValue = getOperandValue(0);
	MPTAbstractState & mptas = state.m_mayPointsTo;
	MPTItemAbstractState * pt = mptas.find(srcValue->getName());
	if (!pt) {
		// Value is top.
		llvm::errs() << "WARNING: Direct load from top pointer: " << srcValue->getName() << "\n";
		if (!isPointer()) {
			havoc(state);
		}
		return;
	}
	pt->erase("null");
	if (isPointer()) {
		MPTItemAbstractState & destpt = state.m_mayPointsTo.m_mayPointsTo[getName()];
		if (pt->isProvablyKernel()) {
			destpt = *pt;
			return;
		}
		destpt.clear();
		for (std::string & buffer : getFunction()->getUserPointers()) {
			destpt.insert(buffer);
		}
		if (!pt->contains("kernel")) {
			pt->erase("kernel");
		}
	} else {
		havoc(state);
	}
	if (!pt->isProvablyKernel()) {
		llvm::errs() << "WARNING: Direct load from user pointer: " << srcValue->getName() << "\n";
	}
}

bool LoadValue::isSkip() {
	return false;
}

class StoreValue : public InstructionValue {
protected:
	virtual llvm::StoreInst * asStoreInst();
public:
	StoreValue(llvm::Value * value) : InstructionValue(value) {}
	virtual void update(AbstractState & state);
	virtual bool isSkip();
};

llvm::StoreInst * StoreValue::asStoreInst() {
	return &llvm::cast<llvm::StoreInst>(*m_value);
}
void StoreValue::update(AbstractState & state) {
	Value * destValue = getOperandValue(1);
	MPTItemAbstractState * pt = state.m_mayPointsTo.find(destValue->getName());
	if (!pt) {
		// Value is top. Do nothing
		llvm::errs() << "WARNING: Direct store to top pointer: " << destValue->getName() << "\n";
		return;
	}
	pt->erase("null");
	if (!pt->isProvablyKernel()) {
		llvm::errs() << "WARNING: Direct store to user pointer: " << destValue->getName() << "\n";
	}
}

bool StoreValue::isSkip() {
	return false;
}

class GepValue : public InstructionValue {
public:
	virtual llvm::GetElementPtrInst * asGetElementPtrInst();
public:
	GepValue (llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip() { return false; }
	virtual void update(AbstractState & state);
};

llvm::GetElementPtrInst * GepValue::asGetElementPtrInst() {
	return &llvm::cast<llvm::GetElementPtrInst>(*m_value);
}

std::string GepValue::getValueString() {
	std::string s;
	llvm::raw_string_ostream rso(s);
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::GetElementPtrInst * gepi = asGetElementPtrInst();
	Value * pointer = factory->getValue(gepi->getOperand(0));
	Value * offset = factory->getValue(gepi->getOperand(1));
	rso << "&" << pointer->getName() << "[" << offset->getName() << "]";
	return rso.str();
}

void GepValue::update(AbstractState & state) {
	Function * function = getFunction();

	Value * src = getOperandValue(0);
	assert(src != this && "SSA assumption broken");

	Value * offset = getOperandValue(1);

	std::string pointerName = src->getName();
	MPTItemAbstractState * srcUserPointers = state.m_mayPointsTo.find(pointerName);
	if (!srcUserPointers) {
		// is top
		llvm::errs() << "Setting pt for " << getName() << " to top since pt for " << pointerName << " is top\n";
		state.m_mayPointsTo.forget(getName());
		return;
	}
	MPTItemAbstractState & dest = state.m_mayPointsTo.m_mayPointsTo[getName()];
	dest.clear();
	ap_texpr1_t * offset_texpr = offset->createTreeExpression(state);
	for (auto & srcPtrName : *srcUserPointers) {
		dest.insert(srcPtrName);
		const std::string & offsetVar = AbstractState::generateOffsetName(
				src->getName(), srcPtrName);
		ap_texpr1_t * offset_var_texpr = state.m_apronAbstractState.asTexpr(offsetVar);		ap_texpr1_t * offset_texpr_copy = ap_texpr1_copy(offset_texpr);
		state.m_apronAbstractState.extendEnvironment(offset_texpr_copy);
		state.m_apronAbstractState.extendEnvironment(offset_var_texpr);
		ap_texpr1_t * value_texpr = ap_texpr1_binop(AP_TEXPR_ADD,
				offset_texpr_copy, offset_var_texpr,
				AP_RTYPE_INT, AP_RDIR_ZERO);
		assert(value_texpr);
		const std::string & offsetName = AbstractState::generateOffsetName(
				getName(), srcPtrName);
		state.m_apronAbstractState.assign(offsetName, value_texpr);
	}
	ap_texpr1_free(offset_texpr);
}

class VariableValue : public Value {
protected:
	virtual llvm::Argument * asArgument();
	virtual Function * getFunction();
	std::set<std::string> userPointers;
public:
	VariableValue(llvm::Value * value) : Value(value) {
		std::string & name = getName();
		if (getFunction()->isUserPointer(name)) {
			userPointers.insert(name);
		}
	}
	virtual std::string getValueString();
	virtual std::string toString() ;
	virtual const std::set<std::string> * mayPointsToUserBuffers(AbstractState & state);
};
std::string VariableValue::getValueString() {
	return getName();
}

std::string VariableValue::toString() {
	return getName();
}

llvm::Argument * VariableValue::asArgument() {
	return &llvm::cast<llvm::Argument>(*m_value);
}

Function * VariableValue::getFunction() {
	FunctionManager & manager = FunctionManager::getInstance();
	llvm::Function * function = asArgument()->getParent();
	return manager.getFunction(function);
}

const std::set<std::string> * VariableValue::mayPointsToUserBuffers(AbstractState & state) {
	return &userPointers;
}

llvm::Instruction * InstructionValue::asInstruction() {
	return &llvm::cast<llvm::Instruction>(*m_value);
}

void InstructionValue::update(AbstractState & state) {
	if (isPointer()) {
		state.m_mayPointsTo.forget(getName());
		return;
	}
	state.m_apronAbstractState.extend(getName());
	ap_texpr1_t * value_texpr = createRHSTreeExpression(state);
	assert(value_texpr && "RHS Tree expression is NULL");
	state.m_apronAbstractState.assign(getName(), value_texpr);
}

ap_texpr1_t * InstructionValue::createRHSTreeExpression(AbstractState & state) {
	abort();
}

const std::set<std::string> * InstructionValue::mayPointsToUserBuffers(AbstractState & state) {
	MPTItemAbstractState * asbuffers = state.m_mayPointsTo.find(getName());
	if (!asbuffers) {
		return 0;
	}
	return &asbuffers->getBuffers();
}

bool InstructionValue::isSkip() {
	return true;
}

BasicBlock * InstructionValue::getBasicBlock() {
	llvm::Instruction * instruction = asInstruction();
	llvm::BasicBlock * llvmBasicBlock = instruction->getParent();
	BasicBlockManager & factory = BasicBlockManager::getInstance();
	BasicBlock * result = factory.getBasicBlock(llvmBasicBlock);
	return result;
}

Function * InstructionValue::getFunction() {
	return getBasicBlock()->getFunction();
}

Value * InstructionValue::getOperandValue(int idx) {
	llvm::Instruction * inst = asInstruction();
	llvm::Value * operand = inst->getOperand(idx);
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(operand);
	return value;
}

bool TerminatorInstructionValue::isSkip() {
	return true;
}

class ReturnInstValue : public TerminatorInstructionValue {
friend class ValueFactory;
protected:
	llvm::ReturnInst * asReturnInst() ;
public:
	ReturnInstValue(llvm::Value * value) : TerminatorInstructionValue(value) {}
	virtual std::string toString() ;
	virtual bool isSkip() { return false; }
	virtual void update(AbstractState & state) {
		//ApronAbstractState copy = state.m_apronAbstractState;
		Function * function = getFunction();
		//ApronAbstractState minimized = function->minimize(copy);
		//function->m_returnValueState.join(minimized);
		function->m_returnValueState = state.m_apronAbstractState;
	}
};

llvm::ReturnInst * ReturnInstValue::asReturnInst()  {
	return &llvm::cast<llvm::ReturnInst>(*m_value);
}

std::string ReturnInstValue::toString()  {
	std::ostringstream oss;
	oss << "Return (";
	llvm::Value * llvmValue = asReturnInst()->getReturnValue();
	if (llvmValue) {
		ValueFactory * factory = ValueFactory::getInstance();
		Value * val = factory->getValue(llvmValue);
		if (val) {
			oss << val->getName();
		} else {
			oss << "<Return Value Unknown>";
		}
	} else {
		oss << "null";
	}
	oss << ")";
	return oss.str();
}

class BinaryOperationValue : public InstructionValue {
friend class ValueFactory;
protected:
	llvm::BinaryOperator * asBinaryOperator() ;
	llvm::User * asUser() ;
	virtual std::string getOperationSymbol()  = 0;
	virtual ap_texpr_op_t getTreeOperation()  = 0;
	virtual std::string getValueString() ;
	virtual ap_texpr1_t * createRHSTreeExpression(AbstractState & state);
public:
	BinaryOperationValue(llvm::Value * value) : InstructionValue(value) {}
	virtual ap_texpr1_t * createOperandTreeExpression(AbstractState & state, int idx);
	virtual bool isSkip();
};

llvm::BinaryOperator * BinaryOperationValue::asBinaryOperator()  {
	return &llvm::cast<llvm::BinaryOperator>(*m_value);
}

llvm::User * BinaryOperationValue::asUser()  {
	return &llvm::cast<llvm::User>(*m_value);
}

std::string BinaryOperationValue::getValueString()  {
	llvm::User * binaryOp = asUser();
	llvm::User::op_iterator it;
	std::string op_symbol = getOperationSymbol();
	ValueFactory * factory = ValueFactory::getInstance();
	bool is_first = true;
	std::ostringstream oss;
	oss << "(";
	for (it = binaryOp->op_begin(); it != binaryOp->op_end(); it++) {
		if (!is_first) {
			oss << " " << getOperationSymbol() << " ";
		}
		is_first = false;
		llvm::Value * llvmOperand = it->get();
		Value * operand = factory->getValue(llvmOperand);
		if (operand) {
			oss << operand->getName();
		} else {
			//llvmOperand->print(llvm::errs());
			//llvm::errs() << "\n";
			oss << "<Operand Unknown>";
		}
	}
	oss << ")";
	return oss.str();
}

bool BinaryOperationValue::isSkip() {
	return false;
}

ap_texpr1_t * BinaryOperationValue::createOperandTreeExpression(AbstractState & state, int idx) {
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * llvmOperand = asUser()->getOperand(idx);
	Value * operand = factory->getValue(llvmOperand);
	return operand->createTreeExpression(state);
}

ap_texpr1_t * BinaryOperationValue::createRHSTreeExpression(AbstractState & state) {
	ap_texpr1_t * op0_texpr = createOperandTreeExpression(state, 0);
	ap_texpr1_t * op1_texpr = createOperandTreeExpression(state, 1);
	ap_texpr_op_t operation = getTreeOperation();
	// TODO Handle reals
	// Align environments
	state.m_apronAbstractState.extendEnvironment(op0_texpr);
	state.m_apronAbstractState.extendEnvironment(op1_texpr);
	ap_texpr1_t * texpr = ap_texpr1_binop(
			operation, op0_texpr, op1_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	return texpr;
}

class AdditionOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "+"; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_ADD; }
public:
	AdditionOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class SubtractionOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "-"; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_SUB; }
public:
	SubtractionOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
	virtual void update(AbstractState & state);
};

void SubtractionOperationValue::update(AbstractState & state) {
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * left = asUser()->getOperand(0);
	llvm::Value * right = asUser()->getOperand(1);
	if (llvm::isa<llvm::PtrToIntInst>(left) && llvm::isa<llvm::PtrToIntInst>(right)) {
		llvm::Value * leftPtr = llvm::cast<llvm::PtrToIntInst>(
				*left).getPointerOperand();
		llvm::Value * rightPtr = llvm::cast<llvm::PtrToIntInst>(
				*right).getPointerOperand();

		ValueFactory * factory = ValueFactory::getInstance();
		Value * leftPtrVal = factory->getValue(leftPtr);
		Value * rightPtrVal = factory->getValue(rightPtr);

		MPTItemAbstractState * leftPT = state.m_mayPointsTo.find(leftPtrVal->getName());
		MPTItemAbstractState * rightPT = state.m_mayPointsTo.find(leftPtrVal->getName());
		if ((!leftPT) && (!rightPT)) {
			return; // Both top
		}
		if (!leftPT) {
			MPTItemAbstractState & leftPTNew = state.m_mayPointsTo.extend(leftPtrVal->getName());
			leftPTNew = *rightPT;
			leftPTNew.erase("null");
			return;
		}
		if (!rightPT) {
			state.m_mayPointsTo.extend(rightPtrVal->getName()) = *leftPT;
			return;
		}
		MPTItemAbstractState::updateToIntersection(*leftPT, *rightPT);
		return;
	}
	return BinaryOperationValue::update(state);
}

class MultiplicationOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "*"; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_MUL; }
public:
	MultiplicationOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class DivisionOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "/"; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_DIV; }
public:
	DivisionOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class RemainderOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "%"; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_MOD; }
public:
	RemainderOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};


class SHLOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return " << "; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_MOD; }
	virtual ap_texpr1_t * createRHSTreeExpression(AbstractState & state);
public:
	SHLOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

ap_texpr1_t * SHLOperationValue::createRHSTreeExpression(AbstractState & state) {
	ap_texpr1_t * op0_texpr = createOperandTreeExpression(state, 0);
	ap_texpr1_t * op1_texpr = createOperandTreeExpression(state, 1);
	// TODO Handle reals
	// Align environments
	state.m_apronAbstractState.extendEnvironment(op0_texpr);
	state.m_apronAbstractState.extendEnvironment(op1_texpr);
	ap_texpr1_t * two = state.m_apronAbstractState.asTexpr((int64_t)2);
	ap_texpr1_t * op1_shl = ap_texpr1_binop(
			AP_TEXPR_POW, two, op1_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_MUL, op0_texpr, op1_shl,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	return texpr;
}

class SHROperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return " >> "; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_MOD; }
	virtual bool updateByInverseMultiplication(AbstractState & state);
	virtual bool updateByInverseOfSHL(AbstractState & state);
public:
	SHROperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
	virtual void update(AbstractState & state);
};

bool SHROperationValue::updateByInverseMultiplication(AbstractState & state) {
	llvm::Value * count = asInstruction()->getOperand(1);
	llvm::ConstantInt * countAsConst = llvm::dyn_cast<llvm::ConstantInt>(count);
	if (!countAsConst) {
		return false;
	}
	bool isKnown = state.m_apronAbstractState.isKnown(getName());
	const std::string * name = &getName();
	if (isKnown) {
		static const std::string tmpname = "__tmp_updateByInverseMultiplication";
		name = &tmpname;
		state.m_apronAbstractState.extend(tmpname);
	}
	const llvm::APInt & apint = countAsConst->getValue();
	uint64_t svalue = apint.getZExtValue();
	uint64_t coeff = (1ll << svalue);
	state.m_apronAbstractState.extend(*name);
	Value * source = getOperandValue(0);
	ap_texpr1_t * sourceExpr = source->createTreeExpression(state);
	ap_texpr1_t * thisExpr = state.m_apronAbstractState.asTexpr(*name);
	ap_texpr1_t * coeffTexpr = state.m_apronAbstractState.asTexpr((int64_t)coeff);
	ap_texpr1_t * left = ap_texpr1_binop(
			AP_TEXPR_MUL, coeffTexpr, thisExpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_texpr1_t * expr = ap_texpr1_binop(
			AP_TEXPR_SUB, left, sourceExpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t cons = ap_tcons1_make(AP_CONS_EQ, expr, state.m_apronAbstractState.zero());
	state.m_apronAbstractState.meet(cons);
	if (isKnown) {
		state.m_apronAbstractState.forget(getName());
		state.m_apronAbstractState.rename(*name, getName());
	}
	return true;
}

bool SHROperationValue::updateByInverseOfSHL(AbstractState & state) {
	Value * countValue = getOperandValue(1);
	llvm::Value * source = asInstruction()->getOperand(0);
	llvm::BinaryOperator * sourceBO = llvm::dyn_cast<llvm::BinaryOperator>(source);
	if (!sourceBO) {
		return false;
	}
	if (sourceBO->getOpcode() != llvm::Instruction::Shl) {
		return false;
	}
	InstructionValue * sourceValue = static_cast<InstructionValue*>(getOperandValue(0));
	Value * shlCountValue = sourceValue->getOperandValue(1);
	ap_texpr1_t * countExpr = countValue->createTreeExpression(state);
	ap_texpr1_t * shlCountExpr = shlCountValue->createTreeExpression(state);
	bool iseq = ap_texpr1_equal(countExpr, shlCountExpr);
	ap_texpr1_free(countExpr);
	ap_texpr1_free(shlCountExpr);
	if (!iseq) {
		return false;
	}
	Value * sourceSourceValue = sourceValue->getOperandValue(0);
	ap_texpr1_t * sourceSourceExpr = sourceSourceValue->createTreeExpression(state);
	state.m_apronAbstractState.assign(getName(), sourceSourceExpr);
	return true;
}

void SHROperationValue::update(AbstractState & state) {
	if (updateByInverseOfSHL(state)) {
		return;
	}
	if (updateByInverseMultiplication(state)) {
		return;
	}
	havoc(state);
}

class ConstantValue : public Value {
protected:
	virtual std::string getValueString() ;
	virtual std::string getConstantString()  = 0;
	virtual ap_texpr1_t * createTreeExpression(ApronAbstractState & state)=0;
public:
	ConstantValue(llvm::Value * value) : Value(value) {}
	virtual bool isConstant() const;
};

std::string ConstantValue::getValueString()  {
	return getConstantString();
}

bool ConstantValue::isConstant() const {
	return true;
}

class ConstantIntValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
	virtual ap_texpr1_t * createTreeExpression(ApronAbstractState & state);
public:
	ConstantIntValue(llvm::Value * value) : ConstantValue(value) {}
	virtual unsigned getBitSize();
};

std::string ConstantIntValue::getConstantString()  {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	return apint.toString(10, true);
}

ap_texpr1_t * ConstantIntValue::createTreeExpression(
		ApronAbstractState & state) {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	int64_t svalue = apint.getSExtValue();
	ap_texpr1_t * result = state.asTexpr(svalue);
	return result;
}

unsigned ConstantIntValue::getBitSize() {
	return llvm::cast<llvm::ConstantInt>(*m_value).getBitWidth();
}

class ConstantFloatValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
	virtual ap_texpr1_t * createTreeExpression(ApronAbstractState & state);
public:
	ConstantFloatValue(llvm::Value * value) : ConstantValue(value) {}
};

std::string ConstantFloatValue::getConstantString()  {
	llvm::ConstantFP & fpValue = llvm::cast<llvm::ConstantFP>(*m_value);
	const llvm::APFloat & apfloat = fpValue.getValueAPF();
	llvm::SmallVector<char,10> str;
	apfloat.toString(str);
	std::string result(str.data(), str.size());
	return result;
	/*
	for (auto it = str.begin(); it != str.end(); it++) {
		oss << *it;
	}
	*/
}

ap_texpr1_t * ConstantFloatValue::createTreeExpression(
		ApronAbstractState & state) {
	llvm::ConstantFP & fpValue = llvm::cast<llvm::ConstantFP>(*m_value);
	const llvm::APFloat & apfloat = fpValue.getValueAPF();
	double value = apfloat.convertToDouble();
	ap_texpr1_t * result = state.asTexpr(value);
	return result;
}

class ConstantNullValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
	virtual ap_texpr1_t * createTreeExpression(ApronAbstractState & state);
	std::set<std::string> mayPointsTo;
public:
	ConstantNullValue(llvm::Value * value) : ConstantValue(value), mayPointsTo({"null"}) {
		llvm::errs() << "Null ptr: llvm name: " << value->getName() << " my name: " << getName() << "\n";
	}
	virtual const std::set<std::string> * mayPointsToUserBuffers(AbstractState & state) {
		return &mayPointsTo;
	}
};

std::string ConstantNullValue::getConstantString() {
	return "null";
}

ap_texpr1_t * ConstantNullValue::createTreeExpression(ApronAbstractState & state) {
	ap_texpr1_t * result = state.asTexpr((int64_t)0);
	return result;
}

class CallValue : public InstructionValue {
protected:
	llvm::CallInst * asCallInst();
	virtual std::string getCalledFunctionName();
	bool isDebugFunction(const std::string & funcName) const;
	bool isKernelUserMemoryOperation(const std::string & funcName) const;

	virtual void updateForAccount(AbstractState & state);
	virtual void updateForAccessOK(AbstractState & state);
	virtual void updateForGetUser(AbstractState & state);
	virtual void updateForPutUser(AbstractState & state);
	virtual void updateForClearUser(AbstractState & state);
	virtual void updateForCopyToUser(AbstractState & state);
	virtual void updateForCopyFromUser(AbstractState & state);
	virtual void updateForStrnlenUser(AbstractState & state);
	virtual void updateForStrncpyFromUser(AbstractState & state);
	virtual void updateForUserMemoryOperation(AbstractState & state,
			const std::string & ptr, ap_texpr1_t * size,
			user_pointer_operation_e op);
	virtual void updateForUserMemoryOperation(AbstractState & state,
			Value * ptr, ap_texpr1_t * size,
			user_pointer_operation_e op);
	virtual void updateForGetPutUser(AbstractState & state,
			user_pointer_operation_e op);
	virtual void updateForCopyToFromUser(AbstractState & state, user_pointer_operation_e op);
	virtual void updateForImportIovec(AbstractState & state);
	virtual void updateForCopyMsghdrFromUser(AbstractState & state);
	virtual void updateForGetUnusedFdFlags(AbstractState & state);
	virtual user_pointer_operation_e getArgumentUserOperation(int arg);
	virtual user_pointer_operation_e getImportIovecOp();
	virtual const std::string & getArgumentName(int arg);
	virtual const std::string & getImportIovecPtrName();
	virtual const std::string & getImportIovecLenName();

public:
	CallValue(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
	virtual void update(AbstractState & state);
};

llvm::CallInst * CallValue::asCallInst() {
	return &llvm::cast<llvm::CallInst>(*m_value);
}

std::string CallValue::getCalledFunctionName() {
	llvm::CallInst * callInst = asCallInst();
	llvm::Function * function = callInst->getCalledFunction();
	if (!function) {
		llvm::Value * value = callInst->getCalledValue();
		if (value->hasName()) {
			return value->getName().str();
		}
		if (llvm::User * user = llvm::dyn_cast<llvm::User>(value)) {
			return user->getOperand(0)->getName().str();

		}
		llvm::errs() << "Function is null: " << *value << "\n";
		abort();
	}
	return function->getName().str();
}

std::string CallValue::getValueString() {
	std::ostringstream oss;
	llvm::CallInst * callInst = asCallInst();
	oss << getCalledFunctionName() << "(";
	ValueFactory * factory = ValueFactory::getInstance();
	bool isFirst = true;
	for (unsigned idx = 0; idx < callInst->getNumArgOperands(); idx++) {
		llvm::Value * llvmOperand = callInst->getArgOperand(idx);
		Value * operand = factory->getValue(llvmOperand);
		if (!isFirst) {
			oss << ", ";
		}
		isFirst = false;
		if (operand) {
			oss << operand->getName();
		} else {
			oss << "<unknown operand>";
		}
	}
	oss << ")";
	return oss.str();
}

bool CallValue::isDebugFunction(const std::string & funcName) const {
	const std::string comparator = "llvm.dbg.";
	return comparator.compare(0, comparator.size(),
			funcName, 0, comparator.size()) == 0;
}

bool CallValue::isKernelUserMemoryOperation(const std::string & funcName) const {
	// TODO Memoize this method
	if ("access_ok" == funcName) {
		return true;
	}
	if ("get_user" == funcName) {
		return true;
	}
	if ("__get_user" == funcName) {
		return true;
	}
	if ("___get_user_inner" == funcName) {
		return true;
	}
	if ("put_user" == funcName) {
		return true;
	}
	if ("__put_user" == funcName) {
		return true;
	}
	if ("clear_user" == funcName) {
		return true;
	}
	if ("copy_to_user" == funcName) {
		return true;
	}
	if ("_copy_to_user" == funcName) {
		return true;
	}
	if ("copy_from_user" == funcName) {
		return true;
	}
	if ("_copy_from_user" == funcName) {
		return true;
	}
	if ("strnlen_user" == funcName) {
		return true;
	}
	if ("strncpy_from_user" == funcName) {
		return true;
	}
	if ("import_iovec" == funcName) {
		return true;
	}
	if ("copy_msghdr_from_user" == funcName) {
		return true;
	}
	if ("account" == funcName) {
		return true;
	}
	return false;
}

bool CallValue::isSkip() {
	llvm::CallInst * callInst = asCallInst();
	if (asCallInst()->isInlineAsm()) {
		llvm::errs() << "Warning: Skipping inline asm: " << *callInst->getCalledValue() << "\n";
		return true;
	}
	const std::string funcName = getCalledFunctionName();
	if (isDebugFunction(funcName)) {
		return true;
	}
	return false;
}

void CallValue::update(AbstractState & state) {
	const std::string funcName = getCalledFunctionName();
	if (isKernelUserMemoryOperation(funcName)) {
		if ("access_ok" == funcName) {
			updateForAccessOK(state);
			return;
		}
		if ("get_user" == funcName) {
			updateForGetUser(state);
			return;
		}
		if ("__get_user" == funcName) {
			updateForGetUser(state);
			return;
		}
		if ("___get_user_inner" == funcName) {
			updateForGetUser(state);
			return;
		}
		if ("put_user" == funcName) {
			updateForPutUser(state);
			return;
		}
		if ("__put_user" == funcName) {
			updateForPutUser(state);
			return;
		}
		if ("clear_user" == funcName) {
			updateForClearUser(state);
			return;
		}
		if ("copy_to_user" == funcName) {
			updateForCopyToUser(state);
			return;
		}
		if ("_copy_to_user" == funcName) {
			updateForCopyToUser(state);
			return;
		}
		if ("copy_from_user" == funcName) {
			updateForCopyFromUser(state);
			return;
		}
		if ("_copy_from_user" == funcName) {
			updateForCopyFromUser(state);
			return;
		}
		if ("strnlen_user" == funcName) {
			updateForStrnlenUser(state);
			return;
		}
		if ("strncpy_from_user" == funcName) {
			updateForStrncpyFromUser(state);
			return;
		}
		if ("import_iovec" == funcName) {
			updateForImportIovec(state);
			return;
		}
		if ("copy_msghdr_from_user" == funcName) {
			updateForCopyMsghdrFromUser(state);
			return;
		}
		if ("account" == funcName) {
			updateForAccount(state);
			return;
		}
	}
	if ("get_unused_fd_flags" == funcName) {
		updateForGetUnusedFdFlags(state);
		return;
	}
	havoc(state);
	return;
}

void CallValue::updateForGetUnusedFdFlags(AbstractState & state) {
	state.m_apronAbstractState.extend(getName());
	ap_texpr1_t * thisTexpr = state.m_apronAbstractState.asTexpr(getName());
	ap_texpr1_t * maxNoFile = state.m_apronAbstractState.asTexpr((int64_t)1024);
	ap_texpr1_t * difference = ap_texpr1_binop(
				AP_TEXPR_SUB, maxNoFile, thisTexpr,
				AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t cons = ap_tcons1_make(AP_CONS_SUPEQ, difference, state.m_apronAbstractState.zero());
	state.m_apronAbstractState.meet(cons);
}

user_pointer_operation_e CallValue::getArgumentUserOperation(int arg) {
	llvm::CallInst * callinst = asCallInst();
	llvm::Value * llvmOp = callinst->getArgOperand(arg);
	llvm::ConstantInt & opValue = llvm::cast<llvm::ConstantInt>(*llvmOp);
	const llvm::APInt & apint = opValue.getValue();
	unsigned opRawValue = apint.getZExtValue();
	assert((opRawValue == 0) || (opRawValue == 1));
	return ((opRawValue == 0) ? user_pointer_operation_read :
			user_pointer_operation_write);
}

user_pointer_operation_e CallValue::getImportIovecOp() {
	return getArgumentUserOperation(0);
}

const std::string & CallValue::getArgumentName(int arg) {
	llvm::CallInst * callinst = asCallInst();
	llvm::Value * llvmVal = callinst->getArgOperand(arg);
	ValueFactory * valueFactory = ValueFactory::getInstance();
	Value * value = valueFactory->getValue(llvmVal);
	std::string & name = value->getName();
	return name;
}

const std::string & CallValue::getImportIovecPtrName() {
	return getArgumentName(1);
}

const std::string & CallValue::getImportIovecLenName() {
	return getArgumentName(2);
}

void CallValue::updateForImportIovec(AbstractState & state) {
	/* The op sent to import_iovec is the oposite of what we plan to do,
	 * i.e. read -> write, and write -> read */
	user_pointer_operation_e op = (getImportIovecOp() == user_pointer_operation_read) ?
			user_pointer_operation_write : user_pointer_operation_read;
	state.m_importedIovecCalls.push_back(ImportIovecCall(
		op, getImportIovecPtrName(), getImportIovecLenName()));

	ap_texpr1_t * zero = state.m_apronAbstractState.asTexpr((int64_t)0);
	assign0(state);
}


void CallValue::updateForCopyMsghdrFromUser(
		AbstractState & state) {
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 4);

	user_pointer_operation_e op = user_pointer_operation_write;
	llvm::Value * llvmOp = callinst->getArgOperand(2);
	llvm::Constant * opValue = llvm::dyn_cast<llvm::Constant>(llvmOp);
	if (opValue && opValue->isZeroValue()) {
		op = user_pointer_operation_read;
	}

	state.m_copyMsghdrFromUserCalls.push_back(
			CopyMsghdrFromUserCall(op, getArgumentName(1)));
	assign0(state);
}

void CallValue::updateForAccount(AbstractState & state) {
	bool isKnown = state.m_apronAbstractState.isKnown(getName());
	const std::string * name = &getName();
	if (isKnown) {
		static const std::string tmpname = "__tmp_updateForAccount";
		name = &tmpname;
		state.m_apronAbstractState.extend(tmpname);
	}
	Value * limit = getOperandValue(1);
	ap_texpr1_t * this_texpr = state.m_apronAbstractState.asTexpr(*name);
	ap_texpr1_t * other_texpr = limit->createTreeExpression(state);
	ap_texpr1_t * texpr = ap_texpr1_binop(
				AP_TEXPR_SUB, other_texpr, this_texpr,
				AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t cons = ap_tcons1_make(AP_CONS_SUPEQ, texpr, state.m_apronAbstractState.zero());
	state.m_apronAbstractState.meet(cons);
	if (isKnown) {
		state.m_apronAbstractState.forget(getName());
		state.m_apronAbstractState.rename(*name, getName());
	}
}

void CallValue::updateForAccessOK(AbstractState & state) {
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 3);
	user_pointer_operation_e op = getArgumentUserOperation(0);
	Value * ptr = getOperandValue(1);
	Value * sizeValue = getOperandValue(2);
	ap_texpr1_t * size = sizeValue->createTreeExpression(state);
	updateForUserMemoryOperation(state, ptr, size, op);
}

void CallValue::updateForUserMemoryOperation(AbstractState & state,
		const std::string & ptrName, ap_texpr1_t * size,
		user_pointer_operation_e op) {
	MPTItemAbstractState & userBuffers = state.m_mayPointsTo.m_mayPointsTo[ptrName];
	userBuffers.erase("null");
	userBuffers.erase("kernel");
	llvm::errs() << "MPTItemAbstractState for " << ptrName << " is writable? " << userBuffers.isWritable() << "\n";
	for (auto & userBuffer : userBuffers) {
		MemoryAccessAbstractValue maav(getName(), ptrName, userBuffer, ap_texpr1_copy(size), op);
		// Placed back in abstractState to be joined at end of BB
		state.memoryAccessAbstractValues.push_back(maav);
	}
	ap_texpr1_free(size);
	havoc(state);
}

void CallValue::updateForUserMemoryOperation(AbstractState & state,
		Value * ptr, ap_texpr1_t * size,
		user_pointer_operation_e op) {
	updateForUserMemoryOperation(state, ptr->getName(), size, op);
}

void CallValue::updateForGetPutUser(AbstractState & state,
		user_pointer_operation_e op) {
	/*
	 * Update the constraints to include that the pointer was 'read from'
	 */
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 2);
	// Size: Width of first parameter
	Value * value = getOperandValue(0);
	unsigned size = value->getByteSize();
	ap_texpr1_t * apsize = state.m_apronAbstractState.asTexpr((int64_t)size);
	// Pointer + offset: Second parameter
	Value * pointer = getOperandValue(1);
	updateForUserMemoryOperation(state, pointer, apsize, op);
	if (op == user_pointer_operation_read) {
		MPTItemAbstractState & userBuffers = state.m_mayPointsTo.m_mayPointsTo[pointer->getName()];
		assert(userBuffers.count() == 1);
		for (auto & userBuffer : userBuffers) {
			const std::string & ptrDeref = state.generateBufferDereferenceName(userBuffer);
			ap_texpr1_t * ptrExpr = state.m_apronAbstractState.asTexpr(
					ptrDeref);
			state.m_apronAbstractState.assign(getName(), ptrExpr);
		}
	}
}

void CallValue::updateForGetUser(AbstractState & state) {
	updateForGetPutUser(state, user_pointer_operation_read);
}

void CallValue::updateForPutUser(AbstractState & state) {
	updateForGetPutUser(state, user_pointer_operation_write);
}

void CallValue::updateForClearUser(AbstractState & state) {
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 2);
	Value * ptr = getOperandValue(0);
	Value * sizeValue = getOperandValue(1);
	ap_texpr1_t * size = sizeValue->createTreeExpression(state);
	updateForUserMemoryOperation(state, ptr, size, user_pointer_operation_write);
}

void CallValue::updateForCopyToFromUser(AbstractState & state,
		user_pointer_operation_e op) {
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 3);
	Value * ptr = getOperandValue(op == user_pointer_operation_write ? 0 : 1);
	Value * sizeValue = getOperandValue(2);
	ap_texpr1_t * size = sizeValue->createTreeExpression(state);
	updateForUserMemoryOperation(state, ptr, size, op);
}

void CallValue::updateForCopyToUser(AbstractState & state) {
	updateForCopyToFromUser(state, user_pointer_operation_write);
}

void CallValue::updateForCopyFromUser(AbstractState & state) {
	updateForCopyToFromUser(state, user_pointer_operation_read);
}

void CallValue::updateForStrnlenUser(AbstractState & state) {
	// TODO Ignores first0
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 3);
	Value * ptr = getOperandValue(0);
	Value * sizeValue = getOperandValue(1);
	ap_texpr1_t * size = sizeValue->createTreeExpression(state);
	updateForUserMemoryOperation(state, ptr, size, user_pointer_operation_read);
}

void CallValue::updateForStrncpyFromUser(AbstractState & state) {
	// TODO Ignores first0
	updateForCopyFromUser(state);
}

class LogicalBinaryOperationValue : public BinaryOperationValue {
protected:
	virtual ap_texpr_op_t getTreeOperation() { abort(); /* Can't be done */ }
public:
	LogicalBinaryOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
	virtual bool isSkip();
	virtual void updateConditionalAssumptions(AbstractState & state, bool isNegated=false) = 0;
};

bool LogicalBinaryOperationValue::isSkip() {
	return true;
}

class CompareValue : public LogicalBinaryOperationValue {
public:
	CompareValue(llvm::Value * value) : LogicalBinaryOperationValue(value) {}
	// TODO These probably work differently
	virtual ap_texpr_op_t getTreeOperation()  { abort(); }
	virtual constraint_condition_t getConditionType() = 0;
	virtual constraint_condition_t getNegatedConditionType() = 0;
	virtual void updateConditionalAssumptions(AbstractState & state, bool isNegated=false) = 0;
};

class IntegerCompareValue : public CompareValue {
protected:
	virtual llvm::ICmpInst * asICmpInst();
	virtual std::string getPredicateString();
	virtual std::string getOperationSymbol();
	virtual bool isConstraintConditionToAPNeedsReverse(
			constraint_condition_t consCond);
	virtual ap_constyp_t constraintConditionToAPConsType(
			constraint_condition_t consCond);
	virtual ap_tcons1_t getConditionTcons(AbstractState & state,
			constraint_condition_t consCond);
	virtual void updateNumericalAssumptions(AbstractState & state,
			constraint_condition_t consCond);
	virtual void updateMayPointsToAssumptions(AbstractState & state,
			constraint_condition_t consCond);
	virtual void removeNullIfOtherIsProvablyNull(
			MPTItemAbstractState & left, MPTItemAbstractState & right);
	virtual void meetMayPointsToByAssumption(AbstractState & state,
		constraint_condition_t condType, Value * left, Value * right);

	virtual void meetOffsetEquality(AbstractState & state,
		MPTItemAbstractState & mpt, Value * left, Value * right);
public:
	IntegerCompareValue(llvm::Value * value) : CompareValue(value) {}
	virtual constraint_condition_t getConditionType();
	virtual constraint_condition_t getNegatedConditionType();
	virtual void updateConditionalAssumptions(AbstractState & state, bool isNegated=false);
};

llvm::ICmpInst * IntegerCompareValue::asICmpInst() {
	return &llvm::cast<llvm::ICmpInst>(*m_value);
}

std::string IntegerCompareValue::getPredicateString() {
	llvm::CmpInst::Predicate predicate = asICmpInst()->getSignedPredicate();
	switch (predicate) {
	case llvm::CmpInst::FCMP_FALSE:
		return "<False>";
	case llvm::CmpInst::FCMP_OEQ:
	case llvm::CmpInst::FCMP_OGT:
	case llvm::CmpInst::FCMP_OGE:
	case llvm::CmpInst::FCMP_OLT:
	case llvm::CmpInst::FCMP_OLE:
	case llvm::CmpInst::FCMP_ONE:
	case llvm::CmpInst::FCMP_ORD:
	case llvm::CmpInst::FCMP_UNO:
	case llvm::CmpInst::FCMP_UEQ:
	case llvm::CmpInst::FCMP_UGT:
	case llvm::CmpInst::FCMP_UGE:
	case llvm::CmpInst::FCMP_ULT:
	case llvm::CmpInst::FCMP_ULE:
	case llvm::CmpInst::FCMP_UNE:
	case llvm::CmpInst::FCMP_TRUE:
		return "?F?";

	case llvm::CmpInst::ICMP_EQ:
		return "==";
	case llvm::CmpInst::ICMP_NE:
		return "!=";
	case llvm::CmpInst::ICMP_UGT:
	case llvm::CmpInst::ICMP_SGT:
		return ">";
	case llvm::CmpInst::ICMP_UGE:
	case llvm::CmpInst::ICMP_SGE:
		return ">=";
	case llvm::CmpInst::ICMP_ULT:
	case llvm::CmpInst::ICMP_SLT:
		return "<";
	case llvm::CmpInst::ICMP_ULE:
	case llvm::CmpInst::ICMP_SLE:
		return "<=";
	case llvm::CmpInst::BAD_FCMP_PREDICATE:
	case llvm::CmpInst::BAD_ICMP_PREDICATE:
	deafult:
		break;
	}
	return "???";
}

constraint_condition_t IntegerCompareValue::getConditionType() {
	llvm::CmpInst::Predicate predicate = asICmpInst()->getSignedPredicate();
	switch (predicate) {
	case llvm::CmpInst::FCMP_FALSE:
		return cons_cond_false;
	case llvm::CmpInst::FCMP_TRUE:
		return cons_cond_true;

	case llvm::CmpInst::ICMP_EQ:
		return cons_cond_eq;
	case llvm::CmpInst::ICMP_NE:
		return cons_cond_neq;
	case llvm::CmpInst::ICMP_UGT:
	case llvm::CmpInst::ICMP_SGT:
		return cons_cond_gt;
	case llvm::CmpInst::ICMP_UGE:
	case llvm::CmpInst::ICMP_SGE:
		return cons_cond_ge;
	case llvm::CmpInst::ICMP_ULT:
	case llvm::CmpInst::ICMP_SLT:
		return cons_cond_lt;
	case llvm::CmpInst::ICMP_ULE:
	case llvm::CmpInst::ICMP_SLE:
		return cons_cond_le;
	case llvm::CmpInst::FCMP_OEQ:
	case llvm::CmpInst::FCMP_OGT:
	case llvm::CmpInst::FCMP_OGE:
	case llvm::CmpInst::FCMP_OLT:
	case llvm::CmpInst::FCMP_OLE:
	case llvm::CmpInst::FCMP_ONE:
	case llvm::CmpInst::FCMP_ORD:
	case llvm::CmpInst::FCMP_UNO:
	case llvm::CmpInst::FCMP_UEQ:
	case llvm::CmpInst::FCMP_UGT:
	case llvm::CmpInst::FCMP_UGE:
	case llvm::CmpInst::FCMP_ULT:
	case llvm::CmpInst::FCMP_ULE:
	case llvm::CmpInst::FCMP_UNE:
	case llvm::CmpInst::BAD_FCMP_PREDICATE:
	case llvm::CmpInst::BAD_ICMP_PREDICATE:
	deafult:
		// Unknown, or bad
		abort();
	}
}

constraint_condition_t IntegerCompareValue::getNegatedConditionType() {
	llvm::CmpInst::Predicate predicate = asICmpInst()->getSignedPredicate();
	switch (predicate) {
	case llvm::CmpInst::FCMP_FALSE:
		return cons_cond_true;
	case llvm::CmpInst::FCMP_TRUE:
		return cons_cond_false;

	case llvm::CmpInst::ICMP_EQ:
		return cons_cond_neq;
	case llvm::CmpInst::ICMP_NE:
		return cons_cond_eq;
	case llvm::CmpInst::ICMP_UGT:
	case llvm::CmpInst::ICMP_SGT:
		return cons_cond_le;
	case llvm::CmpInst::ICMP_UGE:
	case llvm::CmpInst::ICMP_SGE:
		return cons_cond_lt;
	case llvm::CmpInst::ICMP_ULT:
	case llvm::CmpInst::ICMP_SLT:
		return cons_cond_ge;
	case llvm::CmpInst::ICMP_ULE:
	case llvm::CmpInst::ICMP_SLE:
		return cons_cond_gt;
	case llvm::CmpInst::FCMP_OEQ:
	case llvm::CmpInst::FCMP_OGT:
	case llvm::CmpInst::FCMP_OGE:
	case llvm::CmpInst::FCMP_OLT:
	case llvm::CmpInst::FCMP_OLE:
	case llvm::CmpInst::FCMP_ONE:
	case llvm::CmpInst::FCMP_ORD:
	case llvm::CmpInst::FCMP_UNO:
	case llvm::CmpInst::FCMP_UEQ:
	case llvm::CmpInst::FCMP_UGT:
	case llvm::CmpInst::FCMP_UGE:
	case llvm::CmpInst::FCMP_ULT:
	case llvm::CmpInst::FCMP_ULE:
	case llvm::CmpInst::FCMP_UNE:
	case llvm::CmpInst::BAD_FCMP_PREDICATE:
	case llvm::CmpInst::BAD_ICMP_PREDICATE:
	deafult:
		// Unknown, or bad
		abort();
	}
}

std::string IntegerCompareValue::getOperationSymbol() {
	return getPredicateString();
}

bool IntegerCompareValue::isConstraintConditionToAPNeedsReverse(
		constraint_condition_t consCond) {
	switch (consCond) {
	case cons_cond_lt:
	case cons_cond_le:
		return true;
	default:
		return false;
	}
}

ap_constyp_t IntegerCompareValue::constraintConditionToAPConsType(
		constraint_condition_t consCond) {
	switch (consCond) {
	case cons_cond_eq:
		return AP_CONS_EQ;
	case cons_cond_eqmod:
		return AP_CONS_EQMOD;
	case cons_cond_neq:
		return AP_CONS_DISEQ;
	case cons_cond_gt:
		return AP_CONS_SUP;
	case cons_cond_ge:
		return AP_CONS_SUPEQ;
	case cons_cond_lt:
		return AP_CONS_SUP;
	case cons_cond_le:
		return AP_CONS_SUPEQ;
	case cons_cond_true:
		llvm::errs() << "IntegerCompareValue::constraintConditionToAPConsType: Constant condition true\n";
		abort();
	case cons_cond_false:
		llvm::errs() << "IntegerCompareValue::constraintConditionToAPConsType: Constant condition false\n";
		abort();
	default:
		llvm::errs() << "IntegerCompareValue::constraintConditionToAPConsType: Constant condition unknown: " << consCond << "\n";
		abort();
	}
}

ap_tcons1_t IntegerCompareValue::getConditionTcons(AbstractState & state,
		constraint_condition_t consCond) {
	ap_scalar_t* zero = ApronAbstractState::zero();
	ap_constyp_t condtype = constraintConditionToAPConsType(consCond);
	bool reverse = isConstraintConditionToAPNeedsReverse(consCond);
	ap_texpr1_t * left = createOperandTreeExpression(state, 0);
	ap_texpr1_t * right = createOperandTreeExpression(state, 1);
	ap_texpr1_t * texpr ;
	state.m_apronAbstractState.extendEnvironment(left);
	state.m_apronAbstractState.extendEnvironment(right);
	if (reverse) {
		texpr = ap_texpr1_binop(
				AP_TEXPR_SUB, right, left,
				AP_RTYPE_INT, AP_RDIR_ZERO);
	} else {
		texpr = ap_texpr1_binop(
				AP_TEXPR_SUB, left, right,
				AP_RTYPE_INT, AP_RDIR_ZERO);
	}
	ap_tcons1_t result = ap_tcons1_make(condtype, texpr, zero);
	return result;
}

void IntegerCompareValue::updateNumericalAssumptions(AbstractState & state,
		constraint_condition_t consCond) {
	ap_tcons1_t cons = getConditionTcons(state, consCond);
	state.m_apronAbstractState.meet(cons);
}

void IntegerCompareValue::updateMayPointsToAssumptions(AbstractState & state,
		constraint_condition_t consCond) {
	Value * condOperand0Value = getOperandValue(0);
	if (!condOperand0Value->isPointer()) {
		return;
	}
	Value * condOperand1Value = getOperandValue(1);
	assert(condOperand1Value->isPointer() && "Pointer and non-pointer comparison");

	meetMayPointsToByAssumption(state, consCond, condOperand0Value, condOperand1Value);
}

void IntegerCompareValue::removeNullIfOtherIsProvablyNull(
		MPTItemAbstractState & left, MPTItemAbstractState & right) {
	if (right.isProvablyNull()) {
		left.erase("null");
	}
}

void IntegerCompareValue::meetOffsetEquality(AbstractState & state,
		MPTItemAbstractState & mpt, Value * left, Value * right) {
	for (const std::string & buffer : mpt) {
		const std::string & leftOffset = state.generateOffsetName(
				left->getName(), buffer);
		const std::string & rightOffset = state.generateOffsetName(
				right->getName(), buffer);
		state.m_apronAbstractState.extend(leftOffset);
		state.m_apronAbstractState.extend(rightOffset);
		ap_texpr1_t * leftOffsetExpr = state.m_apronAbstractState.asTexpr(leftOffset);
		ap_texpr1_t * rightOffsetExpr = state.m_apronAbstractState.asTexpr(rightOffset);
		ap_texpr1_t * difference = ap_texpr1_binop(
				AP_TEXPR_SUB, leftOffsetExpr, rightOffsetExpr,
				AP_RTYPE_INT, AP_RDIR_ZERO);
		ap_tcons1_t cons = ap_tcons1_make(AP_CONS_EQ, difference,
				state.m_apronAbstractState.zero());
		state.m_apronAbstractState.meet(cons);
	}
}

void IntegerCompareValue::meetMayPointsToByAssumption(AbstractState & state,
		constraint_condition_t condType, Value * left, Value * right) {
	MPTItemAbstractState * pt_left = state.m_mayPointsTo.find(left->getName());
	MPTItemAbstractState * pt_right = state.m_mayPointsTo.find(right->getName());
	switch (condType) {
	case cons_cond_eq: {
		// Equality
		if ((!pt_left) && (!pt_right)) {
			// Both top. Nothing to do
			return;
		}
		if (!pt_left) {
			state.m_mayPointsTo.extend(left->getName()) = *pt_right;
			return;
		}
		if (!pt_right) {
			state.m_mayPointsTo.extend(right->getName()) = *pt_left;
			return;
		}
		MPTItemAbstractState::updateToIntersection(*pt_left, *pt_right);
		if (pt_left->empty()) {
			llvm::errs() << "Setting state to bottom, since " << left->getName() << " doesn't point to anything\n";
			llvm::errs() << "Setting state to bottom, (also) since " << right->getName() << " doesn't point to anything\n";
			state.makeBottom();
		}
		if (!(pt_left->isProvablyNull())) {
			meetOffsetEquality(state, *pt_left, left, right);
		}
		break;
	}
	case cons_cond_neq: {
		// Inequality
		// Remove null from each operand, if the other operand is provably null
		if ((!pt_left) || (!pt_right)) {
			// Both top. Nothing to do
			llvm::errs() << "Warning: " << left->getName() << " or " << right->getName() << " is top, so assume can't make the space smaller.\n";
			return;
		}
		removeNullIfOtherIsProvablyNull(*pt_left, *pt_right);
		if (pt_left->empty()) {
			llvm::errs() << "Setting state to bottom, since " << left->getName() << " doesn't point to anything\n";
			state.makeBottom();
			break;
		}
		removeNullIfOtherIsProvablyNull(*pt_right, *pt_left);
		if (pt_right->empty()) {
			llvm::errs() << "Setting state to bottom, since " << right->getName() << " doesn't point to anything\n";
			state.makeBottom();
			break;
		}
		break;
	}
	default: {// Should never happen
		abort();
	}
	}
}

void IntegerCompareValue::updateConditionalAssumptions(AbstractState & state, bool isNegated) {
	// 1. Update the APRON abstract value with the branch's condition
	// 2. If the branch's condition is (in)equality between pointers:
	// 2.a. Update the mpt of both pointers to be their intersection
	constraint_condition_t consCond =
			isNegated ? getNegatedConditionType() : getConditionType();
	updateNumericalAssumptions(state, consCond);
	updateMayPointsToAssumptions(state, consCond);
}

class OrOperationValue : public LogicalBinaryOperationValue {
protected:
	virtual std::string getOperationSymbol() { return "or"; }
	virtual void updateConditionalAssumptionsPositive(AbstractState & state);
	virtual void updateConditionalAssumptionsNegative(AbstractState & state);
public:
	OrOperationValue(llvm::Value * value) : LogicalBinaryOperationValue(value) {}
	virtual void updateConditionalAssumptions(AbstractState & state, bool isNegated=false);
};

void OrOperationValue::updateConditionalAssumptionsPositive(AbstractState & state) {
	AbstractState joined; // = AbstractState::bottom();
	for (int idx = 0; idx < asInstruction()->getNumOperands(); idx++) {
		Value * operand = getOperandValue(idx);
		LogicalBinaryOperationValue * lbov = static_cast<LogicalBinaryOperationValue*>(
				operand);
		AbstractState clone = state;
		lbov->updateConditionalAssumptions(clone, false);
		joined.join(clone);
	}
	state.meet(joined);
}

void OrOperationValue::updateConditionalAssumptionsNegative(AbstractState & state) {
	for (int idx = 0; idx < asInstruction()->getNumOperands(); idx++) {
		Value * operand = getOperandValue(idx);
		LogicalBinaryOperationValue * lbov = static_cast<LogicalBinaryOperationValue*>(
				operand);
		lbov->updateConditionalAssumptions(state, true);
	}
}

void OrOperationValue::updateConditionalAssumptions(AbstractState & state, bool isNegated) {
	// if isNegated is false:
	// 	For each item in the or:
	// 		Clone AbstractState
	//		updateConditionalAssumptions(clone, false)
	//	Join all clones
	//	state.meet(result)
	// else:
	// 	For each item in the or:
	//		updateConditionalAssumptions(state, true)
	if (!isNegated) {
		updateConditionalAssumptionsPositive(state);
	} else {
		updateConditionalAssumptionsNegative(state);
	}
}

class AndOperationValue : public LogicalBinaryOperationValue {
protected:
	virtual std::string getOperationSymbol() { return "and"; }
	virtual void updateConditionalAssumptionsPositive(AbstractState & state);
	virtual void updateConditionalAssumptionsNegative(AbstractState & state);
public:
	AndOperationValue(llvm::Value * value) : LogicalBinaryOperationValue(value) {}
	virtual void updateConditionalAssumptions(AbstractState & state, bool isNegated=false);
};

void AndOperationValue::updateConditionalAssumptionsPositive(AbstractState & state) {
	for (int idx = 0; idx < asInstruction()->getNumOperands(); idx++) {
		Value * operand = getOperandValue(idx);
		LogicalBinaryOperationValue * lbov = static_cast<LogicalBinaryOperationValue*>(
				operand);
		lbov->updateConditionalAssumptions(state, false);
	}
}

void AndOperationValue::updateConditionalAssumptionsNegative(AbstractState & state) {
	AbstractState joined; // = AbstractState::bottom();
	for (int idx = 0; idx < asInstruction()->getNumOperands(); idx++) {
		Value * operand = getOperandValue(idx);
		LogicalBinaryOperationValue * lbov = static_cast<LogicalBinaryOperationValue*>(
				operand);
		AbstractState clone = state;
		lbov->updateConditionalAssumptions(clone, true);
		joined.join(clone);
	}
	state.meet(joined);
}

void AndOperationValue::updateConditionalAssumptions(AbstractState & state, bool isNegated) {
	if (!isNegated) {
		updateConditionalAssumptionsPositive(state);
	} else {
		updateConditionalAssumptionsNegative(state);
	}
}

class PhiValue : public InstructionValue {
protected:
	virtual llvm::PHINode * asPHINode();
	virtual Value * getIncomingValue(BasicBlock * source);
	virtual void updateMayPointsToAssumptions(AbstractState & state, Value * incomingValue);
	virtual void updateNumericalAssumptions(AbstractState & state, Value * incomingValue);
public:
	PhiValue(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
	virtual void updateAssumptions(BasicBlock * source, BasicBlock * dest, AbstractState & state);
};

llvm::PHINode * PhiValue::asPHINode() {
	return &llvm::cast<llvm::PHINode>(*m_value);
}

std::string PhiValue::getValueString() {
	llvm::PHINode * phiNode = asPHINode();
	llvm::PHINode::block_iterator it;
	ValueFactory * factory = ValueFactory::getInstance();
	std::ostringstream oss;
	oss << "phi";
	for (it = phiNode->block_begin(); it != phiNode->block_end(); it++) {
		llvm::BasicBlock * bb = *it;
		llvm::Value * llvmValue = phiNode->getIncomingValueForBlock(bb);
		Value * value = factory->getValue(llvmValue);
		oss << " ( " << bb->getName().str() << " -> ";
		appendValueName(oss, value, "<value unknown>");
		oss << " )";
	}
	return oss.str();
}

bool PhiValue::isSkip() {
	return true;
}

Value * PhiValue::getIncomingValue(BasicBlock * source) {
	llvm::PHINode * phi = asPHINode();
	llvm::BasicBlock * llvmsource = source->getLLVMBasicBlock();
	llvm::Value * incoming = phi->getIncomingValueForBlock(llvmsource);
	ValueFactory * factory = ValueFactory::getInstance();
	return factory->getValue(incoming);
}

void PhiValue::updateMayPointsToAssumptions(AbstractState & state, Value * incomingValue) {
	// Assign offsets of one to the other
	// set pt
	std::string & name = getName();
	std::string & incomingName = incomingValue->getName();
	state.assignPtrToPtr(name, incomingName);
}

void PhiValue::updateNumericalAssumptions(AbstractState & state, Value * incomingValue) {
	std::string & name = getName();
	ap_texpr1_t * value_texpr = incomingValue->createTreeExpression(state);
	state.m_apronAbstractState.assign(name, value_texpr);
}

void PhiValue::updateAssumptions(BasicBlock * source, BasicBlock * dest, AbstractState & state) {
	Value * incomingValue = getIncomingValue(source);
	if (!isPointer()) {
		updateNumericalAssumptions(state, incomingValue);
	} else {
		updateMayPointsToAssumptions(state, incomingValue);
	}
}

template <class ConditionalInst>
class ConditionalMixin {
public:
	Value * getCondition(llvm::Value * m_value) {
		ConditionalInst * llvmConditional = llvm::dyn_cast<ConditionalInst>(m_value);
		assert(llvmConditional);
		llvm::Value * condition = llvmConditional->getCondition();
		ValueFactory * factory = ValueFactory::getInstance();
		Value * conditionValue = factory->getValue(condition);
		return conditionValue;
	}
};

class SelectValueInstruction : public InstructionValue, public ConditionalMixin<llvm::SelectInst> {
protected:
	virtual llvm::SelectInst * asSelectInst();
	virtual Value * getTrueValue();
	virtual Value * getFalseValue();
	virtual AbstractState updateJoinMember(AbstractState state,
		Value * value, bool isNegate, bool isKnown);
	virtual const std::string & getTemporaryName();
public:
	SelectValueInstruction(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
	virtual void update(AbstractState & state);
};

llvm::SelectInst * SelectValueInstruction::asSelectInst() {
	return &llvm::cast<llvm::SelectInst>(*m_value);
}

Value * SelectValueInstruction::getTrueValue() {
	ValueFactory * factory = ValueFactory::getInstance();
	return factory->getValue(asSelectInst()->getTrueValue());
}

Value * SelectValueInstruction::getFalseValue() {
	ValueFactory * factory = ValueFactory::getInstance();
	return factory->getValue(asSelectInst()->getFalseValue());
}

std::string SelectValueInstruction::getValueString() {
	std::ostringstream oss;
	oss << "(";
	appendValue(oss, getCondition(m_value), "<unknown condition>") ;
	oss << " ? ";
	appendValue(oss, getTrueValue(), "<unknown value>") ;
	oss << " : ";
	appendValue(oss, getFalseValue(), "<unknown value>") ;
	oss << ")";
	return oss.str();
}

const std::string & SelectValueInstruction::getTemporaryName() {
	static const std::string tempName = "__tmp_Var_SELECT";
	return tempName;
}

AbstractState SelectValueInstruction::updateJoinMember(AbstractState state,
		Value * value, bool isNegated, bool isKnown) {
	const std::string * name = &getName();
	if (isKnown) {
		name = &getTemporaryName();
	}
	Value * condition = getCondition(m_value);
	condition->updateConditionalAssumptions(state, isNegated);
	state.m_apronAbstractState.finish_meet_aggregate();
	ap_texpr1_t * texpr = value->createTreeExpression(state);
	state.m_apronAbstractState.assign(*name, texpr);
	return state;
}

void SelectValueInstruction::update(AbstractState & state) {
	// Take original state.
	// Clone it. (True case)
	// 	Meet with true assume
	// 	Assign True value
	// Clone it. (False case)
	// 	Meet with False assume
	// 	Assign False value
	// Join clones
	// Meet original state with clones
	Value * trueValue = getTrueValue();
	Value * falseValue = getFalseValue();
	bool isKnown = state.m_apronAbstractState.isKnown(getName());
//	if (trueValue->isConstant()) {
//		state.m_apronAbstractState.assign(getName(), falseValue->createTreeExpression(state));
//	} else if (falseValue->isConstant()) {
//		state.m_apronAbstractState.assign(getName(), trueValue->createTreeExpression(state));
//	} else {
		AbstractState trueState = updateJoinMember(state, trueValue, false, isKnown);
		AbstractState falseState = updateJoinMember(state, falseValue, true, isKnown);
		trueState.join(falseState);
		state.meet(trueState);
		if (isKnown) {
			state.m_apronAbstractState.forget(getName());
			state.m_apronAbstractState.rename(getTemporaryName(), getName());
		}
//	}
}

bool SelectValueInstruction::isSkip() {
	return false;
}

class UnaryOperationValue : public InstructionValue {
protected:
	llvm::UnaryInstruction * asUnaryInstruction();
public:
	UnaryOperationValue(llvm::Value * value) : InstructionValue(value) {}
};

llvm::UnaryInstruction * UnaryOperationValue::asUnaryInstruction() {
	return &llvm::cast<llvm::UnaryInstruction>(*m_value);
}

class CastOperationValue : public UnaryOperationValue {
protected:
	virtual ap_texpr1_t * createRHSTreeExpression(AbstractState & state);
public:
	CastOperationValue(llvm::Value * value) : UnaryOperationValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
	virtual void update(AbstractState & state);
};

std::string CastOperationValue::getValueString() {
	Value * value = getOperandValue(0);
	std::ostringstream oss;
	oss << "cast(";
	appendValueName(oss, value, "<value unknown>");
	oss << ")";
	return oss.str();
}

bool CastOperationValue::isSkip() {
	return false;
}

ap_texpr1_t * CastOperationValue::createRHSTreeExpression(AbstractState & state) {
	Value * value = getOperandValue(0);
	return value->createTreeExpression(state);
}

void CastOperationValue::update(AbstractState & state) {
	if (isPointer()) {
		Value * src = getOperandValue(0);
		state.assignPtrToPtr(getName(), src->getName());
	}
	UnaryOperationValue::update(state);
}

class BranchInstructionValue : public TerminatorInstructionValue, public ConditionalMixin<llvm::BranchInst> {
protected:
	virtual bool isSuccessorByIndex(BasicBlock * basicBlock, int idx);
	virtual bool isElseSuccessor(BasicBlock * basicBlock);
	virtual bool isThenSuccessor(BasicBlock * basicBlock);
public:
	BranchInstructionValue(llvm::Value * value) : TerminatorInstructionValue(value) {}
	virtual void updateAssumptions(BasicBlock * source, BasicBlock * dest, AbstractState & state);
};

bool BranchInstructionValue::isSuccessorByIndex(BasicBlock * basicBlock, int idx) {
	llvm::BranchInst * branchInst = &llvm::cast<llvm::BranchInst>(*m_value);
	llvm::BasicBlock * llvmsuccessor = branchInst->getSuccessor(idx);
	BasicBlockManager & manager = BasicBlockManager::getInstance();
	BasicBlock * successor = manager.getBasicBlock(llvmsuccessor);
	return (successor == basicBlock);
}

bool BranchInstructionValue::isThenSuccessor(BasicBlock * basicBlock) {
	return isSuccessorByIndex(basicBlock, 0);
}

bool BranchInstructionValue::isElseSuccessor(BasicBlock * basicBlock) {
	return isSuccessorByIndex(basicBlock, 1);
}

void BranchInstructionValue::updateAssumptions(
		BasicBlock * source, BasicBlock * dest, AbstractState & state) {
	llvm::BranchInst * branchInst = &llvm::cast<llvm::BranchInst>(*m_value);
	if (!branchInst->isConditional()) {
		return;
	}

	Value * condition = getCondition(m_value);
	bool isNegated;
	if (isThenSuccessor(dest)) {
		assert(!isElseSuccessor(dest));
		isNegated = false;
	} else if (isElseSuccessor(dest)) {
		assert(!isThenSuccessor(dest));
		isNegated = true;
	} else {
		abort();
	}
	condition->updateConditionalAssumptions(state, isNegated);
}

class SwitchInstructionValue : public TerminatorInstructionValue {
protected:
	llvm::SwitchInst * asSwitchInst();
public:
	SwitchInstructionValue(llvm::Value * value) : TerminatorInstructionValue(value) {}
	virtual void updateAssumptions(BasicBlock * source, BasicBlock * dest, AbstractState & state);
};

llvm::SwitchInst * SwitchInstructionValue::asSwitchInst() {
	return &llvm::cast<llvm::SwitchInst>(*m_value);
}

void SwitchInstructionValue::updateAssumptions(
		BasicBlock * source, BasicBlock * dest, AbstractState & state) {
	llvm::SwitchInst * switchInst = asSwitchInst();
	llvm::Value * llvmCondVar = switchInst->getCondition();
	ValueFactory * factory = ValueFactory::getInstance();
	Value * condVar = factory->getValue(llvmCondVar);
	llvm::ConstantInt * llvmCaseValue = switchInst->findCaseDest(dest->getLLVMBasicBlock());
	state.m_apronAbstractState.extend(condVar->getName());
	if (llvmCaseValue) {
		Value * caseValue = factory->getValue(llvmCaseValue);
		state.m_apronAbstractState.assign(condVar->getName(),
				caseValue->createTreeExpression(state));
	} else {
		// TODO Add constraints that condVar is different from all other cases
		// Verify the value is top:
		state.m_apronAbstractState.forget(condVar->getName());
	}
}

Value::Value(llvm::Value * value) : m_value(value),
		m_name(llvmValueName(value))
	{}

int Value::valuesIndex = 0;
std::string Value::llvmValueName(llvm::Value * value) {
	if (value->hasName()) {
		return value->getName().str();
	}
	if (llvm::isa<llvm::ConstantInt>(value)) {
		llvm::ConstantInt & constant = llvm::cast<llvm::ConstantInt>(
				*value);
		return constant.getValue().toString(10, true);
	}
	if (llvm::isa<llvm::ConstantPointerNull>(value)) {
		return "null";
	}
	std::ostringstream oss;
	oss << "%" << valuesIndex++;
	return oss.str();
}

bool Value::isPointer() {
	return m_value->getType()->isPointerTy();
}

static const llvm::Module *getModuleFromVal(const llvm::Value *V) {
  if (const llvm::Argument *MA = llvm::dyn_cast<llvm::Argument>(V))
    return MA->getParent() ? MA->getParent()->getParent() : 0;

  if (const llvm::BasicBlock *BB = llvm::dyn_cast<llvm::BasicBlock>(V))
    return BB->getParent() ? BB->getParent()->getParent() : 0;

  if (const llvm::Instruction *I = llvm::dyn_cast<llvm::Instruction>(V)) {
    const llvm::Function *M = I->getParent() ? I->getParent()->getParent() : 0;
    return M ? M->getParent() : 0;
  }

  if (const llvm::GlobalValue *GV = llvm::dyn_cast<llvm::GlobalValue>(V))
    return GV->getParent();
  return 0;
}

unsigned Value::getBitSize() {
	llvm::Type * type = m_value->getType();
	const llvm::Module * module = getModuleFromVal(m_value);
	if (!module) {
		llvm::errs() << "No module for? :" << *m_value << "\n";
		abort();
	}
	std::string dlstr = module->getDataLayout();
	const llvm::DataLayout dataLayout(module);
	unsigned bits = dataLayout.getTypeSizeInBits(type);
	return bits;
}

unsigned Value::getByteSize() {
	unsigned bits = getBitSize();
	return ((bits >> 3) + ((bits & 0x7) != 0));
}

std::string & Value::getName()  {
	return m_name;
}

std::string Value::getValueString()  {
	return getName();
}

std::string Value::toString()  {
	std::ostringstream oss;
	oss << getName() << " <- " << getValueString();
	return oss.str();
}

bool Value::isSkip() {
	return false;
}

ap_texpr1_t * Value::createTreeExpression(ApronAbstractState & state) {
	return state.asTexpr(getName());
}

ap_texpr1_t * Value::createTreeExpression(AbstractState & state) {
	return createTreeExpression(state.m_apronAbstractState);
}

void Value::havoc(AbstractState & state) {
	std::string & name = getName();
	if (state.m_apronAbstractState.isKnown(getName())) {
		state.m_apronAbstractState.forget(name);
	} else {
		state.m_apronAbstractState.extend(name);
	}
}

void Value::assign0(AbstractState & state) {
	ap_texpr1_t * zero = state.m_apronAbstractState.asTexpr((int64_t)0);
	state.m_apronAbstractState.assign(getName(), zero);
}

const std::set<std::string> * Value::mayPointsToUserBuffers(AbstractState & state) {
	return 0;
}

void Value::updateAssumptions(BasicBlock * source, BasicBlock * dest, AbstractState & state) {
	return;
}

void Value::updateConditionalAssumptions(AbstractState & state, bool isNegated) {
	if (!isPointer()) {
		if (isNegated) {
			assign0(state);
		} else {
			ap_texpr1_t * zero = state.m_apronAbstractState.asTexpr((int64_t)0);
			state.m_apronAbstractState.assign(getName(), zero);
		}
	} else {
		MPTItemAbstractState & mptItem = state.m_mayPointsTo.m_mayPointsTo[getName()];
		bool isNull = mptItem.isProvablyNull();
		if (isNull) {
			if (!isNegated) {
				llvm::errs() << "Setting state to bottom, since " << getName() << " must be null and this negates the assume\n";
				state.makeBottom();
			}
		} else {
			if (!isNegated) {
				if (mptItem.isWritable()) {
					mptItem.clear();
					mptItem.insert("null");
				} else if (!mptItem.contains("null")) {
					llvm::errs() << "Setting state to bottom, since " << getName() << " isn't null and that can't be changed\n";
					state.makeBottom();
				}
			} else {
				if (mptItem.isWritable()) {
					mptItem.erase("null");
				}
			}
		}
	}
}

bool Value::isConstant() const {
	return false;
}

std::ostream& operator<<(std::ostream& os, Value& value)
{
    os << value.toString();
    return os;
}

std::ostream& operator<<(std::ostream& os, Value* value)
{
    os << value->toString();
    return os;
}

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, Value& value)
{
    ro << value.toString();
    return ro;
}

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, Value* value)
{
    ro << value->toString();
    return ro;
}

ValueFactory * ValueFactory::instance = NULL;

ValueFactory::ValueFactory() {}

ValueFactory * ValueFactory::getInstance() {
	if (!instance) {
		instance = new ValueFactory();
	}
	return instance;
}

Value * ValueFactory::getValue(llvm::Value * value) {
	std::map<llvm::Value *, Value*>::iterator it;
	it = values.find(value);
	if (it != values.end()) {
		return it->second;
	}
	Value * result = createValue(value);
	if (!result) {
		llvm::errs() << "Unknown value: ";
		value->print(llvm::errs());
		llvm::errs() << "\n";
		abort();
	}
	values.insert(std::pair<llvm::Value *, Value*>(value, result));
	return result;
}

Value * ValueFactory::createValue(llvm::Value * value) {
	if (llvm::isa<llvm::Instruction>(value)) {
		llvm::Instruction & instruction =
				llvm::cast<llvm::Instruction>(*value);
		return createInstructionValue(&instruction);
	}
	if (llvm::isa<llvm::Constant>(value)) {
		llvm::Constant & constant =
				llvm::cast<llvm::Constant>(*value);
		return createConstantValue(&constant);
	}
	if (llvm::isa<llvm::Argument>(value)) {
		return new VariableValue(value);
	}
	return NULL;
}

Value * ValueFactory::createInstructionValue(llvm::Instruction * instruction) {
	unsigned opcode = instruction->getOpcode();
	switch (opcode) {
	case llvm::BinaryOperator::Ret:
		return new ReturnInstValue(instruction);
	// Terminators
	case llvm::BinaryOperator::Br:
		return new BranchInstructionValue(instruction);
	case llvm::BinaryOperator::Switch:
		return new SwitchInstructionValue(instruction);
	//case llvm::BinaryOperator::IndirectBr:
	//case llvm::BinaryOperator::Invoke:
	//case llvm::BinaryOperator::Unreachable:

	// Standard binary operators...
	case llvm::BinaryOperator::Add:
	case llvm::BinaryOperator::FAdd:
		return new AdditionOperationValue(instruction);
	case llvm::BinaryOperator::Sub:
	case llvm::BinaryOperator::FSub:
		return new SubtractionOperationValue(instruction);
	case llvm::BinaryOperator::Mul:
	case llvm::BinaryOperator::FMul:
		return new MultiplicationOperationValue(instruction);
	case llvm::BinaryOperator::UDiv:
	case llvm::BinaryOperator::SDiv:
	case llvm::BinaryOperator::FDiv:
		return new DivisionOperationValue(instruction);
	case llvm::BinaryOperator::URem:
	case llvm::BinaryOperator::SRem:
	case llvm::BinaryOperator::FRem:
		return new RemainderOperationValue(instruction);

	// Logical operators...
	case llvm::BinaryOperator::And:
		return new AndOperationValue(instruction);
	case llvm::BinaryOperator::Or :
		return new OrOperationValue(instruction);
	case llvm::BinaryOperator::Xor:
		return new NopInstructionValue(instruction);

	// Memory instructions...
	case llvm::BinaryOperator::Alloca:
		return new AllocaValue(instruction);
	case llvm::BinaryOperator::Load:
		return new LoadValue(instruction);
	case llvm::BinaryOperator::Store:
		return new StoreValue(instruction);
	case llvm::BinaryOperator::GetElementPtr:
		return new GepValue(instruction);

	// Convert instructions...
	case llvm::BinaryOperator::Trunc:
	case llvm::BinaryOperator::ZExt:
	case llvm::BinaryOperator::SExt:
	case llvm::BinaryOperator::FPTrunc:
	case llvm::BinaryOperator::FPExt:
	case llvm::BinaryOperator::FPToUI:
	case llvm::BinaryOperator::FPToSI:
	case llvm::BinaryOperator::UIToFP:
	case llvm::BinaryOperator::SIToFP:
	case llvm::BinaryOperator::IntToPtr:
	case llvm::BinaryOperator::PtrToInt:
	case llvm::BinaryOperator::BitCast:
		return new CastOperationValue(instruction);

	// Other instructions...
	case llvm::BinaryOperator::ICmp:
		return new IntegerCompareValue(instruction);
	//case llvm::BinaryOperator::FCmp:
	case llvm::BinaryOperator::PHI:
		return new PhiValue(instruction);
	case llvm::BinaryOperator::Select:
		return new SelectValueInstruction(instruction);
	case llvm::BinaryOperator::Call:
		return new CallValue(instruction);
	case llvm::BinaryOperator::Shl:
		return new SHLOperationValue(instruction);
	case llvm::BinaryOperator::LShr:
	case llvm::BinaryOperator::AShr:
		return new SHROperationValue(instruction);
	//case llvm::BinaryOperator::VAArg:
	//case llvm::BinaryOperator::ExtractElement:
	//case llvm::BinaryOperator::InsertElement:
	//case llvm::BinaryOperator::ShuffleVector:
	case llvm::BinaryOperator::ExtractValue:
		return new NopInstructionValue(instruction);
	//case llvm::BinaryOperator::InsertValue:

	default: return NULL;
	}
}

Value * ValueFactory::createConstantValue(llvm::Constant * constant) {
	if (llvm::isa<llvm::ConstantInt>(constant)) {
		return new ConstantIntValue(constant);
	}
	if (llvm::isa<llvm::ConstantFP>(constant)) {
		return new ConstantFloatValue(constant);
	}
	if (llvm::isa<llvm::ConstantPointerNull>(constant)) {
		return new ConstantNullValue(constant);
	}
	if (llvm::isa<llvm::GlobalVariable>(constant)) {
		return new Value(constant);
	}
	if (llvm::isa<llvm::ConstantExpr>(constant)) {
		llvm::ConstantExpr & expr = llvm::cast<llvm::ConstantExpr>(*constant);
		llvm::Value * instruction = expr.getAsInstruction();
		Value * result = getValue(instruction);
		m_createdInstances.insert(std::make_pair(result, instruction));
		return result;
	}
	return NULL;
}

void ValueFactory::deleteCreatedInstances() {
	ValueFactory * instance = getInstance();
	for (auto & pair : instance->m_createdInstances) {
		Value * value = pair.first;
		llvm::Value * llvmValue = pair.second;
		instance->values.erase(llvmValue);
		delete value;
		delete llvmValue;
	}
	instance->m_createdInstances.clear();
}
