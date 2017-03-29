#include <BasicBlock.h>
#include <Value.h>
extern "C" {
#include <Adaptor.h>
}
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
#include <ap_ppl.h>

ap_environment_t * m_ap_environment = ap_environment_alloc_empty();
/*			       BasicBlockManager			     */
BasicBlockManager BasicBlockManager::instance;
BasicBlockManager & BasicBlockManager::getInstance() {
	return instance;
}

BasicBlockManager::BasicBlockManager() : m_manager(create_manager()) {}
//BasicBlockManager::BasicBlockManager() : m_manager(ap_ppl_poly_manager_alloc(true)) {}
//BasicBlockManager::BasicBlockManager() : m_manager(box_manager_alloc()) {}

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
	ap_manager_t * manager = getManager();
	ap_environment_t * environment = getEnvironment();
	ap_abstract1_t lclValue = ap_abstract1_change_environment(
			manager,
			false,
			&value,
			environment,
			false);
	m_abst_value = ap_abstract1_change_environment(
			manager,
			false,
			&m_abst_value,
			environment,
			false);
	return ap_abstract1_is_eq(getManager(), &m_abst_value, &lclValue);
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

ap_interval_t * BasicBlock::getVariableInterval(Value * value) {
	ap_var_t var = value->varName();
	ap_interval_t* result = ap_abstract1_bound_variable(
			getManager(), &m_abst_value, var);
	if (!result) {
		extendEnvironment(value);
		result = ap_abstract1_bound_variable(
				getManager(), &m_abst_value, var);
		if (!result) {
			llvm::errs() << "This one is still not in env " <<
					(void*)getEnvironment() << ": " <<
					(void*)var << " " <<
					(char*)var << "\n";
			abort();
		}
	}
	return result;
}

ap_texpr1_t* BasicBlock::getVariableTExpr(Value * value) {
	ap_var_t var = value->varName();
	ap_texpr1_t* result = ap_texpr1_var(getEnvironment(), var);
	if (!result) {
		extendEnvironment(value);
		result = ap_texpr1_var(getEnvironment(), var);
		if (!result) {
			llvm::errs() << "This one is still not in env " <<
					(void*)getEnvironment() << ": " <<
					(void*)var << " " <<
					(char*)var << "\n";
			abort();
		}
	}
	return result;
}

void BasicBlock::extendTexprEnvironment(ap_texpr1_t * texpr) {
	// returns true on error. WTF?
	bool failed = ap_texpr1_extend_environment_with(texpr, getEnvironment());
	assert(!failed);
}

void BasicBlock::extendTconsEnvironment(ap_tcons1_t * tcons) {
	// returns true on error. WTF?
	bool failed = ap_tcons1_extend_environment_with(tcons, getEnvironment());
	assert(!failed);
}

bool BasicBlock::join(ap_abstract1_t & abst_value) {
	ap_abstract1_t prev = m_abst_value;
	ap_manager_t * manager = getManager();
	m_abst_value = ap_abstract1_change_environment(manager, false,
			&m_abst_value, getEnvironment(), false);
	m_abst_value = ap_abstract1_join(manager, false,
			&m_abst_value, &abst_value);
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
	bool failed = ap_tcons1_array_set(&array, 0, &constraint);
	assert(!failed);
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
	bool failed = ap_tcons1_array_set(&array, 0, &constraint);
	assert(!failed);
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
	bool failed = ap_tcons1_array_set(&array, 0, &constraint);
	assert(!failed);
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

template <class stream>
void BasicBlock::streamAbstract1Manually(
			stream & s, ap_abstract1_t & abst1) {
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	// Despite the docs, this method doesn't exist
	//ap_manager_t* manager = ap_abstract1_manager (&abst1)
	ap_manager_t* manager = getManager();
	ap_environment_t * environment = ap_abstract1_environment(manager, &abst1);
	int env_size = environment->intdim;
	for (int cnt = 0; cnt < env_size; cnt++) {
		ap_var_t var = ap_environment_var_of_dim(environment, cnt);
		ap_interval_t* interval = ap_abstract1_bound_variable(
			manager, &abst1, var);
		fprintf(bufferfp, "\t%s: ", (char*)var);
		ap_interval_fprint(bufferfp, interval);
		fputc('\n', bufferfp);
	}
	// TODO Manually iterate vars in env, and print intervals from abst val
	fputc('\0', bufferfp);
	fclose(bufferfp);
	s << buffer;
}

template <class stream>
void BasicBlock::streamAbstract1(
			stream & s, ap_abstract1_t & abst1) {
	char * buffer;
	size_t size;
	ap_abstract1_canonicalize(getManager(), &abst1);
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_abstract1_fprint(bufferfp, getManager(), &abst1);
	fputc('\0', bufferfp);
	fclose(bufferfp);
	s << buffer;
}

template <class stream>
void BasicBlock::streamTCons1(
			stream & s, ap_tcons1_t & tcons) {
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_tcons1_fprint(bufferfp, &tcons);
	fputc('\0', bufferfp);
	fclose(bufferfp);
	s << buffer;
}

bool BasicBlock::update() {
	/* Process the block. Return true if the block's context is modified.*/
	//llvm::errs() << "Processing block '" << getName() << "'\n";
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
	ap_abstract1_t abs = abstractOfTconsList(constraints);

	// Some debug output
	/*
	llvm::errs() << "Block prev abstract value:\n";
	streamAbstract1(llvm::errs(), prev);
	llvm::errs() << "isTop: " << isTop(prev) <<
			". isBottom: " << isBottom(prev) << "\n";

	std::list<ap_tcons1_t>::iterator cons_it;
	llvm::errs() << "List of " << constraints.size() << " constraints:\n";
	for (cons_it = constraints.begin(); cons_it != constraints.end(); cons_it++) {
		streamTCons1(llvm::errs(), *cons_it);
		llvm::errs() << "\n";
	}
	llvm::errs() << "Calculated abstract value:\n";
	streamAbstract1(llvm::errs(), abs);
	llvm::errs() << "isTop: " << isTop(abs) <<
			". isBottom: " << isBottom(abs) << "\n";

	llvm::errs() << "Block new abstract value:\n";
	streamAbstract1(llvm::errs(), m_abst_value);
	llvm::errs() << "isTop: " << isTop() <<
			". isBottom: " << isBottom() << "\n";
	llvm::errs() << "Block values ranges:\n";
	streamAbstract1Manually(llvm::errs(), m_abst_value);
	llvm::errs() << "\n";
	*/
	bool markedForChanged = m_markedForChanged;
	m_markedForChanged = false;
	bool isChanged = !is_eq(abs);
	m_abst_value = abs;
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
		bool failed = ap_tcons1_array_set(&array, idx++, &constraint2);
		assert(!failed);
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
		//llvm::errs() << "Skipping UNKNOWN instruction: ";
		//inst.print(llvm::errs());
		//llvm::errs() << "\n";
		return;
	}
	if (value->isSkip()) {
		/*llvm::errs() << "Skipping set-skipped instruction: " << value->toString() << "\n";*/
		return;
	}
	//llvm::errs() << "Apron: Instruction: "
			//// << scope->getFilename() << ": "
			//<< debugLoc.getLine() << ": "
			//<< value->toString() << "\n";
	InstructionValue * instructionValue =
			static_cast<InstructionValue*>(value);
	instructionValue->populateTreeConstraints(constraints);
}

std::string BasicBlock::toString() {
	std::ostringstream oss;
	oss << getName() << ": ";
	streamAbstract1(oss, m_abst_value);
	oss << "\nRanges:\n";
	streamAbstract1Manually(oss, m_abst_value);
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

