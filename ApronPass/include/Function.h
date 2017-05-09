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
	std::string m_name;

	void pushBackIfConstrainsUserPointers(
			std::map<std::string, ApronAbstractState> & result,
			AbstractState & state,
			std::vector<std::string> & userBuffers);
public:
	Function(llvm::Function * function);
	bool isUserPointer(std::string & ptrname);
	std::vector<std::string> getUserPointers();
	std::vector<std::string> getConstrainedUserPointers(AbstractState & state);
	std::map<BasicBlock *, AbstractState> m_successMemOpsAbstractStates;
	// Kept for debug purposes only
	virtual ap_abstract1_t trimAbstractValue(AbstractState & state);
	virtual AbstractState & getReturnAbstractState();
	virtual llvm::ReturnInst * getReturnInstruction();
	virtual BasicBlock * getReturnBasicBlock();
	virtual bool isVarInOut(const char * varname);
	virtual bool isSizeVariable(const char * varname);
	virtual bool isLastVariable(const char * varname);
	virtual bool isOffsetVariable(const char * varname);
	virtual bool isReturnValue(const char * varname);
	virtual bool isFunctionParameter(const char * varname);
	virtual ApronAbstractState minimize(ApronAbstractState & state);
	virtual std::multimap<std::string, ApronAbstractState> getErrorStates();
	virtual void insertErrorState(std::multimap<std::string, ApronAbstractState> & states,
		const ApronAbstractState & baseState, const std::string & userBuffer, user_pointer_operation_e op);
	virtual ApronAbstractState getSuccessState();
	virtual const std::string & getName() const;
	virtual std::vector<std::pair<std::string, std::string> > getArgumentStrings();
	virtual std::string getSignature();
	virtual std::string getTypeString(llvm::Type * type);
	virtual std::string getReturnTypeString();
	virtual const std::string & getReturnValueName();
	virtual const std::vector<ImportIovecCall> & getImportIovecCalls();
	virtual const std::vector<CopyMsghdrFromUserCall> & getCopyMsghdrFromUserCalls();
	virtual BasicBlock * getRoot() const;
};

class Alias : public Function {
protected:
	llvm::GlobalAlias * m_alias;
public:
	Alias(llvm::GlobalAlias * alias, llvm::Function * function);
	virtual std::vector<std::pair<std::string, std::string> > getArgumentStrings();
};

class FunctionManager{
protected:
	static FunctionManager instance;
	std::map<llvm::Function *, Function *> instances;
	FunctionManager() {};
public:
	static FunctionManager & getInstance();
	Function * getFunction(llvm::Function * function);
	Function * getFunction(llvm::GlobalAlias * alias);

};

#endif // FUNCTION_H
