#ifndef BASIC_BLOCK_H
#define BASIC_BLOCK_H

#include <list>
#include <map>
#include <string>
#include <ostream>

#include <llvm/IR/BasicBlock.h>

#include <ap_abstract1.h>
#include <ap_texpr1.h>

#include <AbstractState.h>

class Value;

class BasicBlock;

class Function;

class BasicBlockManager {
protected:
	static BasicBlockManager instance;
	std::map<llvm::BasicBlock *, BasicBlock *> instances;
	BasicBlock * createBasicBlock(llvm::BasicBlock * basicBlock);

public:
	static BasicBlockManager & getInstance();
	BasicBlock * getBasicBlock(llvm::BasicBlock * basicBlock);
};

class BasicBlock {
friend class BasicBlockManager;
protected:
	static int basicBlockCount;

	llvm::BasicBlock * m_basicBlock;
	std::string m_name;
	AbstractState m_abstractState;

	BasicBlock(llvm::BasicBlock * basicBlock);
	virtual void initialiseBlockName();

	virtual void processInstruction(AbstractState & state,
			llvm::Instruction & inst);

	virtual AbstractState getAbstractStateWithAssumptions(BasicBlock & predecessor, AbstractState & state);
	virtual void updateAbstract1MetWithIncomingPhis(BasicBlock & basicBlock, AbstractState & state);
	virtual void updateAbstractStateMetWithIncomingPhis(BasicBlock & basicBlock, AbstractState & state);
public:
	std::vector<std::pair<ApronAbstractState, ApronAbstractState> > m_updatedStates;

	unsigned updateCount;
	unsigned joinCount;
	virtual std::string getName();
	virtual ap_abstract1_t & getAbstractValue();
	virtual std::string toString();
	virtual llvm::BasicBlock * getLLVMBasicBlock();
	virtual Value * getTerminatorValue();
	virtual void update(AbstractState & state);
	virtual void makeTop();

	virtual ap_texpr1_t * createUserPointerOffsetTreeExpression(
		const std::string & valueName, const std::string & bufname);
	virtual ap_texpr1_t * createUserPointerOffsetTreeExpression(
		Value * value, const std::string & bufname);
	virtual ap_texpr1_t * createUserPointerLastTreeExpression(
		const std::string & bufname, user_pointer_operation_e op);

	virtual bool join(BasicBlock & basicBlock, AbstractState & state);
	virtual bool isTop(ap_abstract1_t & value);
	virtual bool isBottom(ap_abstract1_t & value);
	virtual bool isTop();
	virtual bool isBottom();

	// @deprecated
	virtual ap_manager_t * getManager();
	// @deprecated
	virtual ap_environment_t * getEnvironment();
	virtual void extendEnvironment(Value * value);
	virtual void extendEnvironment(const std::string & varname);
	virtual ap_interval_t * getVariableInterval(Value * value);
	virtual ap_interval_t * getVariableInterval(const std::string & value);
	virtual ap_texpr1_t * getVariableTExpr(Value * value);
	virtual ap_texpr1_t * getVariableTExpr(const std::string & value);
	virtual ap_texpr1_t* getConstantTExpr(unsigned);
	virtual void extendTexprEnvironment(ap_texpr1_t * texpr);
	virtual void extendTconsEnvironment(ap_tcons1_t * tcons);
	virtual ap_abstract1_t abstractOfTconsList(
			std::list<ap_tcons1_t> & constraints);
	virtual void applyConstraints(
			std::list<ap_tcons1_t> & constraints);

	virtual AbstractState & getAbstractState();
	virtual Function * getFunction();
};

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock);
std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock& basicBlock);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock* basicBlock);

template <class collection>
inline ap_tcons1_array_t createTcons1Array(
		ap_environment_t * environment, collection & constraints) {
	ap_tcons1_array_t array = ap_tcons1_array_make(
			environment, constraints.size());
	int idx = 0;
	bool failed;
	for (ap_tcons1_t & constraint : constraints) {
		ap_tcons1_t constraint2 = ap_tcons1_copy(&constraint);
		failed = ap_tcons1_extend_environment_with(&constraint2, environment);
		assert(!failed);
		failed = ap_tcons1_array_set(&array, idx++, &constraint2);
		assert(!failed);
	}
	return array;
}
#endif /* BASIC_BLOCK_H */
