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

void BasicBlock::extendEnvironment(Value * value) {
	ap_environment_t* env = m_ap_environment;
	ap_var_t var = value->varName();
	// TODO Handle reals
	ap_environment_t* nenv = ap_environment_add(env, &var, 1, NULL, 0);
	m_ap_environment = nenv;
	// TODO Memory leak?
}

ap_texpr1_t* BasicBlock::getVariable(Value * value) {
	ap_var_t var = value->varName();
	ap_texpr1_t* result = ap_texpr1_var(getEnvironment(), var);
	if (!result) {
		extendEnvironment(value);
		// NOTE: getEnvironment() returns the *extended* environment
		result = ap_texpr1_var(getEnvironment(), var);
		if (!result) {
			printf("This one is still not in env %p: %p %s\n",
					getEnvironment(),
					var, (char*)var);
			abort();
		}
	}
	return result;
}

void BasicBlock::extendTexprEnvironment(ap_texpr1_t * texpr) {
	// returns true on error. WTF?
	assert(!ap_texpr1_extend_environment_with(texpr, getEnvironment()));
}
	
void BasicBlock::extendTconsEnvironment(ap_tcons1_t * tcons) {
	// returns true on error. WTF?
	assert(!ap_tcons1_extend_environment_with(tcons, getEnvironment()));
}

bool BasicBlock::join(ap_abstract1_t & abst_value) {
	ap_abstract1_t prev = m_abst_value;
	ap_manager_t * manager = getManager();
	m_abst_value = ap_abstract1_change_environment(manager, false,
			&m_abst_value, getEnvironment(), false);
	m_abst_value = ap_abstract1_join(manager, false,
			&m_abst_value, &abst_value);
	printf("Join: Prev value: ");
	ap_abstract1_fprint(stdout, manager, &prev);
	printf("Join: Curr value: ");
	ap_abstract1_fprint(stdout, manager, &m_abst_value);
	return is_eq(prev);
}

bool BasicBlock::join(std::list<ap_abstract1_t> & abst_values) {
	std::list<ap_abstract1_t>::iterator it;
	bool result = false;
	for (it = abst_values.begin(); it != abst_values.end(); it++) {
		ap_abstract1_t & value = *it;
		result |= join(value);
	}
	return result;
}

bool BasicBlock::join(ap_tcons1_t & constraint) {
	ap_tcons1_array_t array = ap_tcons1_array_make(getEnvironment(), 1);
	extendTconsEnvironment(&constraint);
	assert(!ap_tcons1_array_set(&array, 0, &constraint));
	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			getManager(), getEnvironment(), &array);
	return join(abs);
}

bool BasicBlock::join(BasicBlock & basicBlock) {
	return join(m_abst_value);
}

bool BasicBlock::meet(ap_abstract1_t & abst_value) {
	ap_abstract1_t prev = m_abst_value;
	ap_manager_t * manager = getManager();
	m_abst_value = ap_abstract1_unify(manager, false,
			&m_abst_value, &abst_value);
	printf("Meet: Prev value: ");
	ap_abstract1_fprint(stdout, manager, &prev);
	printf("Meet: Curr value: ");
	ap_abstract1_fprint(stdout, manager, &m_abst_value);
	return is_eq(prev);
}

bool BasicBlock::meet(std::list<ap_abstract1_t> & abst_values) {
	std::list<ap_abstract1_t>::iterator it;
	bool result = false;
	for (it = abst_values.begin(); it != abst_values.end(); it++) {
		ap_abstract1_t & value = *it;
		result |= meet(value);
	}
	return result;
}

bool BasicBlock::meet(ap_tcons1_t & constraint) {
	ap_tcons1_array_t array = ap_tcons1_array_make(getEnvironment(), 1);
	extendTconsEnvironment(&constraint);
	assert(!ap_tcons1_array_set(&array, 0, &constraint));
	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			getManager(), getEnvironment(), &array);
	return meet(abs);
}

bool BasicBlock::meet(BasicBlock & basicBlock) {
	return meet(m_abst_value);
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

void BasicBlock::addBogusInitialConstarints(
		std::list<ap_tcons1_t>  & constraints) {
	const char * y_name = "y";
	const char * z_name = "z";
	//char * z_name = std::string("z").c_str();
	ap_environment_t* env = getEnvironment();
	env = ap_environment_add(env, (ap_var_t*)&y_name, 1, NULL, 0);
	env = ap_environment_add(env, (ap_var_t*)&z_name, 1, NULL, 0);
	m_ap_environment = env;

	ap_texpr1_t* y = ap_texpr1_var(getEnvironment(), (ap_var_t)y_name);
	ap_texpr1_t* z = ap_texpr1_var(getEnvironment(), (ap_var_t)z_name);

	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	ap_tcons1_t constraint1 = ap_tcons1_make(AP_CONS_SUPEQ, y, zero);
	ap_tcons1_t constraint2 = ap_tcons1_make(AP_CONS_SUPEQ, z, zero);
	
	constraints.push_back(constraint1);
	constraints.push_back(constraint2);
}

bool BasicBlock::update() {
	/* Process the block. Return true if the block's context is modified.*/
	std::cout << "Processing block " << getName() << std::endl;
	std::list<ap_tcons1_t> constraints;

	ap_abstract1_t prev = m_abst_value;

	llvm::BasicBlock::iterator it;
	for (it = m_basicBlock->begin(); it != m_basicBlock->end(); it ++) {
		llvm::Instruction & inst = *it;
		processInstruction(constraints, inst);
	}

	ap_manager_t * manager = getManager();
	ap_environment_t* env = getEnvironment();

	ap_tcons1_array_t array = createTcons1Array(constraints);

	fprintf(stdout,"Constraints:\n");
	ap_tcons1_array_fprint(stdout,&array);

	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			manager, env, &array);
	fprintf(stdout,"Abstract value:\n");
	ap_abstract1_fprint(stdout, manager, &abs);

	m_abst_value = ap_abstract1_join(manager, false, &prev, &abs);
	return is_eq(prev);
}

ap_abstract1_t BasicBlock::abstractOfTconsList(
		std::list<ap_tcons1_t> & constraints) {
	ap_tcons1_array_t array = createTcons1Array(constraints);
	ap_tcons1_array_fprint(stdout,&array);
	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			getManager(), getEnvironment(), &array);
	return abs;
}

ap_tcons1_array_t BasicBlock::createTcons1Array(
		std::list<ap_tcons1_t> & constraints) {
	ap_tcons1_array_t array = ap_tcons1_array_make(
			getEnvironment(), constraints.size());
	int idx = 0;
	std::list<ap_tcons1_t>::iterator it;
	for (it = constraints.begin(); it != constraints.end(); it++) {
		ap_tcons1_t & constraint = *it;
		ap_tcons1_t constraint2 = ap_tcons1_copy(&constraint);
		extendTconsEnvironment(&constraint2);
		assert(!ap_tcons1_array_set(&array, idx++, &constraint2));
	}
	return array;
}

void BasicBlock::processInstruction(std::list<ap_tcons1_t> & constraints,
		llvm::Instruction & inst) {
	const llvm::DebugLoc & debugLoc = inst.getDebugLoc();
	// TODO Circular dependancy
	ValueFactory * factory = ValueFactory::getInstance();
	Value * value = factory->getValue(&inst);
	if (!value || value->isSkip()) {
		return;
	}
	std::cout << "Apron: Instruction: "
			/*<< scope->getFilename() << ": " */
			<< debugLoc.getLine() << ": "
			<< value->toString() << "\n";
	InstructionValue * instructionValue =
			static_cast<InstructionValue*>(value);
	instructionValue->populateTreeConstraints(constraints);
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

