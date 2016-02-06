#ifndef CALLGRAPH_H
#define CALLGRAPH_H

#include <BasicBlock>

#include <map>
#include <string>

class CallGraph {
private:
	std::multimap<BasicBlock *, BasicBlock *> m_nexts;
	std::multimap<BasicBlock *, BasicBlock *> m_prevs;
	BasicBlock * m_root;
	std::string m_name;
public:
	CallGraph(std::string name, BasicBlock * root);

	virtual BasicBlock * getRoot();
	virtual std::string & getName();
	virtual void populateWithSuccessors(std::list<BasicBlock *> & list,
			BasicBlock * block);
	virtual void populateWithPredecessors(std::list<BasicBlock *> & list,
			BasicBlock * block);
	virtual void printAsDot(); 
};

#endif /* CALLGRAPH_H */
