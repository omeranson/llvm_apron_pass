#ifndef VALUE_H
#define VALUE_H

#include <map>
#include <string>
#include <ostream>
#include <list>

#include <llvm/IR/Instruction.h>
#include <llvm/Support/raw_ostream.h>

#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>

#include <AbstractState.h>
#include <BasicBlock.h>

class Value;

class ValueFactory {
protected:
	static ValueFactory * instance;
	std::map<llvm::Value *, Value *> values;
	Value * createValue(llvm::Value *);
	Value * createInstructionValue(llvm::Instruction *);
	Value * createConstantValue(llvm::Constant *);
	ValueFactory();

	std::map<Value *, llvm::Value *> m_createdInstances;
public:
	Value * getValue(llvm::Value *);
	static ValueFactory * getInstance();
	static void deleteCreatedInstances();
};

class Value { 
friend class ValueFactory;
protected:
	static int valuesIndex;
	llvm::Value * m_value;
	std::string m_name;

	Value(llvm::Value * value);
	virtual std::string llvmValueName(llvm::Value * value);
public:
	virtual std::string & getName();
	virtual std::string getValueString();
	virtual std::string toString();
	virtual bool isSkip();
	virtual bool isPointer();
	virtual bool isConstant() const;

	virtual ap_texpr1_t * createTreeExpression(AbstractState & state);
	virtual ap_texpr1_t * createTreeExpression(ApronAbstractState & state);
	virtual void havoc(AbstractState & state);
	virtual void assign0(AbstractState & state);

	virtual const std::set<std::string> * mayPointsToUserBuffers(AbstractState & state);
	virtual void updateAssumptions(BasicBlock * source, BasicBlock * dest, AbstractState & state);
	virtual void updateConditionalAssumptions(AbstractState & state, bool isNegated);

	virtual unsigned getBitSize();
	virtual unsigned getByteSize();
};

std::ostream& operator<<(std::ostream& os,  Value& value);
std::ostream& operator<<(std::ostream& os,  Value* value);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, Value& value);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, Value* value);

class InstructionValue : public Value {
protected:
	virtual llvm::Instruction * asInstruction();
	virtual BasicBlock * getBasicBlock();
	virtual Function * getFunction();
public:
	InstructionValue(llvm::Value * value) : Value(value) {}
	virtual void update(AbstractState & state);
	virtual ap_texpr1_t * createRHSTreeExpression(AbstractState & state);
	virtual Value * getOperandValue(int idx);
	virtual const std::set<std::string> * mayPointsToUserBuffers(AbstractState & state);
	virtual bool isSkip();
};

class TerminatorInstructionValue : public InstructionValue {
public:
	TerminatorInstructionValue(llvm::Value * value) : InstructionValue(value) {}
	virtual bool isSkip();
};

#endif
