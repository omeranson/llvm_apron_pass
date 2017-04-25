#ifndef ABSTRACT_STATE_H
#define ABSTRACT_STATE_H

#include <map>
#include <set>
#include <string>
#include <vector>

#include <llvm/Support/raw_ostream.h>

#include <AbstractStates/ApronAbstractState.h>
#include <APStream.h>

typedef enum {
	user_pointer_operation_read,
	user_pointer_operation_write,
	user_pointer_operation_first0,

	// 'user_pointer_operation_count' must be last:
	user_pointer_operation_count
} user_pointer_operation_e;

extern ap_manager_t * apron_manager;

class MemoryAccessAbstractValue {
public:
	std::string pointer;
	std::string buffer;
	ap_texpr1_t * size;
	user_pointer_operation_e operation;

	MemoryAccessAbstractValue(const std::string & pointer, const std::string & buffer,
			ap_texpr1_t * size, user_pointer_operation_e operation);
};

struct ImportIovecCall {
	const user_pointer_operation_e op;
	const std::string iovec_name;
	const std::string iovec_len_name;
	ImportIovecCall(user_pointer_operation_e op, const std::string & iovec_name, const std::string & iovec_len_name) :
			op(op), iovec_name(iovec_name), iovec_len_name(iovec_len_name) {}
	ImportIovecCall(user_pointer_operation_e op, const std::string * iovec_name, const std::string * iovec_len_name) :
			op(op), iovec_name(*iovec_name), iovec_len_name(*iovec_len_name) {}
};

struct CopyMsghdrFromUserCall {
	const user_pointer_operation_e op;
	const std::string msghdr_name;
	CopyMsghdrFromUserCall(user_pointer_operation_e op, const std::string & msghdr_name) :
			op(op), msghdr_name(msghdr_name) {}
	CopyMsghdrFromUserCall(user_pointer_operation_e op, const std::string * msghdr_name) :
			op(op), msghdr_name(*msghdr_name) {}
	ImportIovecCall asImportIovecCall() const {
		std::string iovec_name;
		llvm::raw_string_ostream iovec_name_rso(iovec_name);
		iovec_name_rso << msghdr_name << "__msg_iov";

		std::string iovec_len_expr;
		llvm::raw_string_ostream iovec_len_expr_rso(iovec_len_expr);
		iovec_len_expr_rso << msghdr_name << "->msg_iovlen";

		return ImportIovecCall(op, iovec_name_rso.str(),
				iovec_len_expr_rso.str());
	}
};

/**
 * An abstract state of a basic block. Contains:
 * May alias information
 * (Apron) analysis of integers
 * (Apron) analysis of (user) read/write/last0 pointers
 */
class AbstractState {
public:
	/*******************************************************************/
	/* pt is a mapping between pointers, and the buffers they *may*    */
	/* point to. The buffers are either user buffers (passed e.g. via  */
	/* arguments), "kernel" for any kernel pointer, "null" for the     */
	/* null pointer, or "user" for any pointer to userspace that is    */
	/* not recognised as a buffer (This shouldn't really happen).      */
	/* Let us use this code for reference                              */
	/*                                                                 */
	/* int f9(__user char *buf1, __user char *buf2, int size)          */
	/* {                                                               */
	/*     char *p = NULL;                                             */
	/*     if (size > 32)                                              */
	/*     {                                                           */
	/*         p = buf1 + 3; // this is (*)                            */
	/*     }                                                           */
	/*     else                                                        */
	/*     {                                                           */
	/*         p = buf2; // and this is (**)                           */
	/*     }                                                           */
	/* }                                                               */
	/* --------------------------------------------------------------- */
	/* the pointer p in line (*) is updated with                       */
	/*                                                                 */
	/* map[p] = {buf1}                                                 */
	/* Additionally, and offset(p,buf1) <= 3 constraint should be      */
	/* added to the numerical part of the AbstractState                */
	/*                                                                 */
	/* --------------------------------------------------------------- */
	/*                                                                 */
	/* the pointer p in line (**) is updated with                      */
	/*                                                                 */
	/* map[p] = buf2                                                   */
	/* Additionally, and offset(p,buf2) <= 0 constraint should be      */
	/* added to the numerical part of the AbstractState                */
	/*                                                                 */
	/* --------------------------------------------------------------- */
	/*                                                                 */
	/* the join between (*) and (**) should then be:                   */
	/*                                                                 */
	/* map[p] = {buf1,buf2}                                            */
	/* The join also joins the constraints on offset(p,buf1) and       */
	/* offset(p, buf2)                                                 */
	/*                                                                 */
	/*******************************************************************/
	typedef std::map<std::string, std::set<std::string> > may_points_to_t;
	
protected:
	/*************************************************/
	/* OREN ISH SHALOM remarks:                      */
	/* our abstract state is made of a cartesian     */
	/* product of 2 abstract states:                 */
	/*                                               */
	/* [1] A May-Points-To entity                    */
	/* [2] An Apron entity                           */
	/*                                               */
	/* The join is done by simply applying the two   */
	/* relevant joins:                               */
	/*                                               */
	/* this->join(AbstractState *that)               */
	/* {                                             */
	/*     this->joinMayPointsTo(that->mayPointsTo); */
	/*     this->joinApron(      that->apronStuff);  */
	/* }                                             */
	/*                                               */
	/*************************************************/
	bool joinMayPointsTo(may_points_to_t &otherMayPointsTo);
	bool joinUserPointers(
		std::set<std::string> & dest,
		std::set<std::string> & src);

public:
	AbstractState();

	// May points to analysis
	may_points_to_t m_mayPointsTo;
	// (Apron) analysis of integers
	ApronAbstractState m_apronAbstractState;
	// (Apron) analysis of (user) read/write/last0 pointers
	std::vector<MemoryAccessAbstractValue> memoryAccessAbstractValues;
	static const std::string & generateOffsetName(
			const std::string & valueName, const std::string & bufname);
	static const std::string & generateLastName(
			const std::string & bufname, user_pointer_operation_e op);

	std::vector<ImportIovecCall> m_importedIovecCalls;
	std::vector<CopyMsghdrFromUserCall> m_copyMsghdrFromUserCalls;

	ap_manager_t * getManager() const;
	void updateUserOperationAbstract1();
	// General commands
	virtual bool join(AbstractState &);
	// TODO(oanson) The following functions are missing
	//virtual bool meet(AbstractState &);
	//virtual bool unify(AbstractState &);
	//virtual bool isTop();
	//virtual bool isBottom();
	//virtual bool operator==(AbstractState &);

	ap_abstract1_t join(ap_abstract1_t * val1, ap_abstract1_t * val2);
	ap_abstract1_t join(std::vector<ap_abstract1_t> & values);

	virtual void makeTop();
	virtual void makeBottom();
};

template <class stream>
inline stream & operator<<(stream & s, AbstractState & as) {
	s << "{'mpt':{";
	for (auto & mpt : as.m_mayPointsTo) {
		s << "'" << mpt.first << "':[";
		for (auto & userPtr : mpt.second) {
			s << "'" << userPtr << "',";
		}
		s << "],";
	}
	s << "},abstract1:{" << &as.m_apronAbstractState.m_abstract1 << "}";
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, user_pointer_operation_e op) {
	switch (op) {
	case user_pointer_operation_read:
		s << "read";
		break;
	case user_pointer_operation_write:
		s << "write";
		break;
	case user_pointer_operation_first0:
		s << "first0";
		break;
	case user_pointer_operation_count:
		s << (unsigned)op;
		break;
	default:
		s << "<invalid user_pointer_operation_e>";
		break;
	}
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, MemoryAccessAbstractValue & maav) {
	s << "maav(" << maav.pointer << ", " << maav.buffer << ", "
			<< maav.size << ", " << maav.operation << ")";
	return s;
}


template <class stream>
inline stream & operator<<(stream & s, ApronAbstractState & aas) {
	s << &aas.m_abstract1;
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, ApronAbstractState * aas) {
	s << *aas;
	return s;
}

#endif // ABSTRACT_STATE_H
