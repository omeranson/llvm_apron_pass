#include <AbstractStates/ApronAbstractState.h>

#include <ap_dimchange.h>
#include <ap_environment.h>

extern ap_manager_t * apron_manager;

ApronAbstractState::ApronAbstractState(const ap_abstract1_t & abst) :
		m_abstract1(abst) {}

ApronAbstractState::ApronAbstractState(const ap_abstract1_t * abst) :
		m_abstract1(*abst) {}

static ApronAbstractState ApronAbstractState::top() {
	ap_abstract1_t abst = ap_abstract1_top(apron_manager, ap_environment_alloc_empty());
	return abst;
}

static ApronAbstractState ApronAbstractState::bottom() {
	ap_abstract1_t abst = ap_abstract1_bottom(apron_manager, ap_environment_alloc_empty());
	return abst;
}

ap_environment_t * ApronAbstractState::getEnvironment() {
	return ap_abstract1_environment(apron_manager, m_abstract1);
}

void ApronAbstractState::extendEnvironment(ap_texpr1_t * texpr) {
	bool failed = ap_texpr1_extend_environment_with(texpr, getEnvironment());
	assert(!failed);
}

void ApronAbstractState::extendEnvironment(ap_tcons1_t * tcons) {
	bool failed = ap_tcons1_extend_environment_with(tcons, getEnvironment());
	assert(!failed);
}

bool ApronAbstractState::join(const ApronAbstractState & other) {
	++joinCount;
	ap_dimchange_t * dimchange1 = NULL;
	ap_dimchange_t * dimchange2 = NULL;
	ap_environment_t * environment = ap_environment_lce(
			ap_abstract1_environment(apron_manager, &m_abstract1),
			ap_abstract1_environment(apron_manager, &other.m_abstract1),
			&dimchange1, &dimchange2);
	
	ap_abstract1_t this_abst = ap_abstract1_change_environment(
			apron_manager, false, &m_abstract1, environment, true);
	ap_abstract1_t other_abst = ap_abstract1_change_environment(
			apron_manager, false,
			&other.m_abstract1, environment, true);

	if ((joinCount % WideningThreshold) == 0) {
		m_abstract1 = ap_abstract1_widening(apron_manager,
				&this_abst, &other_abst);
	} else {
		m_abstract1 = ap_abstract1_join(apron_manager, false,
				&this_abst, &other_abst);
	}
}

void ApronAbstractState::extend(const std::string & var, bool isBottom) {
	ap_environment_t * environment = ap_abstract1_environment(apron_manager, &m_abstract1);
	ap_var_t apvar = (ap_var_t)var.c_str();
	if (!ap_environment_mem_var(environment, apvar)) {
		environment = ap_environment_add(environment, &apvar, 1, NULL, 0);
		m_abstract1 = ap_abstract1_change_environment(apron_manager, false,
				&m_abstract1, environment, isBottom);
	}
}

void ApronAbstractState::assign(const std::string & var, ap_texpr1_t * value) {
	extend(var, false);
	m_abstract1 = ap_abstract1_assign_texpr(apron_manager, false,
			apvar, value, NULL);
}

void ApronAbstractState::start_meet_aggregate() {
	m_isMeetAggregate = true;
}

void ApronAbstractState::meet(ap_tcons1_t & cons) {
	if (m_isMeetAggregate) {
		m_meetAggregates.push_back(cons);
	} else {
		extendEnvironment(cons);
		ap_tcons1_array_t array = ap_tcons1_array_make(getEnvironment(), 1);
		ap_tcons1_array_set(&array, 0, cons);
		meet(&array);
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
		extendEnvironment(tcons);
		ap_tcons1_array_set(&array, idx, cons);
		++idx;
	}
	meet(&array);
	m_meetAggregates.clear();
}

void ApronAbstractState::meet(ap_tcons1_array_t & tconsarray) {
	m_abstract1 = ap_abstract1_meet_tcons_array(
			apron_manager, false, &m_abstract1, &tconsarray);
}
