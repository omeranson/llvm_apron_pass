#ifndef ABSTRACT_STATE_H
#define ABSTRACT_STATE_H

#include <map>
#include <set>
#include <string>
#include <vector>

#include <ap_abstract1.h>
#include <llvm/Support/raw_ostream.h>

namespace llvm {
	class Value;
}

typedef enum {
	user_pointer_operation_read,
	user_pointer_operation_write,
	user_pointer_operation_first0,

	// 'user_pointer_operation_count' must be last:
	user_pointer_operation_count
} user_pointer_operation_e;

class MemoryAccessAbstractValue {
public:
	ap_environment_t * m_environment;
	ap_tcons1_array_t m_constraints;

	MemoryAccessAbstractValue(ap_environment_t * env,
			std::string & userPtr,
			ap_texpr1_t * offset,
			ap_texpr1_t * size);
	ap_texpr1_t* createMemoryPointerTExpr(std::string & name);
	ap_tcons1_array_t createTcons1Array();
};

/**
 * An abstract state of a basic block. Contains:
 * May alias information
 * (Apron) analysis of integers
 * (Apron) analysis of (user) read/write/last0 pointers
 */
class AbstractState {
public:
	typedef std::map<std::string, std::set<llvm::Value *> > may_points_to_t;
protected:
	static std::map<std::string, std::string> g_userPointerNames[user_pointer_operation_count];
	bool joinMayPointsTo(std::map<std::string, may_points_to_t > mpts);
	bool joinAbstract1(ap_abstract1_t * abstract1);
public:
	AbstractState();
	// May alias information
	std::map<std::string, may_points_to_t > may_points_to;
	// (Apron) analysis of integers
	// TODO(oanson) TBD
	// (Apron) analysis of (user) read/write/last0 pointers
	std::vector<MemoryAccessAbstractValue> memoryAccessAbstractValues;
	ap_abstract1_t m_abstract1;

	std::string & getUserPointerName(std::string & userPtr, user_pointer_operation_e op);
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
};

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, AbstractState & as);

#endif // ABSTRACT_STATE_H
