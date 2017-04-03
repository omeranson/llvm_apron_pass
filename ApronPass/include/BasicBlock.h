#ifndef BASIC_BLOCK_H
#define BASIC_BLOCK_H

#include <list>
#include <map>
#include <string>
#include <ostream>

#include <llvm/IR/BasicBlock.h>

#include <ap_abstract1.h>

class Value;

class BasicBlock;

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

	BasicBlock(ap_manager_t * manager, llvm::BasicBlock * basicBlock);
	virtual void initialiseBlockName();

	virtual bool is_eq(ap_abstract1_t & value);
	virtual void processInstruction(std::list<ap_tcons1_t> & constraints,
			llvm::Instruction & inst);
	virtual void addBogusInitialConstarints(
		std::list<ap_tcons1_t>  & constraints);
	template <class stream> void streamAbstract1Manually(
			stream & s, ap_abstract1_t & abst1);
	template <class stream> void streamAbstract1(
			stream & s, ap_abstract1_t & abst1);
	template <class stream> void streamTCons1(
			stream & s, ap_tcons1_t & tcons);
public:
	virtual std::string getName();
	virtual ap_abstract1_t & getAbstractValue();
	virtual std::string toString();
	virtual llvm::BasicBlock * getLLVMBasicBlock();
	virtual void setChanged();
	virtual void populateConstraintsFromAbstractValue(
			std::list<ap_tcons1_t> & constraints);
	virtual bool update();

	virtual bool join(BasicBlock & basicBlock);
	virtual bool join(ap_abstract1_t & abst_value);
	virtual bool join(std::list<ap_abstract1_t> & abst_values);
	virtual bool join(ap_tcons1_t & constraint);
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
	virtual ap_texpr1_t * getVariableTExpr(Value * value);
	virtual ap_interval_t * getVariableInterval(Value * value);
	virtual void extendTexprEnvironment(ap_texpr1_t * texpr);
	virtual void extendTconsEnvironment(ap_tcons1_t * tcons);
	virtual ap_abstract1_t abstractOfTconsList(
			std::list<ap_tcons1_t> & constraints);
	virtual ap_tcons1_array_t createTcons1Array(
			std::list<ap_tcons1_t> & constraints);
};

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock);
std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock& basicBlock);
llvm::raw_ostream& operator<<(llvm::raw_ostream& ro,  BasicBlock* basicBlock);

#endif /* BASIC_BLOCK_H */
