#ifndef FUNCTION_H
#define FUNCTION_H

#include <string>
#include <map>
#include <vector>

#include <ap_abstract1.h>

#include <llvm/IR/Instructions.h>

#include <APStream.h>
#include <AbstractState.h>
#include <BasicBlock.h>
#include <Value.h>

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
	std::vector<std::string> getUserPointers();
	// Kept for debug purposes only
	virtual ap_abstract1_t trimmedLastASAbstractValue();
	virtual AbstractState & getReturnAbstractState();
	virtual llvm::ReturnInst * getReturnInstruction();
	virtual BasicBlock * getReturnBasicBlock();
	virtual bool isVarInOut(const char * varname);
	virtual ApronAbstractState minimize(ApronAbstractState & state);
	std::map<std::string, ApronAbstractState> generateErrorStates();
	std::string getName();
	std::vector<std::pair<std::string, std::string> > getArgumentStrings();
	std::string getSignature();
	std::string getTypeString(llvm::Type * type);
	std::string getReturnTypeString();
	const std::vector<ImportIovecCall> & getImportIovecCalls();
	const std::vector<CopyMsghdrFromUserCall> & getCopyMsghdrFromUserCalls();
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
