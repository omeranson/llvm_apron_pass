#ifndef CALLGRAPH_H
#define CALLGRAPH_H

#include <BasicBlock.h>
#include <Function.h>

#include <map>
#include <string>

class CallGraph {
private:
	std::multimap<BasicBlock *, BasicBlock *> m_nexts;
	std::multimap<BasicBlock *, BasicBlock *> m_prevs;
	Function * m_function;
	BasicBlock * m_root;
	std::string m_name;

	void constructGraph();
public:
	CallGraph(Function * function);
	CallGraph(const std::string & name, BasicBlock * root);

	virtual BasicBlock * getRoot();
	virtual const std::string & getName() const;
	virtual void populateWithSuccessors(std::list<BasicBlock *> & list,
			BasicBlock * block);
	virtual void populateWithPredecessors(std::list<BasicBlock *> & list,
			BasicBlock * block);
	virtual void printAsDot(); 
};

#endif /* CALLGRAPH_H */
