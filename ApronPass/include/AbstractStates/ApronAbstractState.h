#ifndef APRON_ABSTRACT_STATE_H
#define APRON_ABSTRACT_STATE_H

#include <string>
#include <vector>

#include <ap_abstract1.h>
#include <ap_tcons1.h>
#include <ap_texpr1.h>

extern unsigned WideningThreshold;

class ApronAbstractState {
protected:
	ApronAbstractState();
	bool m_isMeetAggregate = false;
	std::vector<ap_tcons1_t> m_meetAggregates;
	int joinCount = 0;
	int m_wideningThreshold = 1000;

	virtual void meet(ap_tcons1_array_t & tconsarray);
public:
// XXX(oanson) The functions in this public block should be made protected once possible
	virtual ap_environment_t * getEnvironment();
	virtual void extendEnvironment(ap_texpr1_t * texpr);
	virtual void extendEnvironment(ap_tcons1_t * tcons);
public:
	ap_abstract1_t m_abstract1;
	ApronAbstractState(const ap_abstract1_t & abst);
	ApronAbstractState(const ap_abstract1_t * abst);

	static ApronAbstractState top();
	static ApronAbstractState bottom();

	// Modification
	virtual bool join(const ApronAbstractState & other);
	virtual void assign(const std::string & var, ap_texpr1_t * value);
	virtual void extend(const std::string & var, bool isBottom=false);
	virtual void forget(const std::string & var, bool isBottom=false);
	virtual void minimize(const std::string & var);
	virtual void start_meet_aggregate();
	virtual void meet(ap_tcons1_t & cons);
	virtual void finish_meet_aggregate();

	// Getters
	virtual bool isTop() const;
	virtual bool isBottom() const;
	virtual ap_texpr1_t * asTexpr(const std::string & var);
	virtual ap_texpr1_t * asTexpr(int64_t value);
	virtual ap_texpr1_t * asTexpr(double value);
};

#endif // APRON_ABSTRACT_STATE_H
