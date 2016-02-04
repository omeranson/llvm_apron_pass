#include <BasicBlock.h>
#include <Value.h>

#include <cstdio>
#include <iostream>
#include <sstream>

#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>
#include <box.h>
#include <oct.h>
#include <pk.h>
#include <pkeq.h>

/*			       BasicBlockFactory			     */
BasicBlockFactory BasicBlockFactory::instance;
BasicBlockFactory & BasicBlockFactory::getInstance() {
	return instance;
}

BasicBlockFactory::BasicBlockFactory() : m_manager(box_manager_alloc()) {}
BasicBlock * BasicBlockFactory::createBasicBlock(llvm::BasicBlock * basicBlock) {
	BasicBlock * result = new BasicBlock(m_manager, basicBlock);
	return result;
}

BasicBlock * BasicBlockFactory::getBasicBlock(llvm::BasicBlock * basicBlock) {
	std::map<llvm::BasicBlock *, BasicBlock *>::iterator it =
			instances.find(basicBlock);
	BasicBlock * result;
	if (it == instances.end()) {
		result = createBasicBlock(basicBlock);
		instances.insert(std::pair<llvm::BasicBlock *, BasicBlock *>(
				basicBlock, result));
	} else {
		result = it->second;
	}
	return result;
}

/*				   BasicBlock				     */
int BasicBlock::basicBlockCount = 0;

BasicBlock::BasicBlock(ap_manager_t * manager, llvm::BasicBlock * basicBlock) :
		m_basicBlock(basicBlock),
		m_manager(manager),
		m_ap_environment(ap_environment_alloc_empty()) {
	m_abst_value = ap_abstract1_bottom(manager, m_ap_environment);
	if (!basicBlock->hasName()) {
		initialiseBlockName();
	}
}

void BasicBlock::initialiseBlockName() {
	std::ostringstream oss;
	oss << "BasicBlock-" << ++basicBlockCount;
	llvm::Twine name(oss.str());
	m_basicBlock->setName(name);
}

bool BasicBlock::is_eq(ap_abstract1_t & value) {
	return ap_abstract1_is_eq(getManager(), &m_abst_value, &value);
}

std::string BasicBlock::getName() {
	return m_basicBlock->getName();
}

llvm::BasicBlock * BasicBlock::getLLVMBasicBlock() {
	return m_basicBlock;
}

ap_manager_t * BasicBlock::getManager() {
	// In a function, since manager is global, and this impl. may change
	return m_manager;
}

ap_environment_t * BasicBlock::getEnvironment() {
	return m_ap_environment;
}

void BasicBlock::extendEnvironment(Value * value, ap_lincons1_t & constraint) {
	ap_environment_t* env = m_ap_environment;
	ap_var_t var = value->varName();
	// TODO Handle reals
	ap_environment_t* nenv = ap_environment_add(env, &var, 1, NULL, 0);
	ap_lincons1_extend_environment_with(&constraint, nenv);
	m_ap_environment = nenv;
	// TODO Memory leak?
}

bool BasicBlock::join(BasicBlock & basicBlock) {
	ap_abstract1_t prev = m_abst_value;
	ap_manager_t * manager = getManager();
	m_abst_value = ap_abstract1_join(
			manager,
			false,
			&m_abst_value,
			&(basicBlock.m_abst_value));
	printf("Prev value: ");
	ap_abstract1_fprint(stdout, manager, &prev);
	printf("Curr value: ");
	ap_abstract1_fprint(stdout, manager, &m_abst_value);
	return is_eq(prev);
}

bool BasicBlock::meet(BasicBlock & basicBlock) {
	ap_abstract1_t prev = m_abst_value;
	ap_manager_t * manager = getManager();
	m_abst_value = ap_abstract1_meet(
			manager,
			false,
			&m_abst_value,
			&(basicBlock.m_abst_value));
	return is_eq(prev);
}

bool BasicBlock::isTop() {
	return ap_abstract1_is_top(getManager(), &m_abst_value);
}

bool BasicBlock::isBottom() {
	return ap_abstract1_is_bottom(getManager(), &m_abst_value);
}

bool BasicBlock::operator==(BasicBlock & basicBlock) {
	return is_eq(basicBlock.m_abst_value);
}

bool BasicBlock::update() {
	/* Process the block. Return true if the block's context is modified.*/
	std::cout << "Processing block " << getName() << std::endl;
	std::list<ap_lincons1_t> constraints;

	ap_abstract1_t prev = m_abst_value;

	llvm::BasicBlock::iterator it;
	for (it = m_basicBlock->begin(); it != m_basicBlock->end(); it ++) {
		llvm::Instruction & inst = *it;
		processInstruction(constraints, inst);
	}

	ap_manager_t * manager = getManager();
	ap_environment_t* env = getEnvironment();

	ap_lincons1_array_t array = createLincons1Array(constraints);
	ap_abstract1_t abs = ap_abstract1_of_lincons_array(
			manager, env, &array);
	fprintf(stdout,"Abstract value:\n");
	ap_abstract1_fprint(stdout, manager, &abs);

	fprintf(stdout,"Constraints:\n");
	ap_lincons1_array_fprint(stdout,&array);

	m_abst_value = ap_abstract1_join(manager, false, &prev, &abs);
	return is_eq(prev);
}

ap_lincons1_array_t BasicBlock::createLincons1Array(
		std::list<ap_lincons1_t> & constraints) {
	ap_lincons1_array_t array = ap_lincons1_array_make(
			getEnvironment(), constraints.size());
	int idx = 0;
	std::list<ap_lincons1_t>::iterator it;
	for (it = constraints.begin(); it != constraints.end(); it++) {
		ap_lincons1_t & constraint = *it;
		ap_lincons1_array_set(&array, idx++, &constraint);
	}
	return array;
}

void BasicBlock::processInstruction(std::list<ap_lincons1_t> & constraints,
		llvm::Instruction & inst) {
	const llvm::DebugLoc & debugLoc = inst.getDebugLoc();
	// TODO Circular dependancy
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(&inst);
	if (value && !value->isSkip()) {
		std::cout << "Apron: Instruction: "
				/*<< scope->getFilename() << ": " */
				<< debugLoc.getLine() << ": "
				<< value->toString() << "\n";
		InstructionValue * instructionValue =
				static_cast<InstructionValue*>(value);
		ap_lincons1_t constraint =
				instructionValue->createLinearConstraint();
		ap_lincons1_fprint(stdout, &constraint);
		printf("\n");
		constraints.push_back(constraint);
	}
}

std::string BasicBlock::toString() {
	std::ostringstream oss;
	char * cbuf = NULL;
	size_t ncbuf = 0;
	FILE * buffer = open_memstream(&cbuf, &ncbuf);
	ap_abstract1_fprint(buffer, getManager(), &m_abst_value);
	fclose(buffer);
	oss << getName() << ": " << cbuf;
	free(cbuf);
	cbuf = NULL;
	return oss.str();
}

std::ostream& operator<<(std::ostream& os,  BasicBlock& basicBlock) {
	os << basicBlock.toString();
	return os;
}

std::ostream& operator<<(std::ostream& os,  BasicBlock* basicBlock) {
	os << basicBlock->toString();
	return os;
}

