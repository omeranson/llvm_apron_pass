#include <set>

#include <AbstractStates/ApronAbstractState.h>
#include <APStream.h>

#include <llvm/Support/raw_ostream.h>

#include <ap_environment.h>

extern ap_manager_t * apron_manager;
extern bool Debug;

// In place
void changeToLeastCommonEnv(ap_abstract1_t & a1, ap_abstract1_t & a2, bool isBottom) {
	ap_dimchange_t * dimchange1 = NULL;
	ap_dimchange_t * dimchange2 = NULL;
	ap_environment_t * environment = ap_environment_lce(
			ap_abstract1_environment(apron_manager, &a1),
			ap_abstract1_environment(apron_manager, &a2),
			&dimchange1, &dimchange2);

	a1 = ap_abstract1_change_environment(
			apron_manager, true, &a1, environment, isBottom);
	a2 = ap_abstract1_change_environment(
			apron_manager, true, &a2, environment, isBottom);
}


ApronAbstractState::ApronAbstractState() :
		m_abstract1(ap_abstract1_bottom(apron_manager, ap_environment_alloc_empty())) {}

ApronAbstractState::ApronAbstractState(const ap_abstract1_t & abst) :
		m_abstract1(abst) {}

ApronAbstractState::ApronAbstractState(const ap_abstract1_t * abst) :
		m_abstract1(*abst) {}

ApronAbstractState::ApronAbstractState(const ApronAbstractState& other) :
		m_abstract1(ap_abstract1_copy(apron_manager, (ap_abstract1_t*)&other.m_abstract1)) {}

ApronAbstractState & ApronAbstractState::operator=(const ApronAbstractState& other) {
	ap_abstract1_clear(apron_manager, &m_abstract1);
	m_abstract1 = ap_abstract1_copy(apron_manager, (ap_abstract1_t*)&other.m_abstract1);
	return *this;
}

ApronAbstractState & ApronAbstractState::operator=(const ap_abstract1_t& other) {
	ap_abstract1_clear(apron_manager, &m_abstract1);
	m_abstract1 = other;
	return *this;
}

ApronAbstractState::~ApronAbstractState() {
	ap_abstract1_clear(apron_manager, &m_abstract1);
}

ApronAbstractState ApronAbstractState::top() {
	ap_abstract1_t abst = ap_abstract1_top(apron_manager, ap_environment_alloc_empty());
	return abst;
}

ApronAbstractState ApronAbstractState::bottom() {
	ap_abstract1_t abst = ap_abstract1_bottom(apron_manager, ap_environment_alloc_empty());
	return abst;
}

ap_scalar_t * ApronAbstractState::zero() {
	ap_scalar_t* zero = ap_scalar_alloc ();
	ap_scalar_set_int(zero, 0);
	return zero;
}

ap_environment_t * ApronAbstractState::getEnvironment() const {
	return ap_abstract1_environment(apron_manager, (ap_abstract1_t*)&m_abstract1);
}

void ApronAbstractState::extendEnvironment(ap_texpr1_t * texpr) {
	bool failed = ap_texpr1_extend_environment_with(texpr, getEnvironment());
	assert(!failed);
}

void ApronAbstractState::extendEnvironment(ap_tcons1_t * tcons) {
	bool failed = ap_tcons1_extend_environment_with(tcons, getEnvironment());
	assert(!failed);
}

bool ApronAbstractState::widen(const ApronAbstractState & other) {
	ap_abstract1_t prev = ap_abstract1_copy(apron_manager, &m_abstract1);
	ap_abstract1_t other_abst = ap_abstract1_copy(apron_manager, (ap_abstract1_t*)&other.m_abstract1);
	ap_abstract1_t this_abst = ap_abstract1_copy(apron_manager, &m_abstract1);
	changeToLeastCommonEnv(this_abst, other_abst, true);

	if (!ap_abstract1_is_leq(apron_manager, &this_abst, &other_abst)) {
		other_abst = ap_abstract1_join(apron_manager, true, &other_abst, &this_abst);
	}
	m_abstract1 = ap_abstract1_widening(apron_manager,
			&this_abst, &other_abst);
	bool isChanged = (*this != prev);
	ap_abstract1_clear(apron_manager, &other_abst);
	ap_abstract1_clear(apron_manager, &this_abst);
	return isChanged;
}

bool ApronAbstractState::join(const ApronAbstractState & other) {
	if (Debug) {
		llvm::errs() << "Joining into: " << &m_abstract1;
		const ap_abstract1_t * other_abstract1 = &other.m_abstract1;
		llvm::errs() << "\tFrom: " << other_abstract1;
	}
	ap_abstract1_t prev = ap_abstract1_copy(apron_manager, &m_abstract1);
	ap_abstract1_t other_abst = ap_abstract1_copy(apron_manager, (ap_abstract1_t*)&other.m_abstract1);
	changeToLeastCommonEnv(m_abstract1, other_abst, true);

	m_abstract1 = ap_abstract1_join(apron_manager, true,
			&m_abstract1, &other_abst);
	bool isChanged = (*this != ApronAbstractState(prev));
	ap_abstract1_clear(apron_manager, &other_abst);
	return isChanged;
}

bool ApronAbstractState::meet(const ApronAbstractState & other) {
	ap_abstract1_t prev = ap_abstract1_copy(apron_manager, &m_abstract1);
	ap_abstract1_t this_abst = ap_abstract1_copy(apron_manager, &m_abstract1);
	ap_abstract1_t other_abst = ap_abstract1_copy(apron_manager, (ap_abstract1_t*)&other.m_abstract1);
	changeToLeastCommonEnv(this_abst, other_abst, false);
	ap_abstract1_clear(apron_manager, &m_abstract1);
	m_abstract1 = ap_abstract1_meet(apron_manager, true,
			&this_abst, &other_abst);
	bool isChanged = (*this != ApronAbstractState(prev));
	ap_abstract1_clear(apron_manager, &other_abst);
	return isChanged;
}

bool ApronAbstractState::join(const std::vector<ApronAbstractState> & others) {
	if (others.empty()) {
		return false;
	}
	ApronAbstractState prev = *this;
	unsigned size = others.size() + 1;
	std::vector<ap_environment_t*> envs;
	envs.reserve(size);
	envs.push_back(getEnvironment());
	for (const ApronAbstractState & aas : others) {
		envs.push_back(aas.getEnvironment());
	}
	ap_dimchange_t** ptdimchange;
	ap_environment_t * environment = ap_environment_lce_array(
			envs.data(), envs.size(), &ptdimchange);
	std::vector<ap_abstract1_t> values;
	values.reserve(size);
	values.push_back(ap_abstract1_change_environment(apron_manager,
				true, &m_abstract1, environment, true));
	for (const ApronAbstractState & aas : others) {
		values.push_back(ap_abstract1_change_environment(apron_manager,
				false, (ap_abstract1_t*)&aas.m_abstract1, environment, true));
	}
	m_abstract1 = ap_abstract1_join_array(apron_manager,
			values.data(), values.size());
	for (ap_abstract1_t & value : values) {
		ap_abstract1_clear(apron_manager, &value);
	}
	bool result = (prev == *this);
	return result;
}

void ApronAbstractState::assign(const std::string & var, ap_texpr1_t * value) {
	ap_var_t apvar = (ap_var_t)var.c_str();
	if (!isKnown(var)) {
		extend(var, false);
		m_abstract1 = ap_abstract1_assign_texpr(apron_manager, true,
				&m_abstract1, apvar, value, NULL);
	} else {
		static const std::string tmp_name = "__tmp_apron_ppl_varname";
		extend(tmp_name);
		ap_var_t aptmpvar = (ap_var_t)tmp_name.c_str();
		m_abstract1 = ap_abstract1_assign_texpr(apron_manager, true,
				&m_abstract1, aptmpvar, value, NULL);
		rename(tmp_name, var);
	}
}

void ApronAbstractState::extend(const std::string & var, bool isBottom) {
	if (isKnown(var)) {
		return;
	}
	ap_environment_t * environment = ap_abstract1_environment(apron_manager, &m_abstract1);
	ap_var_t apvar = (ap_var_t)strdup(var.c_str());
	environment = ap_environment_add(environment, &apvar, 1, NULL, 0);
	m_abstract1 = ap_abstract1_change_environment(apron_manager, true,
			&m_abstract1, environment, isBottom);
}

void ApronAbstractState::forget(const std::string & varname, bool isBottom) {
	if (!isKnown(varname)) {
		return;
	}
	ap_var_t var = (ap_var_t)varname.c_str();
	m_abstract1 = ap_abstract1_forget_array(apron_manager, false,
			&m_abstract1, &var, 1, isBottom);
}

void ApronAbstractState::minimize(const std::string & var) {
	forget(var);
	minimize();
}

void ApronAbstractState::minimize() {
	m_abstract1 = ap_abstract1_minimize_environment(apron_manager, true,
			&m_abstract1);
}

void ApronAbstractState::minimizeState() {
	ap_abstract1_minimize(apron_manager, &m_abstract1);
}

void ApronAbstractState::canonicalize() {
	ap_abstract1_canonicalize(apron_manager, &m_abstract1);
}

void ApronAbstractState::start_meet_aggregate() {
	m_isMeetAggregate = true;
}

void ApronAbstractState::meet(ap_tcons1_t & cons) {
	if (m_isMeetAggregate) {
		m_meetAggregates.push_back(cons);
	} else {
		extendEnvironment(&cons);
		ap_tcons1_array_t array = ap_tcons1_array_make(getEnvironment(), 1);
		ap_tcons1_array_set(&array, 0, &cons);
		meet(array);
	}
}

void ApronAbstractState::finish_meet_aggregate() {
	m_isMeetAggregate = false;
	if (m_meetAggregates.empty()) {
		return;
	}

	ap_tcons1_array_t array = ap_tcons1_array_make(getEnvironment(),
			m_meetAggregates.size());
	int idx = 0;
	for (ap_tcons1_t & tcons : m_meetAggregates) {
		extendEnvironment(&tcons);
		ap_tcons1_array_set(&array, idx, &tcons);
		++idx;
	}
	meet(array);
	m_meetAggregates.clear();
}

void ApronAbstractState::makeTop() {
	*this = ApronAbstractState::top();
	m_meetAggregates.clear();
}

void ApronAbstractState::makeBottom() {
	*this = ApronAbstractState::bottom();
	m_meetAggregates.clear();
}

void ApronAbstractState::rename(const std::string & orig, const std::string & new_) {
	ap_var_t origapvar = (ap_var_t)orig.c_str();
	ap_var_t newapvar = (ap_var_t)new_.c_str();
	if (isKnown(new_)) {
		forget(new_);
		ap_environment_t * environment = ap_environment_remove(
				getEnvironment(), &newapvar, 1);
		m_abstract1 = ap_abstract1_change_environment(apron_manager, true,
				&m_abstract1, environment, false);
	}
	m_abstract1 = ap_abstract1_rename_array(
			apron_manager, true, &m_abstract1,
			&origapvar, &newapvar, 1);
}

std::string ApronAbstractState::renameVarForC(const std::string & varName) {
	std::string newName = varName;
	bool startOfSym = true;
	std::string::iterator it;
	for (it = newName.begin(); it != newName.end(); it++) {
		char & c = *it;
		if (startOfSym && (!isalpha(c)) && (c != '_') && (c != '(') && (c != '*')) {
			it = newName.insert(it, '_');
			startOfSym = false;
			continue;
		}
		startOfSym = false;
		if (isalnum(c) || (c == '_')) {
			continue;
		}
		if ((c == '(') || (c == ')') || (c == '*') || (c == ',') || isspace(c)) {
			startOfSym = true;
			continue;
		}
		c = '_';
	}
	return newName;
}

std::map<std::string, std::string> ApronAbstractState::renameVarsForC() {
	std::map<std::string, std::string> renameMap;
	std::vector<ap_var_t> oldnames;
	std::vector<ap_var_t> newnames;
	std::set<std::string> newnamesSet;
	ap_environment_t * environment = getEnvironment();
	int env_size = environment->intdim;
	for (int cnt = 0; cnt < env_size; cnt++) {
		ap_var_t var = ap_environment_var_of_dim(environment, cnt);
		std::string varName = (char*)var;
		std::string newName = renameVarForC(varName);
		oldnames.push_back(var);
		newnames.push_back((ap_var_t)strdup(newName.c_str()));
		renameMap[varName] = newName;
		bool collision = !newnamesSet.insert(newName).second;
		assert(!collision);
	}
	m_abstract1 = ap_abstract1_rename_array(
			apron_manager, true, &m_abstract1,
			oldnames.data(), newnames.data(), env_size);
	return renameMap;
}

void ApronAbstractState::meet(ap_tcons1_array_t & tconsarray) {
	m_abstract1 = ap_abstract1_meet_tcons_array(
			apron_manager, true, &m_abstract1, &tconsarray);
}

bool ApronAbstractState::isTop() const {
	return ap_abstract1_is_top(apron_manager, (ap_abstract1_t*)&m_abstract1);
}

bool ApronAbstractState::isBottom() const {
	return ap_abstract1_is_bottom(apron_manager, (ap_abstract1_t*)&m_abstract1);
}

bool ApronAbstractState::isKnown(const std::string & var) const {
	ap_environment_t * environment = getEnvironment();
	ap_var_t apvar = (ap_var_t)var.c_str();
	return ap_environment_mem_var(environment, apvar);
}

bool ApronAbstractState::operator==(const ApronAbstractState &other) const {
	return ap_environment_is_eq(getEnvironment(), other.getEnvironment()) &&
			ap_abstract1_is_eq(apron_manager,
					(ap_abstract1_t*)&m_abstract1,
					(ap_abstract1_t*)&other.m_abstract1);
}

bool ApronAbstractState::operator!=(const ApronAbstractState &other) const {
	return !(*this == other);
}

bool ApronAbstractState::operator<=(const ApronAbstractState & other) const {
	ap_environment_t * my_env = (ap_environment_t*)getEnvironment();
	ap_environment_t * other_env = (ap_environment_t*)other.getEnvironment();
	if (!ap_environment_is_leq(my_env, other_env)) {
		return false;
	}
	ap_abstract1_t this_abst = ap_abstract1_change_environment(
			apron_manager, false,
			(ap_abstract1_t*)&m_abstract1, other_env, true);
	bool isLeq = ap_abstract1_is_leq(apron_manager, &this_abst,
			(ap_abstract1_t*)&other.m_abstract1);
	ap_abstract1_clear(apron_manager, &this_abst);
	return isLeq;
}

bool ApronAbstractState::isSat(ap_tcons1_t & cons) const {
	bool isSat = !!(ap_abstract1_sat_tcons(apron_manager, (ap_abstract1_t*)&m_abstract1, &cons));
	ap_tcons1_clear(&cons);
	return isSat;
}

bool ApronAbstractState::isPosssiblyNotZero(const std::string & var) const {
	if (!isKnown(var)) {
		return true;
	}
	ap_var_t apvar = (ap_var_t)var.c_str();
	ap_texpr1_t * apvarexpr = ap_texpr1_var(getEnvironment(), apvar);
	ap_tcons1_t isZero = ap_tcons1_make(AP_CONS_EQ, apvarexpr, zero());
	return !(isSat(isZero));
}

bool ApronAbstractState::isConstrained(const std::string & var) const {
	if (!isKnown(var)) {
		return false;
	}
	ap_var_t apvar = (ap_var_t)var.c_str();
	return !ap_abstract1_is_variable_unconstrained(apron_manager,
			(ap_abstract1_t*)&m_abstract1, apvar);
}


ap_texpr1_t * ApronAbstractState::asTexpr(const std::string & var) {
	extend(var);
	ap_var_t apvar = (ap_var_t)var.c_str();
	return ap_texpr1_var(getEnvironment(), apvar);
}

ap_texpr1_t * ApronAbstractState::asTexpr(int64_t value) {
	return ap_texpr1_cst_scalar_int(getEnvironment(), value);
}

ap_texpr1_t * ApronAbstractState::asTexpr(double value) {
	return ap_texpr1_cst_scalar_double(getEnvironment(), value);
}
