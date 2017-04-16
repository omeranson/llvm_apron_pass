#ifndef FUNCTION_H
#define FUNCTION_H

#include <string>
#include <map>

#include <ap_abstract1.h>

namespace llvm {
	class Function;
	class ReturnInst;
}

class BasicBlock;

class Function {
protected:
	llvm::Function * m_function;
public:
	Function(llvm::Function * function) : m_function(function) {};
	bool isUserPointer(std::string & ptrname);
	virtual ap_abstract1_t trimmedLastAbstractValue();
	virtual llvm::ReturnInst * getReturnInstruction();
	virtual BasicBlock * getReturnBasicBlock();
	virtual bool isVarInOut(const char * varname);
};

class FunctionManager{
protected:
	static FunctionManager instance;
	std::map<llvm::Function *, Function *> instances;
	FunctionManager() {};
public:
	static FunctionManager & getInstance();
	Function * getFunction(llvm::Function * function);

};
#endif // FUNCTION_H
