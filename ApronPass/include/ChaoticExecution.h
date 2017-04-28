#ifndef CHAOTIC_EXECUTION_H
#define CHAOTIC_EXECUTION_H

#include <list>
#include <set>

class CallGraph;
class BasicBlock;

class ChaoticExecution {
private:
	CallGraph & callGraph;
	std::set<BasicBlock *> seen;

	bool isSeen(BasicBlock * block);
	void see(BasicBlock * block);
	void populateWithSuccessors(
		std::list<BasicBlock *> & worklist, BasicBlock * block);
public:
	ChaoticExecution(CallGraph & callGraph);

	virtual void execute();
	virtual void print();
};



#endif // CHAOTIC_EXECUTION_H
