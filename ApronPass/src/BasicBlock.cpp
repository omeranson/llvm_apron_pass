#include <BasicBlock.h>
#include <Value.h>

#include <cstdio>
#include <iostream>
#include <sstream>

#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Instructions.h>

#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>
#include <box.h>
#include <oct.h>
#include <pk.h>
#include <pkeq.h>

ap_environment_t * m_ap_environment = ap_environment_alloc_empty();
/*			       BasicBlockManager			     */
BasicBlockManager BasicBlockManager::instance;
BasicBlockManager & BasicBlockManager::getInstance() {
	return instance;
}

BasicBlockManager::BasicBlockManager() : m_manager(box_manager_alloc()) {}
BasicBlock * BasicBlockManager::createBasicBlock(llvm::BasicBlock * basicBlock) {
	BasicBlock * result = new BasicBlock(m_manager, basicBlock);
	return result;
}

BasicBlock * BasicBlockManager::getBasicBlock(llvm::BasicBlock * basicBlock) {
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
		//m_ap_environment(ap_environment_alloc_empty()),
		m_markedForChanged(false) {
	m_abst_value = ap_abstract1_bottom(manager, getEnvironment());
	if (!basicBlock->hasName()) {
		initialiseBlockName();
	}
}

void BasicBlock::initialiseBlockName() {
	std::ostringstream oss;
	oss << "BasicBlock-" << ++basicBlockCount;
	std::string sname = oss.str();
	llvm::Twine name(sname);
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

ap_abstract1_t & BasicBlock::getAbstractValue() {
	return m_abst_value;
}

ap_manager_t * BasicBlock::getManager() {
	// In a function, since manager is global, and this impl. may change
	return m_manager;
}

ap_environment_t * BasicBlock::getEnvironment() {
	return m_ap_environment;
}

void BasicBlock::setEnvironment(ap_environment_t * nenv) {
	m_ap_environment = nenv;
}

void BasicBlock::extendEnvironment(Value * value) {
	ap_environment_t* env = getEnvironment();
	ap_var_t var = value->varName();
	// TODO Handle reals
	ap_environment_t* nenv = ap_environment_add(env, &var, 1, NULL, 0);
	setEnvironment(nenv);
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

bool BasicBlock::unify(ap_abstract1_t & abst_value) {
	ap_abstract1_t prev = m_abst_value;
	m_abst_value = ap_abstract1_unify(getManager(), false,
			&m_abst_value, &abst_value);
	return is_eq(prev);
}

bool BasicBlock::unify(BasicBlock & basicBlock) {
	return unify(basicBlock.m_abst_value);
}

bool BasicBlock::unify(std::list<ap_abstract1_t> & abst_values) {
	std::list<ap_abstract1_t>::iterator it;
	bool result = false;
	for (it = abst_values.begin(); it != abst_values.end(); it++) {
		ap_abstract1_t & value = *it;
		result |= unify(value);
	}
	return result;
}

bool BasicBlock::unify(ap_tcons1_t & constraint) {
	ap_tcons1_array_t array = ap_tcons1_array_make(getEnvironment(), 1);
	extendTconsEnvironment(&constraint);
	assert(!ap_tcons1_array_set(&array, 0, &constraint));
	ap_abstract1_t abs = ap_abstract1_of_tcons_array(
			getManager(), getEnvironment(), &array);
	return unify(abs);
}

bool BasicBlock::isTop(ap_abstract1_t & value) {
	return ap_abstract1_is_top(getManager(), &value);
}

bool BasicBlock::isBottom(ap_abstract1_t & value) {
	return ap_abstract1_is_bottom(getManager(), &value);
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
	setEnvironment(env);

	ap_texpr1_t* y = ap_texpr1_var(getEnvironment(), (ap_var_t)y_name);
	ap_texpr1_t* z = ap_texpr1_var(getEnvironment(), (ap_var_t)z_name);

	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);

	ap_tcons1_t constraint1 = ap_tcons1_make(AP_CONS_SUPEQ, y, zero);
	ap_tcons1_t constraint2 = ap_tcons1_make(AP_CONS_SUPEQ, z, zero);
	
	constraints.push_back(constraint1);
	constraints.push_back(constraint2);
}

void BasicBlock::setChanged() {
	m_markedForChanged = true;
}

bool BasicBlock::update() {
	/* Process the block. Return true if the block's context is modified.*/
	std::cout << "Processing block " << getName() << std::endl;
	std::list<ap_tcons1_t> constraints;
	populateConstraintsFromAbstractValue(constraints);

	ap_abstract1_t prev = m_abst_value;
	llvm::BasicBlock::iterator it;
	for (it = m_basicBlock->begin(); it != m_basicBlock->end(); it ++) {
		llvm::Instruction & inst = *it;
		processInstruction(constraints, inst);
	}

	ap_manager_t * manager = getManager();
	ap_environment_t* env = getEnvironment();
	
	fprintf(stdout,"Block prev abstract value:\n");
	ap_abstract1_fprint(stdout, manager, &prev);
	fprintf(stdout,"isTop: %s. isBottom: %s\n",
			isTop(prev) ? "True" : "False",
			isBottom(prev) ? "True" : "False" );
	

	// Not using abstractOfTconsList sinse we want to add debugs
	ap_abstract1_t abs = abstractOfTconsList(constraints);
	// Some debug output
	std::list<ap_tcons1_t>::iterator cons_it;
	fprintf(stdout,"List of %lu constraints:\n", constraints.size());
	for (cons_it = constraints.begin(); cons_it != constraints.end(); cons_it++) {
		ap_tcons1_fprint(stdout, &(*cons_it));
		fprintf(stdout,"\n");
	}
	fprintf(stdout,"Calculated abstract value:\n");
	ap_abstract1_fprint(stdout, manager, &abs);
	fprintf(stdout,"isTop: %s. isBottom: %s\n",
			isTop(abs) ? "True" : "False",
			isBottom(abs) ? "True" : "False" );

	bool isChanged = join(abs);
	fprintf(stdout,"Block new abstract value:\n");
	ap_abstract1_fprint(stdout, manager, &m_abst_value);
	fprintf(stdout,"isTop: %s. isBottom: %s\n",
			isTop() ? "True" : "False",
			isBottom() ? "True" : "False" );
	bool markedForChanged = m_markedForChanged;
	m_markedForChanged = false;
	return markedForChanged && isChanged;
}

void BasicBlock::populateConstraintsFromAbstractValue(
		std::list<ap_tcons1_t> & constraints) {
	if (isBottom()) {
		return;
	}
	ap_tcons1_array_t array = ap_abstract1_to_tcons_array(
			getManager(), &getAbstractValue());
	int size = ap_tcons1_array_size(&array);
	for (int cnt = 0; cnt < size; cnt++) {
		ap_tcons1_t constraint = ap_tcons1_array_get(&array, cnt);
		constraints.push_back(constraint);
	}
}

ap_abstract1_t BasicBlock::abstractOfTconsList(
		std::list<ap_tcons1_t> & constraints) {
	if (constraints.empty()) {
		return ap_abstract1_bottom(getManager(), getEnvironment());
	}
	ap_tcons1_array_t array = createTcons1Array(constraints);
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
	if (!value) {
		/*llvm::errs() << "Skipping UNKNOWN instruction: ";
		inst.print(llvm::errs());
		llvm::errs() << "\n";*/
		return;
	}
	if (value->isSkip()) {
		/*llvm::errs() << "Skipping set-skipped instruction: " << value->toString() << "\n";*/
		return;
	}
	/*std::cout << "Apron: Instruction: "
			// << scope->getFilename() << ": "
			<< debugLoc.getLine() << ": "
			<< value->toString() << "\n";*/
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
