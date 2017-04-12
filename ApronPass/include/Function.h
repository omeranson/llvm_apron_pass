#ifndef FUNCTION_H
#define FUNCTION_H

#include <string>
#include <map>

namespace llvm {
	class Function;
}

class Function {
protected:
	llvm::Function * m_function;
public:
	Function(llvm::Function * function) : m_function(function) {};
	bool isUserPointer(std::string & ptrname);
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
