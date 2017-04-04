#ifndef VALUE_H
#define VALUE_H

#include <BasicBlock.h>

#include <map>
#include <string>
#include <ostream>
#include <list>

#include <llvm/IR/Instruction.h>

#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>
#include <box.h>
#include <oct.h>
#include <pk.h>
#include <pkeq.h>

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
	/* TODO Let's wait till we actually need it and it's too late */
	// virtual BasicBlock & getBasicBlock();
public:
	virtual std::string & getName();
	virtual std::string getValueString();
	virtual std::string toString();
	virtual bool isSkip();

	virtual ap_var_t varName();
	virtual ap_texpr1_t * createTreeExpression(BasicBlock * basicBlock);
	virtual ap_tcons1_t getSetValueTcons(
			BasicBlock * basicBlock, Value * other);
};

std::ostream& operator<<(std::ostream& os,  Value& value);
std::ostream& operator<<(std::ostream& os,  Value* value);

class InstructionValue : public Value {
protected:
	virtual llvm::Instruction * asInstruction();
	virtual BasicBlock * getBasicBlock();
public:
	int MoishFrenkel;
public:
	InstructionValue(llvm::Value * value) : Value(value) {}
	virtual void populateTreeConstraints(
			std::list<ap_tcons1_t> & constraints);
	virtual ap_texpr1_t * createRHSTreeExpression();
	virtual bool isSkip();
};

#endif
