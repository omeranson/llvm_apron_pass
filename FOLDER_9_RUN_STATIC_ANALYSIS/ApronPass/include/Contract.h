#ifndef CONTRACT_H
#define CONTRACT_H

#include <AbstractState.h>
#include <Function.h>

#define StreamHelper(C, I) \
template <class T>\
struct C {\
	const T * t;\
	C(const T * t) : t(t) {}\
};\
\
template <class T>\
C<T> I(const T * t) {\
	return C<T>(t);\
}

StreamHelper(Contract, contract)
StreamHelper(Preamble, preamble)
StreamHelper(Precondition, precondition)
StreamHelper(Modification, modification)
StreamHelper(Havoc, havoc)

struct Conjunction {
	ap_tcons1_array_t * array;
	std::string base;
	Conjunction(ap_tcons1_array_t * array) : base("1"), array(array) {}
	Conjunction(const std::string & base, ap_tcons1_array_t * array) : base(base), array(array) {}
};

class Depth {
public:
	int m_depth;
private:
	Depth() : m_depth(0) {}
	static Depth depth;
public:
	static Depth & getInstance() {
		return depth;
	}
	Depth & operator++() {
		m_depth++;
		return *this;
	}
	Depth & operator--() {
		m_depth--;
		return *this;
	}
};
Depth Depth::depth;
Depth & depth = Depth::getInstance();

template <class stream>
inline stream & operator<<(stream & s, Depth & depth) {
	std::string buf;
	llvm::raw_string_ostream rso(buf);
	for (int count = 0; count < depth.m_depth; count++) {
		rso<<"\t";
	}
	s << rso.str();
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Preamble<std::string> p) {
	const std::string * name = p.t;
	s << depth << "i64 size(" << *name << ") = SE_size_obj(" << *name << ") - " << 
			"((uintptr_t)" << *name << " - SE_base_obj(" << *name << "));\n";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Preamble<ImportIovecCall> p) {
	const ImportIovecCall & call = *p.t;
	s << preamble(&call.iovec_name);
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Preamble<CopyMsghdrFromUserCall> p) {
	const CopyMsghdrFromUserCall & call = *p.t;
	s << preamble(&call.msghdr_name);
	ImportIovecCall iic = call.asImportIovecCall();
	const std::string & iovec_name = iic.iovec_name;
	s << depth << "struct iovec * " << iovec_name << " = " << call.msghdr_name << "->msg_iov;\n";
	s << preamble(&iic);
	return s;
}


template <class stream, class T>
inline stream & operator<<(stream & s, Havoc<T> h) {
	const T & var = *h.t;
	s << depth << "i64 " << var << ";\n";
	s << depth << "HAVOC(" << var << ");\n";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s,
		Precondition<std::pair<const std::string, ApronAbstractState> > p) {
	const std::pair<std::string, ApronAbstractState> & pair = *p.t;
	const std::string & name = pair.first;
	const ApronAbstractState & state = pair.second;
	// call SE_SAT
	ap_tcons1_array_t array = ap_abstract1_to_tcons_array(
			apron_manager, (ap_abstract1_t*)&state.m_abstract1);
	s << depth << "if(SE_SAT(" << Conjunction(&array) << ")) {\n";
	++depth;
	s << depth << "warn(\"Invalid pointer " << name << "\");\n";
	--depth;
	s << depth << "}\n";
	ap_tcons1_array_clear(&array);
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Precondition<ImportIovecCall> p) {
	const ImportIovecCall & call = *p.t;
	s << depth << "// Error state for iovec " << call.iovec_name << ":\n";
// 	Verify iovec not accessed beyond end of object
	s << depth << "if (SE_SAT(!(size(" << call.iovec_name <<
			") >= sizeof(struct iovec)*" << call.iovec_len_name <<
			"))) {\n";
	++depth;
	s << depth << "warn(\"Invalid iovec pointer " << call.iovec_name << "\");\n";
	--depth;
	s << depth << "}\n";
// 	Verify each item within iovec
	s << depth << "for (idx = 0; idx < " << call.iovec_len_name << "; idx++) {\n";
	++depth;
	s << depth << "i64 iovec_element_size = SE_size_obj(" << call.iovec_name << "[idx].iov_base);\n";
	s << depth << "if (SE_SAT(!(iovec_element_size >= " << call.iovec_name << "[idx].iov_len))) {\n";
	++depth;
	s << depth << "warn(\"Invalid iovec internal pointer " << call.iovec_name << "\");\n";
	--depth;
	s << depth << "}\n";
	--depth;
	s << depth << "}\n";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Precondition<CopyMsghdrFromUserCall> p) {
	const CopyMsghdrFromUserCall & call = *p.t;
	s << depth << "// Error state for msghdr " << call.msghdr_name << ":\n";
	s << depth << "if (SE_SAT(!(size(" << call.msghdr_name <<
			") >= sizeof(struct msghdr)))) {\n";
	++depth;
	s << depth << "warn(\"Invalid msghdr pointer " << call.msghdr_name << "\");\n";
	--depth;
	s << depth << "}\n";
	ImportIovecCall iic = call.asImportIovecCall();
	s << precondition(&iic);
	// XXX(oanson) Incomplete - msghdr has other fields
	// 	msg_name (len: msg_namelen)
	s << depth << "if (SE_SAT(!(size(" << call.msghdr_name << "->msg_name) >= "
			<< call.msghdr_name << "->msg_namelen))) {\n";
	++depth;
	s << depth << "warn(\"Invalid pointer " << call.msghdr_name << "->msg_name\");\n";
	--depth;
	s << depth << "}";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Modification<ImportIovecCall> p) {
	const ImportIovecCall & call = *p.t;
	if (call.op != user_pointer_operation_write) {
		return s;
	}
	s << depth << "// Modification for " << call.iovec_name << ":\n";
	s << depth << "for (idx = 0; idx < " << call.iovec_len_name << "; idx++) {\n";
	++depth;
	s << depth << "HAVOC_SIZE(" << call.iovec_name << "[idx].iov_base, " << call.iovec_name << "[idx].iov_len);\n";
	--depth;
	s << depth << "}\n";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, Modification<CopyMsghdrFromUserCall> p) {
	const CopyMsghdrFromUserCall & call = *p.t;
	ImportIovecCall iic = call.asImportIovecCall();
	s << modification(&iic);
	return s;
}

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
inline stream & operator<<(stream & s, Contract<Function> contract) {
	Function * function = (Function*)contract.t;
	// Preamble
	s << "#include \"contracts.h\"\n";
	s << function->getSignature() << " {\n";
	++depth;
	s << depth << "// Preamble\n";
	std::vector<std::string> userPointers = function->getUserPointers();
	std::map<std::string, ApronAbstractState> errorStates = function->getErrorStates();
	ApronAbstractState successState = function->getSuccessState();

	AbstractState & abstractState = function->getReturnAbstractState();
	ApronAbstractState & apronAbstractState = abstractState.m_apronAbstractState;
	const std::vector<ImportIovecCall> & importIovecCalls = function->getImportIovecCalls();
	const std::vector<CopyMsghdrFromUserCall> & copyMsghdrFromUserCalls =
			function->getCopyMsghdrFromUserCalls();
	for (std::string & userPointer : userPointers) {
		s << preamble(&userPointer);
	}
	for (const ImportIovecCall & call : importIovecCalls) {
		s << preamble(&call);
	}
	for (const CopyMsghdrFromUserCall & call : copyMsghdrFromUserCalls) {
		s << preamble(&call);
	}
	const std::string & returnValueName = function->getReturnValueName();
	std::string renamedRetValName = apronAbstractState.renameVarForC(returnValueName);
	s << depth << "bool b;\n";
	s << depth << "int idx;\n";
	ApronAbstractState::Variables variables =
			ApronAbstractState::Variables(apronAbstractState);
	std::vector<std::string> filteredVariables;
	for (std::string variable : variables) {
		if (!function->isVarInOut(variable.c_str())) {
			continue;
		}
		if (function->isSizeVariable(variable.c_str())) {
			continue;
		}
		if (function->isFunctionParameter(variable.c_str())) {
			continue;
		}
		std::string newVarName = apronAbstractState.renameVarForC(variable);
		s << havoc(&newVarName);
		if (function->isLastVariable(variable.c_str())) {
			s << depth << "assume(" << variable << " >= 0);\n";
		}
	}
	// Preconditions
	// Standard variables
	s << depth << "// Preconditions\n";
	ap_manager_t * manager = apron_manager;
	for (auto & errorStatePair : errorStates) {
		s << depth << "// Error state for " << errorStatePair.first << ":\n";
		ApronAbstractState minimizedErrorState =
				function->minimize(errorStatePair.second);
		minimizedErrorState.renameVarsForC();
		std::pair<const std::string, ApronAbstractState> pair = 
				std::make_pair(errorStatePair.first, minimizedErrorState);
		s << precondition(&pair);
	}
	for (const ImportIovecCall & call : importIovecCalls) {
		s << precondition(&call);
	}
	for (const CopyMsghdrFromUserCall & call : copyMsghdrFromUserCalls) {
		s << precondition(&call);
	}
	// Modifications
	// 	Standard variables
	// 	For each buf : user buffer
	// 		HAVOC(buf, last(buf,write))
	s << depth << "// Modifications\n";
	ApronAbstractState minimizedSuccessState = function->minimize(successState);
	auto renames = minimizedSuccessState.renameVarsForC();
	ap_tcons1_array_t minimized_array = ap_abstract1_to_tcons_array(
				apron_manager, &minimizedSuccessState.m_abstract1);
	s << depth << "if " << Conjunction(&minimized_array) << "{\n";
	ap_tcons1_array_clear(&minimized_array);
	++depth;
	for (std::string & userPointer : userPointers) {
		auto it = renames.find(userPointer);
		std::string * renamedVar = 0;
		if (it == renames.end()) {
			renamedVar = &userPointer;
		} else {
			renamedVar = &it->second;
		}
		const std::string & last_name = AbstractState::generateLastName(*renamedVar, user_pointer_operation_write);
		s << depth << "HAVOC_SIZE(" << *renamedVar << ", " << last_name << ");\n";
	}
	for (const ImportIovecCall & call : importIovecCalls) {
		s << modification(&call);
	}
	for (const CopyMsghdrFromUserCall & call : copyMsghdrFromUserCalls) {
		s << modification(&call);
	}
	--depth;
	s << depth << "}\n";
	// Postconditions
	s << "\t// Postconditions\n";
	ApronAbstractState minimizedReturnState = function->minimize(apronAbstractState);
	minimizedReturnState.renameVarsForC();
	ap_abstract1_t retvalAbstract1 = minimizedReturnState.m_abstract1;
	ap_tcons1_array_t array = ap_abstract1_to_tcons_array(manager, &retvalAbstract1);
	s << depth << "HAVOC(b);\n";
	s << depth << "if " << Conjunction("b", &array) << " {\n";
	++depth;
	s << depth << "return " << renamedRetValName << ";\n";
	--depth;
	s << depth << "}\n";
	ap_tcons1_array_clear(&array);

	// Postamble
	s << depth << "assume(0);\n";
	s << depth << "return 0; // Unreachable\n";
	--depth;
	s << depth << "}\n";

	// VA wrapper
	s << function->getReturnTypeString() << " __" << function->getName() << "_va_wrapper(va_list args) {\n";
	++depth;
	auto arguments = function->getArgumentStrings();
	for (auto argument : arguments) {
		s << depth << argument.first << " " << argument.second << " = va_arg(args, " << argument.first << ");\n";
	}
	s << depth << "return " << function->getName() << "(";
	bool first = true;
	for (auto argument : arguments) {
		if (!first) {
			s << ", ";
		}
		first = false;
		s << argument.second;
	}
	s << ");\n";
	--depth;
	s << depth << "}\n";
	return s;
}

#endif // CONTRACT_H
