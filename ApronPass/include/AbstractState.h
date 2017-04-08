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
	/*******************************************************************/
	/* OREN ISH SHALOM edited: let us use this code for reference      */
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
	/*******************************************************************/
	/*******************************************************************/
	/* OREN ISH SHALOM edited:                                         */
	/* --------------------------------------------------------------- */
	/* the pointer p in line (*) is updated with                       */
	/*                                                                 */
	/* map[p] = {pair(buf1,OFFSET_LINE(*)_BUF1)}                       */
	/*                                                                 */
	/* --------------------------------------------------------------- */
	/*                                                                 */
	/* the pointer p in line (**) is updated with                      */
	/*                                                                 */
	/* map[p] = {pair(buf2,OFFSET_LINE(**)_BUF2)}                      */
	/*                                                                 */
	/* --------------------------------------------------------------- */
	/*                                                                 */
	/* the join between (*) and (**) should then be:                   */
	/*                                                                 */
	/* map[p] = {pair(buf1,OFFSET_LINE(*)_BUF1),                       */
	/*           pair(buf2,OFFSET_LINE(**)_BUF2)}                      */
	/*                                                                 */
	/*******************************************************************/
	typedef std::string var_name_type;
	typedef char * offset_name_type;
	typedef std::map<var_name_type, std::set<std::pair<var_name_type,offset_name_type> > > may_points_to_t;
protected:
	static std::map<std::string, std::string> g_userPointerNames[user_pointer_operation_count];
	bool joinMayPointsTo(std::map<std::string, may_points_to_t > mpts);
	bool joinAbstract1(ap_abstract1_t * abstract1);
public:
	AbstractState();

	// May alias information
	may_points_to_t may_points_to;
	
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

	ap_abstract1_t join(ap_abstract1_t * val1, ap_abstract1_t * val2);
	ap_abstract1_t join(std::vector<ap_abstract1_t> & values);
};

llvm::raw_ostream& operator<<(llvm::raw_ostream& ro, AbstractState & as);

#endif // ABSTRACT_STATE_H
