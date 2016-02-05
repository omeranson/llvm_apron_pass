#ifndef BASIC_BLOCK_H
#define BASIC_BLOCK_H

#include <list>
#include <map>
#include <string>

#include <llvm/IR/BasicBlock.h>

#include <ap_abstract1.h>

class Value;

class BasicBlock;

class BasicBlockFactory {
protected:
	static BasicBlockFactory instance;
	std::map<llvm::BasicBlock *, BasicBlock *> instances;
	BasicBlock * createBasicBlock(llvm::BasicBlock * basicBlock);
	ap_manager_t * m_manager;

	BasicBlockFactory();
public:
	static BasicBlockFactory & getInstance();
	BasicBlock * getBasicBlock(llvm::BasicBlock * basicBlock);
};

class BasicBlock {
friend class BasicBlockFactory;
protected:
	static int basicBlockCount;

	llvm::BasicBlock * m_basicBlock;
	ap_abstract1_t m_abst_value;
	std::string m_name;
	ap_manager_t * m_manager;
	ap_environment_t *m_ap_environment;

	BasicBlock(ap_manager_t * manager, llvm::BasicBlock * basicBlock);
	virtual void initialiseBlockName();

	virtual bool is_eq(ap_abstract1_t & value);
	virtual void processInstruction(std::list<ap_tcons1_t> & constraints,
			llvm::Instruction & inst);
	virtual ap_tcons1_array_t createTcons1Array(
			std::list<ap_tcons1_t> & constraints);
	virtual bool addBogusInitialConstarints(
		std::list<ap_tcons1_t>  & constraints);
	virtual bool processAndJoinInstruction(llvm::Instruction & inst);
	virtual bool processAndMeetInstruction(llvm::Instruction & inst);
public:
	virtual std::string getName();
	virtual std::string toString();
	virtual llvm::BasicBlock * getLLVMBasicBlock();
	virtual bool update();

	virtual bool join(BasicBlock & basicBlock);
	virtual bool join(ap_abstract1_t & abst_value);
	virtual bool join(std::list<ap_abstract1_t> & abst_values);
	virtual bool join(ap_tcons1_t & constraint);
	// TODO Overload meet functions - same as join
	virtual bool meet(BasicBlock & basicBlock);
	virtual bool meet(ap_abstract1_t & abst_value);
	virtual bool meet(std::list<ap_abstract1_t> & abst_values);
	virtual bool meet(ap_tcons1_t & constraint);
	virtual bool isTop();
	virtual bool isBottom();
	virtual bool operator==(BasicBlock & basicBlock);

	virtual ap_manager_t * getManager();
	virtual ap_environment_t * getEnvironment();
	virtual void extendEnvironment(Value * value);
	virtual ap_texpr1_t * getVariable(Value * value);
	virtual void extendTexprEnvironment(ap_texpr1_t * texpr);
	virtual void extendTconsEnvironment(ap_tcons1_t * tcons);
};

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock);
std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock);

#endif /* BASIC_BLOCK_H */
