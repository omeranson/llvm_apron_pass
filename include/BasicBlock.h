#ifndef BASIC_BLOCK_H
#define BASIC_BLOCK_H

#include <map>
#include <string>

#include <llvm/IR/BasicBlock.h>

#include <ap_abstract1.h>

class AbstractManagerSingleton {
protected:
	static AbstractManagerSingleton * instance;
	ap_manager_t * m_ap_manager;
	ap_environment_t *m_ap_environment;
	AbstractManagerSingleton();
public:
	// TODO Make protected
	std::list<ap_lincons1_t> m_constraints;
	static AbstractManagerSingleton & getInstance();
	ap_manager_t * getManager();
	ap_environment_t * getEnvironment();
	ap_abstract1_t bottom();
	void appendConstraint(ap_lincons1_t & constraint);
	void extendEnvironment(Value * value, ap_lincons1_t & constraint);
};

class BasicBlock;

class BasicBlockFactory {
protected:
	static BasicBlockFactory instance;
	std::map<llvm::BasicBlock *, BasicBlock *> instances;
	BasicBlock * createBasicBlock(llvm::BasicBlock * basicBlock);

	BasicBlockFactory() {}
public:
	static BasicBlockFactory & getInstance();
	BasicBlock * getBasicBlock(llvm::BasicBlock * basicBlock);
};

class BasicBlock {
friend BasicBlockFactory;
protected:
	static basicBlockCount;

	llvm::BasicBlock * m_basicBlock;
	ap_abstract1_t m_abst_value;
	std::string m_name;
	ap_manager_t * m_manager;
	ap_environment_t *m_ap_environment;

	BasicBlock(ap_manager_t * manager, llvm::BasicBlock * basicBlock);
	virtual void initialiseBlockName();

	virtual bool is_eq(ap_abstract1_t & value);
	virtual void doUpdate();
	virtual void processInstruction(std::list<ap_lincons1_t> & constraints,
			llvm::Instruction & inst);
	virtual ap_lincons1_array_t create_lincons1_array(
			std::list<ap_lincons1_t> & constraints);
public:
	virtual std::string getName();
	virtual bool update();

	virtual bool join(BasicBlock & basicBlock);
	virtual bool meet(BasicBlock & basicBlock);
	virtual bool isTop();
	virtual bool isBottom();
	virtual bool operator==(BasicBlock & basicBlock);

	virtual ap_manager_t * getManager();
	virtual ap_environment_t * getEnvironment();
	virtual void extendEnvironment(
			Value * value, ap_lincons1_t & constraint);
	virtual void appendConstraint(ap_lincons1_t & constraint);
};

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock);
std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock);

#endif /* BASIC_BLOCK_H */
