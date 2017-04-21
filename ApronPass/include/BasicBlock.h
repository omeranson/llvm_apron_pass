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
	bool m_markedForChanged;
	AbstractState m_abstractState;

	BasicBlock(llvm::BasicBlock * basicBlock);
	virtual void initialiseBlockName();

	virtual void processInstruction(std::list<ap_tcons1_t> & constraints,
			llvm::Instruction & inst);
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
	virtual ap_tcons1_array_t getBasicBlockConstraints(BasicBlock * basicBlock);
	virtual bool update();
	virtual void makeTop();

	virtual ap_texpr1_t * createUserPointerOffsetTreeExpression(
		const std::string & valueName, const std::string & bufname);
	virtual ap_texpr1_t * createUserPointerOffsetTreeExpression(
		Value * value, const std::string & bufname);
	virtual ap_texpr1_t * createUserPointerLastTreeExpression(
		const std::string & bufname, user_pointer_operation_e op);

	virtual bool join(BasicBlock & basicBlock);
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
	virtual void forget(Value * value);
	virtual void forget(const std::string & varname);
	virtual ap_interval_t * getVariableInterval(Value * value);
	virtual ap_interval_t * getVariableInterval(const std::string & value);
	virtual ap_texpr1_t * getVariableTExpr(Value * value);
	virtual ap_texpr1_t * getVariableTExpr(const std::string & value);
	virtual ap_texpr1_t* getConstantTExpr(unsigned);
	virtual void extendTexprEnvironment(ap_texpr1_t * texpr);
	virtual void extendTconsEnvironment(ap_tcons1_t * tcons);
	virtual ap_abstract1_t abstractOfTconsList(
			std::list<ap_tcons1_t> & constraints);
	virtual ap_abstract1_t applyConstraints(
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
