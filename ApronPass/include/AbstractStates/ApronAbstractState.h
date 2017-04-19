#ifndef APRON_ABSTRACT_STATE_H
#define APRON_ABSTRACT_STATE_H

#include <vector>

#include <ap_abstract1.h>
#include <ap_tcons1.h>
#include <ap_texpr1.h>

class ApronAbstractState {
protected:
	ApronAbstractState();
	bool m_isMeetAggregate = false;
	std::vector<ap_tcons1_t> m_meetAggregates;
	int joinCount = 0;

	virtual ap_environment_t * getEnvironment();
	virtual void extendEnvironment(ap_texpr1_t * texpr);
	virtual void extendEnvironment(ap_tcons1_t * tcons);
	virtual void meet(ap_tcons1_array_t & tconsarray);
public:
	ap_abstract1_t m_abstract1;
	ApronAbstractState(const ap_abstract1_t & abst);
	ApronAbstractState(const ap_abstract1_t * abst);

	static ApronAbstractState top();
	static ApronAbstractState bottom();

	virtual bool join(const ApronAbstractState & other);
	virtual void assign(const std::string & var, ap_texpr1_t * value);
	virtual void extend(const std::string & var, bool isBottom);
	virtual void start_meet_aggregate();
	virtual void meet(ap_tcons1_t cons);
	virtual void finish_meet_aggregate();
}

#endif // APRON_ABSTRACT_STATE_H
