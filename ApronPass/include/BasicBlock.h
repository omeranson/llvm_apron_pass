#ifndef BASIC_BLOCK_H
#define BASIC_BLOCK_H

#include <list>
#include <map>
#include <string>
#include <ostream>

#include <llvm/IR/BasicBlock.h>

#include <ap_abstract1.h>

#include <AbstractState.h>

class Value;

class BasicBlock;

class Function;

class BasicBlockManager {
protected:
	static BasicBlockManager instance;
	std::map<llvm::BasicBlock *, BasicBlock *> instances;
	BasicBlock * createBasicBlock(llvm::BasicBlock * basicBlock);
	// TODO Move m_manager to ChaoticExecution class

	BasicBlockManager();
public:
	static BasicBlockManager & getInstance();
	BasicBlock * getBasicBlock(llvm::BasicBlock * basicBlock);

	ap_manager_t * m_manager;
};

class BasicBlock {
friend class BasicBlockManager;
protected:
	static int basicBlockCount;

	llvm::BasicBlock * m_basicBlock;
	ap_abstract1_t m_abst_value;
	std::string m_name;
	ap_manager_t * m_manager;
	bool m_markedForChanged;
	AbstractState m_abstractState;

	BasicBlock(ap_manager_t * manager, llvm::BasicBlock * basicBlock);
	virtual void initialiseBlockName();

	virtual bool is_eq(ap_abstract1_t & value);
	virtual void processInstruction(std::list<ap_tcons1_t> & constraints,
			llvm::Instruction & inst);
	virtual void addBogusInitialConstarints(
		std::list<ap_tcons1_t>  & constraints);
	virtual bool joinInAbstract1(ap_abstract1_t & abst_value);
	virtual ap_abstract1_t getAbstract1MetWithIncomingPhis(BasicBlock & basicBlock);
	virtual AbstractState getAbstractStateMetWithIncomingPhis(BasicBlock & basicBlock);
public:
	unsigned updateCount;
	unsigned joinCount;
	virtual std::string getName();
	virtual ap_abstract1_t & getAbstractValue();
	virtual std::string toString();
	virtual llvm::BasicBlock * getLLVMBasicBlock();
	virtual void setChanged();
	virtual void populateConstraintsFromAbstractValue(
			std::list<ap_tcons1_t> & constraints);
	virtual ap_tcons1_array_t getBasicBlockConstraints(BasicBlock * basicBlock);
	virtual bool update();

	virtual const std::string & generateOffsetName(
			Value * value, const std::string & bufname);
	virtual const std::string & generateLastName(
			const std::string & bufname, user_pointer_operation_e op);
	virtual ap_texpr1_t * createUserPointerOffsetTreeExpression(
		Value * value, const std::string & bufname);
	virtual ap_texpr1_t * createUserPointerLastTreeExpression(
		const std::string & bufname, user_pointer_operation_e op);

	virtual bool join(BasicBlock & basicBlock);
	virtual bool meet(BasicBlock & basicBlock);
	virtual bool meet(ap_abstract1_t & abst_value);
	virtual bool meet(std::list<ap_abstract1_t> & abst_values);
	virtual bool meet(ap_tcons1_t & constraint);
	virtual bool unify(BasicBlock & basicBlock);
	virtual bool unify(ap_abstract1_t & abst_value);
	virtual bool unify(std::list<ap_abstract1_t> & abst_values);
	virtual bool unify(ap_tcons1_t & constraint);
	virtual bool isTop(ap_abstract1_t & value);
	virtual bool isBottom(ap_abstract1_t & value);
	virtual bool isTop();
	virtual bool isBottom();
	virtual bool operator==(BasicBlock & basicBlock);

	virtual ap_manager_t * getManager();
	virtual ap_environment_t * getEnvironment();
	virtual void setEnvironment(ap_environment_t * nenv);
	virtual void extendEnvironment(Value * value);
	virtual void extendEnvironment(const std::string & varname);
	virtual void extendEnvironment(const char * varname);
	virtual void forget(Value * value);
	virtual void forget(const std::string & varname);
	virtual void forget(const char * varname);
	virtual ap_interval_t * getVariableInterval(Value * value);
	virtual ap_interval_t * getVariableInterval(const std::string & value);
	virtual ap_interval_t * getVariableInterval(const char * value);
	virtual ap_texpr1_t * getVariableTExpr(Value * value);
	virtual ap_texpr1_t * getVariableTExpr(const std::string & value);
	virtual ap_texpr1_t * getVariableTExpr(const char * value);
	virtual ap_texpr1_t* getConstantTExpr(unsigned);
	virtual void extendTexprEnvironment(ap_texpr1_t * texpr);
	virtual void extendTconsEnvironment(ap_tcons1_t * tcons);
	virtual ap_abstract1_t abstractOfTconsList(
			std::list<ap_tcons1_t> & constraints);
	virtual ap_abstract1_t abstractMeetWithTconsList(
			std::list<ap_tcons1_t> & constraints);
	virtual ap_tcons1_array_t createTcons1Array(
			std::list<ap_tcons1_t> & constraints);
	virtual void addOffsetConstraint(std::vector<ap_tcons1_t> & constraints,
		ap_texpr1_t * value_texpr, Value * dest, const std::string & pointerName);

	virtual AbstractState & getAbstractState();
	virtual Function * getFunction();
};

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock);
std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock& basicBlock);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock* basicBlock);

#endif /* BASIC_BLOCK_H */
