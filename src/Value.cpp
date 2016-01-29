
#include <sstream>
#include <string>
#include <iostream>

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

class ReturnInstValue : public Value {
friend class ValueFactory;
protected:
	llvm::ReturnInst * asReturnInst() ;
public:
	ReturnInstValue(llvm::Value * value) : Value(value) {}
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
			oss << val->getValueString();
		} else {
			oss << "<Return Value Unknown>";
		}
	} else {
		oss << "null";
	}
	oss << ")";
	return oss.str();
}

class BinaryOperationValue : public Value {
friend class ValueFactory;
protected:
	 llvm::BinaryOperator * asBinaryOperator() ;
	virtual std::string getOperationSymbol()  = 0;
	virtual std::string getValueString() ;
public:
	BinaryOperationValue(llvm::Value * value) : Value(value) {}
};

 llvm::BinaryOperator * BinaryOperationValue::asBinaryOperator()  {
	return &llvm::cast<llvm::BinaryOperator>(*m_value);
}

std::string BinaryOperationValue::getValueString()  {
	llvm::BinaryOperator * binaryOp = asBinaryOperator();
	llvm::BinaryOperator::op_iterator it;
	std::string op_symbol = getOperationSymbol();
	ValueFactory * factory = ValueFactory::getInstance();
	bool is_first = true;
	std::ostringstream oss;
	for (it = binaryOp->op_begin(); it != binaryOp->op_end(); it++) {
		if (!is_first) {
			oss << " " << getOperationSymbol() << " ";
		}
		is_first = false;
		llvm::Value * llvmOperand = it->get();
		Value * operand = factory->getValue(llvmOperand);
		if (operand) {
			oss << operand->getValueString();
		} else {
			oss << "<Operand Unknown>";
		}
	}
	return oss.str();
}

class AdditionOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "+"; }
public:
	AdditionOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class SubtractionOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "-"; }
public:
	SubtractionOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class MultiplicationOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "*"; }
public:
	MultiplicationOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class DivisionOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "/"; }
public:
	DivisionOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class RemainderOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return "%"; }
public:
	RemainderOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
};

class ConstantValue : public Value {
protected:
	virtual std::string getValueString() ;
	virtual std::string getConstantString()  = 0;
public:
	ConstantValue(llvm::Value * value) : Value(value) {}
};

std::string ConstantValue::getValueString()  {
	return getConstantString();
}

class ConstantIntValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
public:
	ConstantIntValue(llvm::Value * value) : ConstantValue(value) {}
};

std::string ConstantIntValue::getConstantString()  {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	return apint.toString(10, true);
}

class ConstantFloatValue : public ConstantValue {
protected:
	virtual std::string getConstantString() ;
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

Value::Value(llvm::Value * value) : m_value(value),
		m_name(llvmValueName(value)) {
}

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

std::string Value::getName()  {
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

std::ostream& operator<<(std::ostream& os, Value& value)
{
    os << value.toString();
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
	//case llvm::BinaryOperator::Trunc:
	//case llvm::BinaryOperator::ZExt:
	//case llvm::BinaryOperator::SExt:
	//case llvm::BinaryOperator::FPTrunc:
	//case llvm::BinaryOperator::FPExt:
	//case llvm::BinaryOperator::FPToUI:
	//case llvm::BinaryOperator::FPToSI:
	//case llvm::BinaryOperator::UIToFP:
	//case llvm::BinaryOperator::SIToFP:
	//case llvm::BinaryOperator::IntToPtr:
	//case llvm::BinaryOperator::PtrToInt:
	//case llvm::BinaryOperator::BitCast:
	
	// Other instructions...
	//case llvm::BinaryOperator::ICmp:
	//case llvm::BinaryOperator::FCmp:
	//case llvm::BinaryOperator::PHI:
	//case llvm::BinaryOperator::Select:
	//case llvm::BinaryOperator::Call:
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
		llvm::errs() << "<Invalid operator> " <<
				instruction->getOpcodeName() << "\n";
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

