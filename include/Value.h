#ifndef VALUE_H
#define VALUE_H

#include <map>
#include <string>
#include <ostream>

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

class AbstractManagerSingleton {
protected:
	static AbstractManagerSingleton * instance;
	ap_manager_t * m_ap_manager;
	ap_environment_t *m_ap_environment;
	AbstractManagerSingleton();
public:
	static AbstractManagerSingleton & getInstance();
	ap_manager_t * getManager();
	ap_environment_t * getEnvironment();
	ap_abstract1_t bottom();
};

class Value { 
friend class ValueFactory;
protected:
	static int valuesIndex;
	llvm::Value * m_value;
	std::string m_name;
	ap_abstract1_t m_abst_value;

	Value(llvm::Value * value);
	virtual std::string llvmValueName(llvm::Value * value);
	virtual bool is_eq(ap_abstract1_t & value);
public:
	virtual std::string getName();
	virtual std::string getValueString();
	virtual std::string toString();
	virtual bool update();
	virtual bool isSkip();

	virtual bool join(Value & value);
	virtual bool meet(Value & value);
	virtual bool isTop();
	virtual bool isBottom();
	virtual bool operator==(Value & value);

};
std::ostream& operator<<(std::ostream& os,  Value& value);
std::ostream& operator<<(std::ostream& os,  Value* value);

#endif
