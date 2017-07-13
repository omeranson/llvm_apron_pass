#ifndef CALLGRAPH_H
#define CALLGRAPH_H

#include <BasicBlock.h>
#include <Function.h>

#include <map>
#include <string>

namespace llvm {
	class DominatorTree;
}

class CallGraph {
public:
	std::multimap<BasicBlock *, BasicBlock *> m_nexts;
	std::multimap<BasicBlock *, BasicBlock *> m_prevs;
	Function * m_function;
	BasicBlock * m_root;
	std::string m_name;
	llvm::DominatorTree * domTree;

	void constructGraph();
	virtual std::vector<BasicBlock*> elements(
			std::multimap<BasicBlock *, BasicBlock *> & source, BasicBlock * block);
public:
	CallGraph(Function * function);
	CallGraph(const std::string & name, BasicBlock * root);

	virtual BasicBlock * getRoot();
	virtual const std::string & getName() const;
	virtual std::vector<BasicBlock*> successors(BasicBlock * block);
	virtual std::vector<BasicBlock*> predecessory(BasicBlock * block);
	virtual void printAsDot(); 
	virtual bool isDominates(BasicBlock * dominator, BasicBlock * dominated) const;
	virtual bool isStrictDominates(BasicBlock * dominator, BasicBlock * dominated) const;
};

#endif /* CALLGRAPH_H */
