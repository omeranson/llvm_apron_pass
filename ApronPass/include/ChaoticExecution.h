#ifndef CHAOTIC_EXECUTION_H
#define CHAOTIC_EXECUTION_H

#include <list>
#include <set>

class CallGraph;
class BasicBlock;
class AbstractState;

template <class T>
class UniqueQueue;

class ChaoticExecution {
private:
	CallGraph & callGraph;
	std::set<BasicBlock *> seen;
	std::map<BasicBlock *, int> m_joinCount;

	bool isSeen(BasicBlock * block);
	void see(BasicBlock * block);
	void populateWithSuccessors(
		UniqueQueue<BasicBlock *> & worklist, BasicBlock * block, AbstractState & state);
	bool join(BasicBlock * source, BasicBlock * dest, AbstractState & state);
public:
	ChaoticExecution(CallGraph & callGraph);

	virtual void execute();
	virtual void print();
};



#endif // CHAOTIC_EXECUTION_H
