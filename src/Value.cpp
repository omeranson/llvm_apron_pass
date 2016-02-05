
#include <sstream>
#include <string>
#include <iostream>
#include <cstdlib>

#include <Value.h>

#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstrTypes.h>
//#include <llvm/IR/DebugLoc.h>
#include <llvm/DebugInfo.h>
#include <llvm/IR/Constants.h>

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

class VariableValue : public Value {
public:
	VariableValue(llvm::Value * value) : Value(value) {}
	virtual std::string getValueString();
	virtual std::string toString() ;
};
std::string VariableValue::getValueString() {
	return getName();
}

std::string VariableValue::toString() {
	return getName();
}

llvm::Instruction * InstructionValue::asInstruction() {
	return &llvm::cast<llvm::Instruction>(*m_value);
}

ap_tcons1_t InstructionValue::createTreeConstraint() {
	// TODO Consider making a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	BasicBlock * basicBlock = getBasicBlock();
	ap_texpr1_t * var_texpr = createTreeExpression(basicBlock);
	ap_texpr1_t * value_texpr = createRHSTreeExpression();

	basicBlock->extendTexprEnvironment(var_texpr);
	basicBlock->extendTexprEnvironment(value_texpr);

	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_SUB, value_texpr, var_texpr, 
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t result = ap_tcons1_make(AP_CONS_EQ, texpr, zero);
	return result;
}

ap_texpr1_t * InstructionValue::createRHSTreeExpression() {
	abort();
}

bool InstructionValue::isSkip() {
	return true;
}

BasicBlock * InstructionValue::getBasicBlock() {
	llvm::Instruction * instruction = asInstruction();
	llvm::BasicBlock * llvmBasicBlock = instruction->getParent();
	BasicBlockFactory & factory = BasicBlockFactory::getInstance();
	BasicBlock * result = factory.getBasicBlock(llvmBasicBlock);
	return result;
}

class ReturnInstValue : public InstructionValue {
friend class ValueFactory;
protected:
	llvm::ReturnInst * asReturnInst() ;
public:
	ReturnInstValue(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string toString() ;
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
	virtual ap_texpr1_t * createRHSTreeExpression();
	virtual ap_texpr1_t * createOperandTreeExpression(int idx);
public:
	BinaryOperationValue(llvm::Value * value) : InstructionValue(value) {}
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
			llvmOperand->print(llvm::errs());
			oss << "<Operand Unknown>";
		}
	}
	oss << ")";
	return oss.str();
}

bool BinaryOperationValue::isSkip() {
	return false;
}

ap_texpr1_t * BinaryOperationValue::createOperandTreeExpression(int idx) {
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * llvmOperand = asUser()->getOperand(idx);
	Value * operand = factory->getValue(llvmOperand);
	if (!operand) {
		llvm::errs() << "Unknown value\n";
		exit(1);
	}
	return operand->createTreeExpression(getBasicBlock());
}

ap_texpr1_t * BinaryOperationValue::createRHSTreeExpression() {

	ap_texpr1_t * op0_texpr = createOperandTreeExpression(0);
	ap_texpr1_t * op1_texpr = createOperandTreeExpression(1);
	// TODO They don't have logical ops in #ap_texpr_op_t
	ap_texpr_op_t operation = getTreeOperation();
	// TODO Handle reals
	// Align environments
	BasicBlock * basicBlock = getBasicBlock();
	basicBlock->extendTexprEnvironment(op0_texpr);
	basicBlock->extendTexprEnvironment(op1_texpr);
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
};

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

class ConstantValue : public Value {
protected:
	virtual std::string getValueString() ;
	virtual std::string getConstantString()  = 0;
public:
	ConstantValue(llvm::Value * value) : Value(value) {}
	virtual ap_texpr1_t* createTreeExpression(BasicBlock* basicBlock) = 0;
};

std::string ConstantValue::getValueString()  {
	return getConstantString();
}

class ConstantIntValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
public:
	ConstantIntValue(llvm::Value * value) : ConstantValue(value) {}
	virtual ap_texpr1_t * createTreeExpression(BasicBlock * basicBlock);
};

std::string ConstantIntValue::getConstantString()  {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	return apint.toString(10, true);
}

ap_texpr1_t * ConstantIntValue:: createTreeExpression(
		BasicBlock * basicBlock) {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	uint64_t value = apint.getLimitedValue();
	int64_t svalue = value;
	if (apint.isNegative()) {
		svalue = -value;
	}
	ap_texpr1_t * result = ap_texpr1_cst_scalar_int(
			basicBlock->getEnvironment(), svalue);
	return result;
}

class ConstantFloatValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
public:
	ConstantFloatValue(llvm::Value * value) : ConstantValue(value) {}
	virtual ap_texpr1_t * createTreeExpression(BasicBlock * basicBlock);
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
		BasicBlock * basicBlock) {
	llvm::ConstantFP & fpValue = llvm::cast<llvm::ConstantFP>(*m_value);
	const llvm::APFloat & apfloat = fpValue.getValueAPF();
	double value = apfloat.convertToDouble();
	ap_texpr1_t * result = ap_texpr1_cst_scalar_double(
			basicBlock->getEnvironment(), value);
	return result;
}

class CallValue : public Value {
protected:
	llvm::CallInst * asCallInst();
	virtual std::string getCalledFunctionName();
public:
	CallValue(llvm::Value * value) : Value(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
};

llvm::CallInst * CallValue::asCallInst() {
	return &llvm::cast<llvm::CallInst>(*m_value);
}

std::string CallValue::getCalledFunctionName() {
	llvm::CallInst * callInst = asCallInst();
	llvm::Function * function = callInst->getCalledFunction();
	return function->getName().str();
}

std::string CallValue::getValueString() {
	std::ostringstream oss;
	llvm::CallInst * callInst = asCallInst();
	oss << getCalledFunctionName() << "(";
	llvm::User::op_iterator it;
	ValueFactory * factory = ValueFactory::getInstance();
	bool isFirst = true;
	for (it = callInst->op_begin(); it != callInst->op_end(); it++) {
		llvm::Value * llvmOperand = it->get();
		Value * operand = factory->getValue(llvmOperand);
		if (!isFirst) {
			oss << ", ";
		}
		isFirst = false;
		if (operand) {
			oss << operand->getValueString();
		} else {
			oss << "<unknown operand>";
		}
	}
	oss << ")";
	return oss.str();
}

bool CallValue::isSkip() {
	const std::string comparator = "llvm.dbg.";
	const std::string funcName = getCalledFunctionName();
	return comparator.compare(0, comparator.size(),
			funcName, 0, comparator.size()) == 0;
}

class CompareValue : public BinaryOperationValue {
public:
	CompareValue(llvm::Value * value) : BinaryOperationValue(value) {}
	// TODO These probably work differently
	virtual ap_texpr_op_t getTreeOperation()  { abort(); }
};

class IntegerCompareValue : public CompareValue {
protected:
	virtual llvm::ICmpInst * asICmpInst();
	virtual std::string getPredicateString();
	virtual std::string getOperationSymbol();
public:
	IntegerCompareValue(llvm::Value * value) : CompareValue(value) {}
	virtual bool isSkip();
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
		return ">";
	case llvm::CmpInst::BAD_FCMP_PREDICATE:
	case llvm::CmpInst::BAD_ICMP_PREDICATE:
	deafult:
		return "???";
	}
	return "???";
}

std::string IntegerCompareValue::getOperationSymbol() {
	return getPredicateString();
}

bool IntegerCompareValue::isSkip() {
	return true;
}

class PhiValue : public Value {
protected:
	virtual llvm::PHINode * asPHINode();
public:
	PhiValue(llvm::Value * value) : Value(value) {}
	virtual std::string getValueString();
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

class SelectValue : public Value {
protected:
	virtual llvm::SelectInst * asSelectInst();
	virtual Value * getCondition();
	virtual Value * getTrueValue();
	virtual Value * getFalseValue();
public:
	SelectValue(llvm::Value * value) : Value(value) {}
	virtual std::string getValueString();
};

llvm::SelectInst * SelectValue::asSelectInst() {
	return &llvm::cast<llvm::SelectInst>(*m_value);
}

Value * SelectValue::getCondition() {
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * condition = asSelectInst()->getCondition();
	Value * result = factory->getValue(condition);
	if (!result) {
		condition->print(llvm::errs());
	}
	return result;
}

Value * SelectValue::getTrueValue() {
	ValueFactory * factory = ValueFactory::getInstance();
	return factory->getValue(asSelectInst()->getTrueValue());
}

Value * SelectValue::getFalseValue() {
	ValueFactory * factory = ValueFactory::getInstance();
	return factory->getValue(asSelectInst()->getFalseValue());
}

std::string SelectValue::getValueString() {
	std::ostringstream oss;
	oss << "(";
	appendValue(oss, getCondition(), "<unknown condition>") ;
	oss << " ? ";
	appendValue(oss, getTrueValue(), "<unknown value>") ;
	oss << " : ";
	appendValue(oss, getFalseValue(), "<unknown value>") ;
	oss << ")";
	return oss.str();
}

class UnaryOperationValue : public Value {
protected:
	llvm::UnaryInstruction * asUnaryInstruction();
public:
	UnaryOperationValue(llvm::Value * value) : Value(value) {}
};

llvm::UnaryInstruction * UnaryOperationValue::asUnaryInstruction() {
	return &llvm::cast<llvm::UnaryInstruction>(*m_value);
}

class CastOperationValue : public UnaryOperationValue {
public:
	CastOperationValue(llvm::Value * value) : UnaryOperationValue(value) {}
	virtual std::string getValueString();
};

std::string CastOperationValue::getValueString() {
	llvm::UnaryInstruction * inst = asUnaryInstruction();
	llvm::Value * operand = inst->getOperand(0);
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(operand);
	std::ostringstream oss;
	oss << "cast(" << value->getValueString() << ")";
	return oss.str();
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
	std::ostringstream oss;
	oss << "%" << valuesIndex++;
	return oss.str();
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

ap_var_t Value::varName() {
	return (ap_var_t)getName().c_str();
}

ap_texpr1_t * Value::createTreeExpression(BasicBlock * basicBlock) {
	return basicBlock->getVariable(this);
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
		//llvm::errs() << "Unknown value: ";
		//value->print(llvm::errs());
		//llvm::errs() << "\n";
		return NULL;
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
	//case llvm::BinaryOperator::Br:
	//case llvm::BinaryOperator::Switch:
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
	//case llvm::BinaryOperator::And:
	//case llvm::BinaryOperator::Or :
	//case llvm::BinaryOperator::Xor:

	// Memory instructions...
	//case llvm::BinaryOperator::Alloca:
	//case llvm::BinaryOperator::Load:
	//case llvm::BinaryOperator::Store:
	//case llvm::BinaryOperator::GetElementPtr:

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
		return new SelectValue(instruction);
	case llvm::BinaryOperator::Call:
		return new CallValue(instruction);
	//case llvm::BinaryOperator::Shl:
	//case llvm::BinaryOperator::LShr:
	//case llvm::BinaryOperator::AShr:
	//case llvm::BinaryOperator::VAArg:
	//case llvm::BinaryOperator::ExtractElement:
	//case llvm::BinaryOperator::InsertElement:
	//case llvm::BinaryOperator::ShuffleVector:
	//case llvm::BinaryOperator::ExtractValue:
	//case llvm::BinaryOperator::InsertValue:

	default:
		//llvm::errs() << "<Invalid operator> " <<
				//instruction->getOpcodeName() << "\n";
		return NULL;
	}
}

Value * ValueFactory::createConstantValue(llvm::Constant * constant) {
	if (llvm::isa<llvm::ConstantInt>(constant)) {
		return new ConstantIntValue(constant);
	}
	if (llvm::isa<llvm::ConstantFP>(constant)) {
		return new ConstantFloatValue(constant);
	}
	return NULL;
}

