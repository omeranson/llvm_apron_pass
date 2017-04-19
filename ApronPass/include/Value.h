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
public:
	Value * getValue(llvm::Value *);
	static ValueFactory * getInstance();
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

	virtual ap_texpr1_t * createTreeExpression(BasicBlock * basicBlock);
	virtual ap_tcons1_t getSetValueTcons(
			BasicBlock * basicBlock, Value * other);
	virtual ap_tcons1_t getValueEq0Tcons(
			BasicBlock * basicBlock);
	virtual void havoc(AbstractState & state);

	virtual void populateMayPointsToUserBuffers(std::set<std::string> & buffers);

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
	//virtual BasicBlock * getBasicBlock();
	virtual Function * getFunction();
public:
	InstructionValue(llvm::Value * value) : Value(value) {}
	virtual void update(AbstractState & state);
	virtual ap_texpr1_t * createRHSTreeExpression();
	virtual void populateMayPointsToUserBuffers(std::set<std::string> & buffers);
	virtual bool isSkip();
	virtual void forget();
};

class TerminatorInstructionValue : public InstructionValue {
public:
	TerminatorInstructionValue(llvm::Value * value) : InstructionValue(value) {}
	virtual bool isSkip();
	virtual ap_tcons1_array_t getBasicBlockConstraints(BasicBlock * basicBlock);
};

#endif
