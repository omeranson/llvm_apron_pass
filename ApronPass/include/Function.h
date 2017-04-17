#ifndef FUNCTION_H
#define FUNCTION_H

#include <string>
#include <map>
#include <vector>

#include <ap_abstract1.h>

#include <llvm/IR/Instructions.h>

#include <APStream.h>
#include <BasicBlock.h>
#include <Value.h>

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
	std::string base;
	Conjunction(ap_tcons1_array_t * array) : base("1"), array(array) {}
	Conjunction(const std::string & base, ap_tcons1_array_t * array) : base(base), array(array) {}
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
	const std::vector<ImportIovecCall> & getImportIovecCalls();
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
	s << "(" << contract.base;
	size_t size = ap_tcons1_array_size(contract.array);
	for (int idx = 0; idx < size; idx++) {
		ap_tcons1_t tcons = ap_tcons1_array_get(contract.array, idx);
		s << " && (" << tcons << ")";
	}
	s << ")";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Contract contract) {
	Function * function = contract.function;
	// Preamble
	s << function->getSignature() << " {\n";
	s << "\t// Preamble\n"; // TODO(oanson) res type should be taken from signature
	std::vector<std::string> userPointers = function->getUserPointers();
	std::map<std::string, ap_abstract1_t> errorStates = function->generateErrorStates();
	ap_abstract1_t asabstarct1 = function->trimmedLastASAbstractValue();
	for (std::string & userPointer : userPointers) {
		s << "\tunsigned size(" << userPointer << ") = SE_size_obj(" << userPointer << ");\n";
		s << "\tunsigned offset(" << userPointer << ") = " << userPointer << " - SE_base_obj(" << userPointer << ");\n";
	}
	s << "\tint res;\n"; // TODO(oanson) res type should be taken from signature
	s << "\tbool b;\n";
	// Preconditions
	// Standard variables
	s << "\t// Preconditions\n";
	ap_manager_t * manager = BasicBlockManager::getInstance().m_manager;
	for (auto & errorState : errorStates) {
		s << "\t// Error state for " << errorState.first << ":\n";
		ap_tcons1_array_t array = ap_abstract1_to_tcons_array(manager, &errorState.second);
		s << "\tassert(!" << Conjunction(&array) << " && \"Invalid pointer " << errorState.first << "\");\n";
	}
	// IOVectors
	// For each op, ptr, len : import_iovec calls
	const std::vector<ImportIovecCall> & importIovecCalls = function->getImportIovecCalls();
	if (!importIovecCalls.empty()) {
		s << "\tint idx;\n";
	}
	for (const ImportIovecCall & call : importIovecCalls) {
		s << "\t// Error state for " << *call.iovec_name << ":\n";
	// 	Verify iovec not accessed beyond end of object
		s << "\tassert(size(" << *call.iovec_name <<
				") <= sizeof(struct iovec)*" << *call.iovec_len_name <<
				" && \"Invalid iovec pointer " << *call.iovec_name << "\");\n";
	// 	Verify each item within iovec
		s << "\tfor (idx = 0; idx < " << *call.iovec_len_name << "; idx++) {\n";
		s << "\t\tunsigned iovec_element_size = SE_size_obj(" << *call.iovec_name << "[idx].iov_base);\n";
		s << "\t\tassert(iovec_element_size >= " << *call.iovec_name << "[idx].iov_len);\n";
		s << "\t}\n";
	}
	// Modifications
	// 	Standard variables
	// 	For each buf : user buffer
	// 		HAVOC(buf, last(buf,write))
	s << "\t// Modifications\n";
	for (std::string & userPointer : userPointers) {
		s << "\t// Modification for " << userPointer << ":\n";
		s << "\tunsigned last(" << userPointer << ", write);\n";
		s << "\tHAVOC(last(" << userPointer << ", write));\n";
		ap_tcons1_array_t array = ap_abstract1_to_tcons_array(manager, &asabstarct1);
		s << "\tif " << Conjunction(&array) << " {\n";
		s << "\t\tHAVOC(" << userPointer << ", " << " last(" << userPointer << ", write));\n";
		s << "\t}\n";
	}
	// IOVectors
	// For each op, ptr, len : import_iovec calls
	for (const ImportIovecCall & call : importIovecCalls) {
		if (call.op != user_pointer_operation_write) {
			continue;
		}
		s << "\t// Modification for " << *call.iovec_name << ":\n";
		s << "\tfor (idx = 0; idx < " << *call.iovec_len_name << "; idx++) {\n";
		// 	HAVOC all internal pointers
		s << "\t\tHAVOC(" << *call.iovec_name << "[idx].iov_base, " << *call.iovec_name << "[idx].iov_len);\n";
		s << "\t}\n";
	}
	// Postconditions
	s << "\t// Postconditions\n";
	ap_abstract1_t retvalAbstract1 = function->trimmedLastBBAbstractValue();
	llvm::ReturnInst * returnInst = function->getReturnInstruction();
	llvm::Value * returnValue = returnInst->getReturnValue();
	ValueFactory * factory = ValueFactory::getInstance();
	Value * returnValueValue = factory->getValue(returnValue);
	std::string & returnValueName = returnValueValue->getName();
	ap_var_t oldName = (ap_var_t)returnValueName.c_str();
	ap_var_t newName = (ap_var_t)"res";
	ap_abstract1_t retvalAbstract1_renamed = ap_abstract1_rename_array(
			manager, false, &retvalAbstract1,
			&oldName, &newName, 1);
	ap_tcons1_array_t array = ap_abstract1_to_tcons_array(manager, &retvalAbstract1_renamed);
	s << "\tHAVOC(b);\n";
	s << "\tHAVOC(res);\n";
	s << "\tif " << Conjunction("b", &array) << " {\n";
	s << "\t\treturn res;\n";
	s << "\t}\n";

	// Postamble
	s << "\tassume(false)\n";
	s << "}\n";

	return s;
}

#endif // FUNCTION_H
