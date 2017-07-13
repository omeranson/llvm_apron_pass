#ifndef CHAOTIC_EXECUTION_H
#define CHAOTIC_EXECUTION_H

#include <list>
#include <set>

class CallGraph;
class BasicBlock;
class AbstractState;

template <class T>
class UniqueQueue;
class Strategy;

class ChaoticExecution {
private:
	CallGraph & callGraph;
	Strategy * m_strategy;
public:
	enum StrategySelector {
		ChaoticExecutionStrategy_BFS,
		ChaoticExecutionStrategy_DFS,
		ChaoticExecutionStrategy_WTO
	};
	ChaoticExecution(CallGraph & callGraph, StrategySelector strategy);

	virtual void execute();
	virtual void print();
};

#endif // CHAOTIC_EXECUTION_H
