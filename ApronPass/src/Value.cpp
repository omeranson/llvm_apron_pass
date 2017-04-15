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

class AllocaValue : public NopInstructionValue {
public:
	AllocaValue(llvm::Value * value) : NopInstructionValue(value) {}
};

class LoadValue : public NopInstructionValue {
public:
	LoadValue(llvm::Value * value) : NopInstructionValue(value) {}
};

class StoreValue : public NopInstructionValue {
public:
	StoreValue(llvm::Value * value) : NopInstructionValue(value) {}
};

class GepValue : public InstructionValue {
public:
	virtual llvm::GetElementPtrInst * asGetElementPtrInst();
	virtual void addOffsetConstraint(std::list<ap_tcons1_t> & constraints,
		ap_texpr1_t * value_texpr, const std::string & pointerName);
public:
	GepValue (llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip() { return false; }
	virtual void populateTreeConstraints(std::list<ap_tcons1_t> & constraints);
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
	rso << "&" << *pointer << "[" << *offset << "]";
	return rso.str();
}

void GepValue::addOffsetConstraint(std::list<ap_tcons1_t> & constraints,
		ap_texpr1_t * value_texpr, const std::string & pointerName) {
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	BasicBlock * basicBlock = getBasicBlock();
	ap_texpr1_t * var_texpr = basicBlock->createUserPointerOffsetTreeExpression(
			this, pointerName);
	ap_environment_t * environment = basicBlock->getEnvironment();
	ap_texpr1_extend_environment_with(value_texpr, environment);
	ap_texpr1_extend_environment_with(var_texpr, environment);
	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_SUB, value_texpr, var_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t result = ap_tcons1_make(AP_CONS_SUPEQ, texpr, zero);
	constraints.push_back(result);
}

void GepValue::populateTreeConstraints(std::list<ap_tcons1_t> & constraints) {
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	BasicBlock * basicBlock = getBasicBlock();
	Function * function = basicBlock->getFunction();
	AbstractState & abstractState = basicBlock->getAbstractState();
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::GetElementPtrInst * gepi = asGetElementPtrInst();

	Value * src = factory->getValue(gepi->getOperand(0));
	assert(src != this && "SSA assumption broken");

	Value * offset = factory->getValue(gepi->getOperand(1));

	std::string pointerName = src->getName();
	std::set<std::string> &dest = abstractState.m_mayPointsTo[getName()];
	dest.clear();
	basicBlock->forget(basicBlock->generateOffsetName(this, pointerName).c_str());
	if (function->isUserPointer(pointerName)) {
		dest.insert(pointerName);

		ap_texpr1_t * value_texpr = offset->createTreeExpression(basicBlock);
		addOffsetConstraint(constraints, value_texpr, pointerName);
		ap_texpr1_t * var_texpr = basicBlock->createUserPointerOffsetTreeExpression(
				this, pointerName);
		ap_tcons1_t greaterThan0 = ap_tcons1_make(
				AP_CONS_SUPEQ, ap_texpr1_copy(var_texpr), zero);
		constraints.push_back(greaterThan0);
	} else {
		std::set<std::string> &srcUserPointers = abstractState.m_mayPointsTo[pointerName];
		for (auto & srcPtrName : srcUserPointers) {
			dest.insert(srcPtrName);
			ap_texpr1_t * var_texpr = basicBlock->createUserPointerOffsetTreeExpression(
					this, srcPtrName);
			ap_tcons1_t greaterThan0 = ap_tcons1_make(
					AP_CONS_SUPEQ, ap_texpr1_copy(var_texpr), zero);
			constraints.push_back(greaterThan0);

			ap_texpr1_t * offset_texpr = offset->createTreeExpression(basicBlock);
			ap_texpr1_t * offset_var_texpr = basicBlock->createUserPointerOffsetTreeExpression(
					src, srcPtrName);
			ap_texpr1_extend_environment_with(offset_texpr, basicBlock->getEnvironment());
			ap_texpr1_extend_environment_with(offset_var_texpr, basicBlock->getEnvironment());
			ap_texpr1_t * value_texpr = ap_texpr1_binop(AP_TEXPR_ADD,
					offset_texpr, offset_var_texpr,
					AP_RTYPE_INT, AP_RDIR_ZERO);
			assert(value_texpr);
			addOffsetConstraint(constraints, value_texpr, srcPtrName);
		}
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

void InstructionValue::populateTreeConstraints(
			std::list<ap_tcons1_t> & constraints) {
	// TODO consider making a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	BasicBlock * basicBlock = getBasicBlock();
	ap_texpr1_t * var_texpr = createTreeExpression(basicBlock);
	assert(var_texpr && "Tree expression is NULL");
	ap_texpr1_t * value_texpr = createRHSTreeExpression();
	assert(value_texpr && "RHS Tree expression is NULL");

	basicBlock->extendTexprEnvironment(var_texpr);
	basicBlock->extendTexprEnvironment(value_texpr);

	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_SUB, value_texpr, var_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t result = ap_tcons1_make(AP_CONS_EQ, texpr, zero);
	constraints.push_back(result);
}

ap_texpr1_t * InstructionValue::createRHSTreeExpression() {
	abort();
}

bool InstructionValue::isSkip() {
	return true;
}

void InstructionValue::forget() {
	getBasicBlock()->forget(this);
}

BasicBlock * InstructionValue::getBasicBlock() {
	llvm::Instruction * instruction = asInstruction();
	llvm::BasicBlock * llvmBasicBlock = instruction->getParent();
	BasicBlockManager & factory = BasicBlockManager::getInstance();
	BasicBlock * result = factory.getBasicBlock(llvmBasicBlock);
	return result;
}

bool TerminatorInstructionValue::isSkip() {
	return true;
}

ap_tcons1_array_t TerminatorInstructionValue::getBasicBlockConstraints(BasicBlock * basicBlock) {
	return ap_tcons1_array_make(getBasicBlock()->getEnvironment(), 0);
}

class ReturnInstValue : public TerminatorInstructionValue {
friend class ValueFactory;
protected:
	llvm::ReturnInst * asReturnInst() ;
public:
	ReturnInstValue(llvm::Value * value) : TerminatorInstructionValue(value) {}
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
public:
	BinaryOperationValue(llvm::Value * value) : InstructionValue(value) {}
	virtual ap_texpr1_t * createOperandTreeExpression(int idx);
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

ap_texpr1_t * BinaryOperationValue::createOperandTreeExpression(int idx) {
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * llvmOperand = asUser()->getOperand(idx);
	Value * operand = factory->getValue(llvmOperand);
	if (!operand) {
		//llvm::errs() << "Unknown value:";
		//llvmOperand->print(llvm::errs());
		//llvm::errs() << "\n";
		abort();
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


class SHLOperationValue : public BinaryOperationValue {
protected:
	virtual std::string getOperationSymbol()  { return " << "; }
	virtual ap_texpr_op_t getTreeOperation()  { return AP_TEXPR_MOD; }
public:
	SHLOperationValue(llvm::Value * value) : BinaryOperationValue(value) {}
	ap_texpr1_t * createRHSTreeExpression();
};

ap_texpr1_t * SHLOperationValue::createRHSTreeExpression() {
	ap_texpr1_t * op0_texpr = createOperandTreeExpression(0);
	ap_texpr1_t * op1_texpr = createOperandTreeExpression(1);
	// TODO Handle reals
	// Align environments
	BasicBlock * basicBlock = getBasicBlock();
	basicBlock->extendTexprEnvironment(op0_texpr);
	basicBlock->extendTexprEnvironment(op1_texpr);
	ap_texpr1_t * two = ap_texpr1_cst_scalar_int(
			getBasicBlock()->getEnvironment(), 2);
	ap_texpr1_t * op1_shl = ap_texpr1_binop(
			AP_TEXPR_POW, two, op1_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_MUL, op0_texpr, op1_shl,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	return texpr;
}

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
	virtual unsigned getBitSize();
};

std::string ConstantIntValue::getConstantString()  {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	return apint.toString(10, true);
}

ap_texpr1_t * ConstantIntValue::createTreeExpression(
		BasicBlock * basicBlock) {
	llvm::ConstantInt & intValue = llvm::cast<llvm::ConstantInt>(*m_value);
	const llvm::APInt & apint = intValue.getValue();
	int64_t svalue = apint.getSExtValue();
	ap_texpr1_t * result = ap_texpr1_cst_scalar_int(
			basicBlock->getEnvironment(), svalue);
	return result;
}

unsigned ConstantIntValue::getBitSize() {
	return llvm::cast<llvm::ConstantInt>(*m_value).getBitWidth();
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

class CallValue : public InstructionValue {
protected:
	llvm::CallInst * asCallInst();
	virtual std::string getCalledFunctionName();
	bool isDebugFunction(const std::string & funcName) const;
	bool isKernelUserMemoryOperation(const std::string & funcName) const;
	bool isKernelUserMemoryTestOperation(const std::string & funcName) const;

	virtual void populateTreeConstraintsForAccessOK(std::list<ap_tcons1_t> & constraints);
	void populateTreeConstraintsForGetPutUser(
		std::list<ap_tcons1_t> & constraints,
		user_pointer_operation_e op);
	virtual void populateTreeConstraintsForGetUser(std::list<ap_tcons1_t> & constraints);
	virtual void populateTreeConstraintsForPutUser(std::list<ap_tcons1_t> & constraints);
	virtual void populateTreeConstraintsForClearUser(std::list<ap_tcons1_t> & constraints);
	virtual void populateTreeConstraintsForCopyToUser(std::list<ap_tcons1_t> & constraints);
	virtual void populateTreeConstraintsForCopyFromUser(std::list<ap_tcons1_t> & constraints);
	virtual void populateTreeConstraintsForStrnlenUser(std::list<ap_tcons1_t> & constraints);
	virtual void populateTreeConstraintsForStrncpyFromUser(std::list<ap_tcons1_t> & constraints);

	void populateMPT();
	virtual void populateTreeConstraintsForUserMemoryOperation(
			std::string & ptr, ap_texpr1_t * size,
			user_pointer_operation_e op);
	virtual void populateTreeConstraintsForUserMemoryOperation(
			Value * ptr, ap_texpr1_t * size,
			user_pointer_operation_e op);
	virtual void populateTreeConstraintsForUserMemoryOperation(
			llvm::Value * llvmptr, ap_texpr1_t * size,
			user_pointer_operation_e op);
	virtual void populateTreeConstraintsForGetPutUser(
			user_pointer_operation_e op);
	virtual void populateTreeConstraintsForLiteralSize(llvm::Value * ptr,
			llvm::Value * llvmsize, user_pointer_operation_e op);
	virtual void populateTreeConstraintsForCopyToFromUser(user_pointer_operation_e op);
public:
	CallValue(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();

    /**************************/
    /* OREN ISH SHALOM added: */
    /**************************/
    virtual ap_texpr1_t *createRHSTreeExpression();
	virtual void populateTreeConstraints(
			std::list<ap_tcons1_t> & constraints);
};

ap_texpr1_t *CallValue::createRHSTreeExpression()
{
    int inf_value = 0;
    int sup_value = 0;

    std::string abs_path_filename;
    llvm::raw_string_ostream abs_path_filename_builder(abs_path_filename);
    std::string funcname = getCalledFunctionName();
    abs_path_filename_builder << "/tmp/llvm_apron_pass/" << funcname << ".txt";

#   define MAX_SUMMARY_LENGTH 100
    char summary[MAX_SUMMARY_LENGTH]={0};
    FILE *fl = fopen(abs_path_filename_builder.str().c_str(),"rt");
    if (fl) {
        assert(fl && "Missing Procedure Summary");
        fscanf(fl,"%s",summary);
        llvm::errs() << "FROM " << summary << " SUMMARY: " << "[";
        fscanf(fl,"%s",summary);
        // llvm::errs() << "THIS SHOULD BE = AND IT IS " << summary << '\n';
        fscanf(fl,"%s",summary);
        // llvm::errs() << "THIS SHOULD BE [ AND IT IS " << summary << '\n';
        fscanf(fl,"%d",&inf_value);
        fscanf(fl,"%d",&sup_value);
            llvm::errs() << inf_value << "," << sup_value << "]" << '\n';
        fclose(fl);
    } else {
        llvm::errs() << "Couldn't open summary for " << funcname << "\n";
    }
	ap_texpr1_t *inf =
	    ap_texpr1_cst_scalar_int(
	        getBasicBlock()->getEnvironment(),
	        inf_value);

	return inf;
}

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
	if ("put_user" == funcName) {
		return true;
	}
	if ("clear_user" == funcName) {
		return true;
	}
	if ("copy_to_user" == funcName) {
		return true;
	}
	if ("copy_from_user" == funcName) {
		return true;
	}
	if ("strnlen_user" == funcName) {
		return true;
	}
	if ("strncpy_from_user" == funcName) {
		return true;
	}
	return false;
}

bool CallValue::isKernelUserMemoryTestOperation(const std::string & funcName) const {
	// TODO Memoize this method
	if ("add_user_pointer" == funcName) {
		return true;
	}
	return false;
}

bool CallValue::isSkip() {
	const std::string funcName = getCalledFunctionName();
	if (isDebugFunction(funcName)) {
		return true;
	}
	return false;
}

void CallValue::populateTreeConstraints(std::list<ap_tcons1_t> & constraints) {
	const std::string funcName = getCalledFunctionName();
	if (isKernelUserMemoryOperation(funcName)) {
		if ("access_ok" == funcName) {
			populateTreeConstraintsForAccessOK(constraints);
			return;
		}
		if ("get_user" == funcName) {
			populateTreeConstraintsForGetUser(constraints);
			return;
		}
		if ("put_user" == funcName) {
			populateTreeConstraintsForPutUser(constraints);
			return;
		}
		if ("clear_user" == funcName) {
			populateTreeConstraintsForClearUser(constraints);
			return;
		}
		if ("copy_to_user" == funcName) {
			populateTreeConstraintsForCopyToUser(constraints);
			return;
		}
		if ("copy_from_user" == funcName) {
			populateTreeConstraintsForCopyFromUser(constraints);
			return;
		}
		if ("strnlen_user" == funcName) {
			populateTreeConstraintsForStrnlenUser(constraints);
			return;
		}
		if ("strncpy_from_user" == funcName) {
			populateTreeConstraintsForStrncpyFromUser(constraints);
			return;
		}
	}
	if (isKernelUserMemoryTestOperation(funcName)) {
		if ("add_user_pointer" == funcName) {
			populateMPT();
			return;
		}
	}
	InstructionValue::populateTreeConstraints(constraints);
	return;
}

void CallValue::populateMPT() {
	BasicBlock * bb = getBasicBlock();
	AbstractState & abstractState = bb->getAbstractState();
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 3);
	// 0 -> source pointer
	// 1 -> dest pointer
	// 2 -> offset
	llvm::Value * llvmsrc = callinst->getArgOperand(0);
	llvm::Value * llvmdest = callinst->getArgOperand(1);
	llvm::Value * llvmoffset = callinst->getArgOperand(2);
	// abstractState.may_points_to[llvmsrc->getName().str()][llvmdest->getName().str()].insert(llvmoffset);
}

void CallValue::populateTreeConstraintsForAccessOK(std::list<ap_tcons1_t> & constraints) {
	// Do nothing
}

void CallValue::populateTreeConstraintsForUserMemoryOperation(
		std::string & ptr, ap_texpr1_t * size,
		user_pointer_operation_e op)
{
#if 0
	BasicBlock * bb = getBasicBlock();
	ValueFactory * valueFactory = ValueFactory::getInstance();
	AbstractState & abstractState = bb->getAbstractState();
	AbstractState::may_points_to_t & may_points_to = abstractState.may_points_to[ptr];
	for (auto & it : may_points_to) {
		std::string userPtr = it.first;
		std::set<llvm::Value*> & llvmoffsets = it.second;
		for (llvm::Value * llvmoffset : llvmoffsets) {
			Value * offset = valueFactory->getValue(llvmoffset);
			ap_texpr1_t * offsetExpr = offset->createTreeExpression(bb);
			std::string & userPtrOp = abstractState.getUserPointerName(userPtr, op);
			ap_environment_t * env = bb->getEnvironment();
			MemoryAccessAbstractValue maav(
					env, userPtrOp, offsetExpr, size);
			// Placed back in abstractState to be joined at end of BB
			abstractState.memoryAccessAbstractValues.push_back(maav);
		}
	}
#endif	
}

void CallValue::populateTreeConstraintsForUserMemoryOperation(
		Value * ptr, ap_texpr1_t * size,
		user_pointer_operation_e op) {
	populateTreeConstraintsForUserMemoryOperation(ptr->getName(), size, op);
}

void CallValue::populateTreeConstraintsForUserMemoryOperation(
		llvm::Value * llvmptr, ap_texpr1_t * size,
		user_pointer_operation_e op) {
	ValueFactory * valueFactory = ValueFactory::getInstance();
	Value * ptr = valueFactory->getValue(llvmptr);
	populateTreeConstraintsForUserMemoryOperation(ptr, size, op);
}

void CallValue::populateTreeConstraintsForGetPutUser(
		user_pointer_operation_e op) {
	/*
	 * Update the constraints to include that the pointer was 'read from'
	 */
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 2);
	ValueFactory * valueFactory = ValueFactory::getInstance();
	// Size: Width of first parameter
	llvm::Value * llvmdest = callinst->getArgOperand(0);
	Value * dest = valueFactory->getValue(llvmdest);
	unsigned size = dest->getByteSize();
	ap_texpr1_t * apsize = getBasicBlock()->getConstantTExpr(size);
	// Pointer + offset: Second parameter
	llvm::Value * src = callinst->getArgOperand(1);
	populateTreeConstraintsForUserMemoryOperation(src, apsize, op);
}

void CallValue::populateTreeConstraintsForGetUser(std::list<ap_tcons1_t> & constraints) {
	populateTreeConstraintsForGetPutUser(user_pointer_operation_read);
}

void CallValue::populateTreeConstraintsForPutUser(std::list<ap_tcons1_t> & constraints) {
	populateTreeConstraintsForGetPutUser(user_pointer_operation_write);
}

void CallValue::populateTreeConstraintsForLiteralSize(llvm::Value * ptr,
		llvm::Value * llvmsize, user_pointer_operation_e op) {
	ValueFactory * valueFactory = ValueFactory::getInstance();
	Value * sizeValue = valueFactory->getValue(llvmsize);
	ap_texpr1_t * size = sizeValue->createTreeExpression(getBasicBlock());

	populateTreeConstraintsForUserMemoryOperation(ptr, size, op);
}

void CallValue::populateTreeConstraintsForClearUser(std::list<ap_tcons1_t> & constraints) {
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 2);
	llvm::Value * ptr = callinst->getArgOperand(0);
	llvm::Value * size = callinst->getArgOperand(1);
	populateTreeConstraintsForLiteralSize(ptr, size, user_pointer_operation_write);
}

void CallValue::populateTreeConstraintsForCopyToFromUser(user_pointer_operation_e op) {
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 3);
	llvm::Value * ptr = callinst->getArgOperand(0);
	llvm::Value * size = callinst->getArgOperand(2);
	populateTreeConstraintsForLiteralSize(ptr, size, op);
}

void CallValue::populateTreeConstraintsForCopyToUser(std::list<ap_tcons1_t> & constraints) {
	populateTreeConstraintsForCopyToFromUser(user_pointer_operation_write);
}

void CallValue::populateTreeConstraintsForCopyFromUser(std::list<ap_tcons1_t> & constraints) {
	populateTreeConstraintsForCopyToFromUser(user_pointer_operation_read);
}

void CallValue::populateTreeConstraintsForStrnlenUser(std::list<ap_tcons1_t> & constraints) {
	// TODO Ignores first0
	llvm::CallInst * callinst = asCallInst();
	assert(callinst->getNumArgOperands() == 3);
	llvm::Value * ptr = callinst->getArgOperand(0);
	llvm::Value * size = callinst->getArgOperand(1);
	populateTreeConstraintsForLiteralSize(ptr, size, user_pointer_operation_read);
}

void CallValue::populateTreeConstraintsForStrncpyFromUser(std::list<ap_tcons1_t> & constraints) {
	// TODO Ignores first0
	populateTreeConstraintsForCopyFromUser(constraints);
}

class CompareValue : public BinaryOperationValue {
public:
	CompareValue(llvm::Value * value) : BinaryOperationValue(value) {}
	// TODO These probably work differently
	virtual ap_texpr_op_t getTreeOperation()  { abort(); }
	virtual constraint_condition_t getConditionType() = 0;
	virtual constraint_condition_t getNegatedConditionType() = 0;
};

class IntegerCompareValue : public CompareValue {
protected:
	virtual llvm::ICmpInst * asICmpInst();
	virtual std::string getPredicateString();
	virtual std::string getOperationSymbol();
public:
	IntegerCompareValue(llvm::Value * value) : CompareValue(value) {}
	virtual bool isSkip();
	virtual constraint_condition_t getConditionType();
	virtual constraint_condition_t getNegatedConditionType();
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

bool IntegerCompareValue::isSkip() {
	return true;
}

class PhiValue : public InstructionValue {
protected:
	virtual llvm::PHINode * asPHINode();
public:
	PhiValue(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
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

class SelectValueInstruction : public InstructionValue {
protected:
	virtual llvm::SelectInst * asSelectInst();
	virtual Value * getCondition();
	virtual Value * getTrueValue();
	virtual Value * getFalseValue();

	virtual ap_constyp_t constraintConditionToAPConsType(
			constraint_condition_t consCond);
	virtual bool isConstraintConditionToAPNeedsReverse(
			constraint_condition_t consCond);
	virtual ap_tcons1_t getConditionTcons(constraint_condition_t consCond);
	virtual ap_tcons1_t getConditionTrueTcons();
	virtual ap_tcons1_t getConditionFalseTcons();
	virtual ap_tcons1_t getSetValueTcons(Value * value);
	virtual ap_tcons1_t getSetTrueValueTcons();
	virtual ap_tcons1_t getSetFalseValueTcons();

public:
	SelectValueInstruction(llvm::Value * value) : InstructionValue(value) {}
	virtual std::string getValueString();
	virtual void populateTreeConstraints(
			std::list<ap_tcons1_t> & constraints);
	virtual bool isSkip();
};

llvm::SelectInst * SelectValueInstruction::asSelectInst() {
	return &llvm::cast<llvm::SelectInst>(*m_value);
}

Value * SelectValueInstruction::getCondition() {
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * condition = asSelectInst()->getCondition();
	Value * result = factory->getValue(condition);
	return result;
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
	appendValue(oss, getCondition(), "<unknown condition>") ;
	oss << " ? ";
	appendValue(oss, getTrueValue(), "<unknown value>") ;
	oss << " : ";
	appendValue(oss, getFalseValue(), "<unknown value>") ;
	oss << ")";
	return oss.str();
}

ap_constyp_t SelectValueInstruction::constraintConditionToAPConsType(
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
		abort();
	case cons_cond_false:
		abort();
	default:
		abort();
	}
}
bool SelectValueInstruction::isConstraintConditionToAPNeedsReverse(
		constraint_condition_t consCond) {
	switch (consCond) {
	case cons_cond_lt:
	case cons_cond_le:
		return true;
	default:
		return false;
	}
}

ap_tcons1_t SelectValueInstruction::getConditionTcons(
		constraint_condition_t consCond) {
	// TODO definitely make into a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	Value * condition = getCondition();
	CompareValue * compareValue = static_cast<CompareValue*>(condition);
	ap_constyp_t condtype = constraintConditionToAPConsType(consCond);
	bool reverse = isConstraintConditionToAPNeedsReverse(consCond);
	ap_texpr1_t * left = compareValue->createOperandTreeExpression(0);
	ap_texpr1_t * right = compareValue->createOperandTreeExpression(1);
	ap_texpr1_t * texpr ;
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

ap_tcons1_t SelectValueInstruction::getConditionTrueTcons() {
	Value * condition = getCondition();
	CompareValue * compareValue = static_cast<CompareValue*>(condition);
	return getConditionTcons(compareValue->getConditionType());
}

ap_tcons1_t SelectValueInstruction::getConditionFalseTcons() {
	Value * condition = getCondition();
	CompareValue * compareValue = static_cast<CompareValue*>(condition);
	return getConditionTcons(compareValue->getNegatedConditionType());
}

ap_tcons1_t SelectValueInstruction::getSetValueTcons(Value * value) {
	BasicBlock * basicBlock = getBasicBlock();
	return Value::getSetValueTcons(basicBlock, value);
}

ap_tcons1_t SelectValueInstruction::getSetTrueValueTcons() {
	return getSetValueTcons(getTrueValue());
}

ap_tcons1_t SelectValueInstruction::getSetFalseValueTcons() {
	return getSetValueTcons(getFalseValue());
}

void SelectValueInstruction::populateTreeConstraints(
		std::list<ap_tcons1_t> & constraints) {
	/*
	The command is %4 <- select %1, %2, %3
	We have all the information (it is in the list<ap_tcons1_t>). What if we
	do the following?:
		arr1 <- Create a constraint array
		arr2 <- clone it

		arr1.append(%1)
		arr1.append(%2 - %4 = 0)

		arr2.append(!%1)
		arr2.append(%3 - %4 = 0)

		abst_val1 <- from arr 1
		abst_val2 <- from arr 2
		abst_val = join(abst_val1, abst_val2)
		arr <- abst_val to list of constraints
	*/
	// Creates copies of the constraints.
	std::list<ap_tcons1_t> constraintsTrue = constraints;
	std::list<ap_tcons1_t> constraintsFalse = constraints;

	ap_tcons1_t conditionTrue = getConditionTrueTcons();
	ap_tcons1_t setTrueValue = getSetTrueValueTcons();
	ap_tcons1_t conditionFalse = getConditionFalseTcons();
	ap_tcons1_t setFalseValue = getSetFalseValueTcons();

	constraintsTrue.push_back(conditionTrue);
	constraintsTrue.push_back(setTrueValue);

	constraintsFalse.push_back(conditionFalse);
	constraintsFalse.push_back(setFalseValue);

	BasicBlock * basicBlock = getBasicBlock();
	ap_abstract1_t abstValueTrue =
			basicBlock->abstractOfTconsList(constraintsTrue);
	ap_abstract1_t abstValueFalse =
			basicBlock->abstractOfTconsList(constraintsFalse);

	ap_abstract1_t joinedValue = ap_abstract1_join(basicBlock->getManager(),
			false, &abstValueTrue, &abstValueFalse);

	ap_tcons1_array_t array = ap_abstract1_to_tcons_array(
			basicBlock->getManager(), &joinedValue);

	size_t arraySize = ap_tcons1_array_size(&array);
	for (int idx = 0; idx < arraySize; idx++) {
		ap_tcons1_t constraint = ap_tcons1_array_get(&array, idx);
		constraints.push_back(constraint);
	}
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
	virtual ap_texpr1_t * createRHSTreeExpression();
public:
	CastOperationValue(llvm::Value * value) : UnaryOperationValue(value) {}
	virtual std::string getValueString();
	virtual bool isSkip();
};

std::string CastOperationValue::getValueString() {
	llvm::UnaryInstruction * inst = asUnaryInstruction();
	llvm::Value * operand = inst->getOperand(0);
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(operand);
	std::ostringstream oss;
	oss << "cast(";
	appendValueName(oss, value, "<value unknown>");
	oss << ")";
	return oss.str();
}

bool CastOperationValue::isSkip() {
	return false;
}

ap_texpr1_t * CastOperationValue::createRHSTreeExpression() {
	llvm::UnaryInstruction * inst = asUnaryInstruction();
	llvm::Value * operand = inst->getOperand(0);
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(operand);
	return value->createTreeExpression(getBasicBlock());
}

class BranchInstructionValue : public TerminatorInstructionValue {
protected:
	virtual Value * getCondition();
	virtual ap_tcons1_t getConditionTcons(constraint_condition_t consCond);
	virtual ap_tcons1_t getConditionTrueTcons();
	virtual ap_tcons1_t getConditionFalseTcons();
	virtual ap_constyp_t constraintConditionToAPConsType(
			constraint_condition_t consCond);
	virtual bool isConstraintConditionToAPNeedsReverse(
			constraint_condition_t consCond);
	virtual ap_tcons1_array_t getBBConstraintsConditional(
			BasicBlock * basicBlock, llvm::BranchInst * branchInst);
	virtual ap_tcons1_array_t getBBConstraintsUnconditional(
			BasicBlock * basicBlock, llvm::BranchInst * branchInst);
public:
	BranchInstructionValue(llvm::Value * value) : TerminatorInstructionValue(value) {}
	virtual ap_tcons1_array_t getBasicBlockConstraints(BasicBlock * basicBlock);
};

ap_tcons1_array_t BranchInstructionValue::getBasicBlockConstraints(
		BasicBlock * basicBlock) {
	llvm::BranchInst * branchInst = &llvm::cast<llvm::BranchInst>(*m_value);
	if (branchInst->isConditional()) {
		return getBBConstraintsConditional(basicBlock, branchInst);
	} else {
		return getBBConstraintsUnconditional(basicBlock, branchInst);
	}
}

ap_tcons1_array_t BranchInstructionValue::getBBConstraintsConditional(
		BasicBlock* basicBlock, llvm::BranchInst * branchInst) {
	BasicBlockManager & manager = BasicBlockManager::getInstance();
	ap_environment_t * environment = 0;

	llvm::BasicBlock * llvmTrueSuccessor = branchInst->getSuccessor(0);
	BasicBlock * trueSuccessor = manager.getBasicBlock(llvmTrueSuccessor);
	if (basicBlock == trueSuccessor) {
		ap_tcons1_t conditionTrue = getConditionTrueTcons();
		environment = getBasicBlock()->getEnvironment();
		ap_tcons1_array_t trueConstraints = ap_tcons1_array_make(environment, 1);
		ap_tcons1_array_set(&trueConstraints, 0, &conditionTrue);
		return trueConstraints;
	}

	// TODO(oanson) Repeated code?
	llvm::BasicBlock * llvmFalseSuccessor = branchInst->getSuccessor(1);
	BasicBlock * falseSuccessor = manager.getBasicBlock(llvmFalseSuccessor);
	if (basicBlock == falseSuccessor) {
		ap_tcons1_t conditionFalse = getConditionFalseTcons();
		environment = getBasicBlock()->getEnvironment();
		ap_tcons1_array_t falseConstraints = ap_tcons1_array_make(environment, 1);
		ap_tcons1_array_set(&falseConstraints, 0, &conditionFalse);
		return falseConstraints;
	}
	llvm::errs() << "Warning: Given basic block is not a successor\n";
	return TerminatorInstructionValue::getBasicBlockConstraints(basicBlock);
}

ap_tcons1_array_t BranchInstructionValue::getBBConstraintsUnconditional(
		BasicBlock* basicBlock, llvm::BranchInst * branchInst) {
	llvm::BasicBlock * singleSuccessor = branchInst->getSuccessor(0);
	BasicBlockManager & manager = BasicBlockManager::getInstance();
	BasicBlock * succBasicBlock = manager.getBasicBlock(singleSuccessor);
	if (basicBlock != succBasicBlock) {
		llvm::errs() << "Warning: Given basic block is not a successor\n";
	}
	return TerminatorInstructionValue::getBasicBlockConstraints(basicBlock);
}

// TODO(oanson) Code copied from SelectValueInstruction
Value * BranchInstructionValue::getCondition() {
	llvm::BranchInst * branchInst = &llvm::cast<llvm::BranchInst>(*m_value);
	ValueFactory * factory = ValueFactory::getInstance();
	llvm::Value * condition = branchInst->getCondition();
	Value * result = factory->getValue(condition);
	return result;
}

ap_constyp_t BranchInstructionValue::constraintConditionToAPConsType(
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
		llvm::errs() << "BranchInstructionValue::constraintConditionToAPConsType: Constant condition true\n";
		abort();
	case cons_cond_false:
		llvm::errs() << "BranchInstructionValue::constraintConditionToAPConsType: Constant condition false\n";
		abort();
	default:
		llvm::errs() << "BranchInstructionValue::constraintConditionToAPConsType: Constant condition unknown: " << consCond << "\n";
		abort();
	}
}

bool BranchInstructionValue::isConstraintConditionToAPNeedsReverse(
		constraint_condition_t consCond) {
	switch (consCond) {
	case cons_cond_lt:
	case cons_cond_le:
		return true;
	default:
		return false;
	}
}

ap_tcons1_t BranchInstructionValue::getConditionTcons(
		constraint_condition_t consCond) {
	// TODO definitely make into a global
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	Value * condition = getCondition();
	CompareValue * compareValue = static_cast<CompareValue*>(condition);
	ap_constyp_t condtype = constraintConditionToAPConsType(consCond);
	bool reverse = isConstraintConditionToAPNeedsReverse(consCond);
	ap_texpr1_t * left = compareValue->createOperandTreeExpression(0);
	ap_texpr1_t * right = compareValue->createOperandTreeExpression(1);
	ap_texpr1_t * texpr ;
	BasicBlock * basicBlock = getBasicBlock();
	basicBlock->extendTexprEnvironment(left);
	basicBlock->extendTexprEnvironment(right);
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

ap_tcons1_t BranchInstructionValue::getConditionTrueTcons() {
	Value * condition = getCondition();
	CompareValue * compareValue = static_cast<CompareValue*>(condition);
	return getConditionTcons(compareValue->getConditionType());
}

ap_tcons1_t BranchInstructionValue::getConditionFalseTcons() {
	Value * condition = getCondition();
	CompareValue * compareValue = static_cast<CompareValue*>(condition);
	return getConditionTcons(compareValue->getNegatedConditionType());
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

ap_texpr1_t * Value::createTreeExpression(BasicBlock * basicBlock) {
	return basicBlock->getVariableTExpr(this);
}

ap_tcons1_t Value::getSetValueTcons(BasicBlock * basicBlock, Value * other) {
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	ap_texpr1_t * var_texpr = createTreeExpression(basicBlock);
	ap_texpr1_t * value_texpr = other->createTreeExpression(basicBlock);
	// Verify the environments are up-to-date
	basicBlock->extendTexprEnvironment(var_texpr);
	basicBlock->extendTexprEnvironment(value_texpr);
	ap_texpr1_t * texpr = ap_texpr1_binop(
			AP_TEXPR_SUB, value_texpr, var_texpr,
			AP_RTYPE_INT, AP_RDIR_ZERO);
	ap_tcons1_t result = ap_tcons1_make(AP_CONS_EQ, texpr, zero);
	return result;
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
	case llvm::BinaryOperator::LShr:
		return new SHLOperationValue(instruction);
	//case llvm::BinaryOperator::AShr:
	//case llvm::BinaryOperator::VAArg:
	//case llvm::BinaryOperator::ExtractElement:
	//case llvm::BinaryOperator::InsertElement:
	//case llvm::BinaryOperator::ShuffleVector:
	//case llvm::BinaryOperator::ExtractValue:
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
	return NULL;
}
