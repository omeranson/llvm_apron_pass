#ifndef FUNCTION_H
#define FUNCTION_H

#include <string>
#include <map>
#include <vector>

#include <ap_abstract1.h>

#include <APStream.h>
#include <BasicBlock.h>

namespace llvm {
	class Function;
	class ReturnInst;
}

class BasicBlock;

struct Contract {
	Function * function;
	Contract(Function * function) : function(function) {}
};

struct Conjunction {
	ap_tcons1_array_t * array;
	Conjunction(ap_tcons1_array_t * array) : array(array) {}
};

class Function {
protected:
	llvm::Function * m_function;
public:
	Function(llvm::Function * function) : m_function(function) {};
	bool isUserPointer(std::string & ptrname);
	std::vector<std::string> getUserPointers();
	virtual ap_abstract1_t trimmedLastASAbstractValue();
	virtual ap_abstract1_t trimmedLastBBAbstractValue();
	virtual ap_abstract1_t trimmedLastJoinedAbstractValue();
	virtual llvm::ReturnInst * getReturnInstruction();
	virtual BasicBlock * getReturnBasicBlock();
	virtual bool isVarInOut(const char * varname);
	std::map<std::string, ap_abstract1_t> generateErrorStates();
	std::string getName();
	std::string getSignature();
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

template <class stream>
inline stream & operator<<(stream & s, Conjunction contract) {
	s << "(1 ";
	size_t size = ap_tcons1_array_size(contract.array);
	for (int idx = 0; idx < size; idx++) {
		ap_tcons1_t tcons = ap_tcons1_array_get(contract.array, idx);
		s << "&& (" << tcons << ")";
	}
	s << ")";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Contract contract) {
	Function * function = contract.function;
	s << function->getSignature() << " {\n";
	std::vector<std::string> userPointers = function->getUserPointers();
	std::map<std::string, ap_abstract1_t> errorStates = function->generateErrorStates();
	ap_abstract1_t asabstarct1 = function->trimmedLastASAbstractValue();
	for (std::string & userPointer : userPointers) {
		s << "\tunsigned size(" << userPointer << ") = SE_size_obj(" << userPointer << ");\n";
		s << "\tunsigned offset(" << userPointer << ") = " << userPointer << " - SE_base_obj(" << userPointer << ");\n";
	}
	s << "\tint res;\n"; // TODO(oanson) res type should be taken from signature
	// Preconditions
	ap_manager_t * manager = BasicBlockManager::getInstance().m_manager;
	for (auto & errorState : errorStates) {
		s << "\t// Error state for " << errorState.first << ":\n";
		ap_tcons1_array_t array = ap_abstract1_to_tcons_array(manager, &errorState.second);
		s << "\tassert(!" << Conjunction(&array) << " && \"Invalid pointer " << errorState.first << "\");\n";
	}
	// Modifications
	// 	For each buf : user buffer 
	// 		HAVOC(buf, last(buf,write))
	for (std::string & userPointer : userPointers) {
		s << "\t// Modification for " << userPointer << ":\n";
		s << "\tunsigned last(" << userPointer << ", write);\n";
		s << "\tHAVOC(last(" << userPointer << ", write));\n";
		ap_tcons1_array_t array = ap_abstract1_to_tcons_array(manager, &asabstarct1);
		s << "\tif " << Conjunction(&array) << " {\n";
		s << "\t\tHAVOC(" << userPointer << ", " << " last(" << userPointer << ", write));\n";
		s << "\t}\n";
	}
	// Postconditions
	s << "}\n";
	return s;
}

#endif // FUNCTION_H
