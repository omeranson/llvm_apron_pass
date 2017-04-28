#ifndef APRON_ABSTRACT_STATE_H
#define APRON_ABSTRACT_STATE_H

#include <string>
#include <vector>
#include <map>

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
	int m_wideningThreshold = WideningThreshold;

public:
// XXX(oanson) The functions in this public block should be made protected once possible
	virtual ap_environment_t * getEnvironment() const;
	virtual void extendEnvironment(ap_texpr1_t * texpr);
	virtual void extendEnvironment(ap_tcons1_t * tcons);
	virtual void meet(ap_tcons1_array_t & tconsarray);
public:
	ap_abstract1_t m_abstract1;
	ApronAbstractState(const ap_abstract1_t & abst);
	ApronAbstractState(const ap_abstract1_t * abst);

	static ApronAbstractState top();
	static ApronAbstractState bottom();

	// Modification
	virtual bool join(const ApronAbstractState & other);
	virtual bool join(const std::vector<ApronAbstractState> & others);
	virtual bool meet(const ApronAbstractState & other);
	virtual void assign(const std::string & var, ap_texpr1_t * value);
	virtual void extend(const std::string & var, bool isBottom=false);
	virtual void forget(const std::string & var, bool isBottom=false);
	virtual void minimize(const std::string & var);
	virtual void minimize();
	virtual void canonicalize();
	virtual void start_meet_aggregate();
	virtual void meet(ap_tcons1_t & cons);
	virtual void finish_meet_aggregate();
	virtual void makeTop();
	virtual void makeBottom();
	virtual std::string renameVarForC(const std::string & varName);
	virtual std::map<std::string, std::string> renameVarsForC();

	// Getters
	virtual bool isTop() const;
	virtual bool isBottom() const;
	virtual bool isKnown(const std::string & var) const;
	virtual bool operator==(const ApronAbstractState &) const;
	virtual bool operator!=(const ApronAbstractState &) const;
	virtual ap_texpr1_t * asTexpr(const std::string & var);
	virtual ap_texpr1_t * asTexpr(int64_t value);
	virtual ap_texpr1_t * asTexpr(double value);

	class Variables {
		ap_environment_t * env;
	public:
		Variables(const ApronAbstractState & state) : env(state.getEnvironment()) {}
		class VariableIterator {
			int dim;
			const ap_environment_t * env;
		public:
			VariableIterator(ap_environment_t * env, int dim = 0) :
				env(env), dim(dim) {}

			VariableIterator & operator++() {
				++dim;
				return *this;
			}
			VariableIterator & operator--() {
				--dim;
				return *this;
			}
			bool operator==(const VariableIterator & other) const {
				return (other.env == env) && (other.dim == dim);
			}

			bool operator!=(const VariableIterator & other) const {
				return !(*this == other);
			}

			std::string operator*() const {
				ap_var_t var = ap_environment_var_of_dim(
						(ap_environment_t*)env, dim);
				std::string varName = (char*)var;
				return varName;
			}
		};
		VariableIterator begin() const {
			return VariableIterator(env, 0);
		}
		VariableIterator end() const {
			return VariableIterator(env, env->intdim);
		}
	};
};

#endif // APRON_ABSTRACT_STATE_H
