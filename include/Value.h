#ifndef VALUE_H
#define VALUE_H

#include <map>
#include <string>
#include <ostream>

#include <llvm/IR/Instruction.h>

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
friend std::ostream& operator<<(std::ostream& os,  Value& value);
friend class ValueFactory;
protected:
	static int valuesIndex;
	llvm::Value * m_value;
	std::string m_name;
	virtual std::string llvmValueName(llvm::Value * value);
	Value(llvm::Value * value);
public:
	virtual std::string getName() ;
	virtual std::string getValueString();
	virtual std::string toString() ;
	virtual bool update() { /* TODO */ return false; }
	virtual bool isSkip() ;
};
std::ostream& operator<<(std::ostream& os,  Value& value);

#endif
