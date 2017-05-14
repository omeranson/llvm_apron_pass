#include <unordered_set>
#include <list>

#include <BasicBlock.h>
#include <CallGraph.h>
#include <ChaoticExecution.h>

extern unsigned UpdateCountMax;
extern unsigned WideningThreshold;

template <class T>
class UniqueQueue {
protected:
	std::list<T> m_queue;
	std::unordered_set<T> m_uniq;
public:
	void push(T & t) {
		auto p = m_uniq.insert(t);
		if (p.second) {
			m_queue.push_back(t);
		}
	}

	T pop() {
		T result = m_queue.front();
		m_queue.pop_front();
		m_uniq.erase(result);
		return result;
	}

	bool empty() {
		return m_queue.empty();
	}
};

ChaoticExecution::ChaoticExecution(CallGraph & callGraph) :
		callGraph(callGraph) {}

bool ChaoticExecution::isSeen(BasicBlock * block) {
	return !(seen.find(block) == seen.end());
}

void ChaoticExecution::see(BasicBlock * block) {
	seen.insert(block);
}

void ChaoticExecution::execute() {
	UniqueQueue<BasicBlock *> worklist;
	BasicBlock * root = callGraph.getRoot();
	std::vector<std::string> userPointers = root->getFunction()->getUserPointers();
	AbstractState state(userPointers);
	root->getAbstractState() = state;
	worklist.push(root);
	while (!worklist.empty()) {
		BasicBlock * block = worklist.pop();
		bool wasSeen = isSeen(block);
		see(block);
		if (UpdateCountMax != 0) {
			llvm::errs() << "Skip block " << block->getName() << "? " << block->updateCount << " ? " << UpdateCountMax << " and " << wasSeen << "\n";
			if (wasSeen && (block->updateCount >= UpdateCountMax)) {
				llvm::errs() << "Skipping " << block->getName()
						<< ": Updated more than " << block->updateCount << "\n";
				continue;
			}
		}
		AbstractState state = block->getAbstractState();
		block->update(state);
		populateWithSuccessors(worklist, block, state);
	}
}

void ChaoticExecution::populateWithSuccessors(
		UniqueQueue<BasicBlock *> & worklist, BasicBlock * block, AbstractState & state) {
	for (BasicBlock * succ : callGraph.successors(block)) {
		bool isSuccModified = join(block, succ, state);
		if (!isSuccModified) {
			continue;
		}
		worklist.push(succ);
	}
}

bool ChaoticExecution::join(BasicBlock * source, BasicBlock * dest, AbstractState & state) {
	int & joinCount = m_joinCount[dest];
	++joinCount;
	AbstractState prev = dest->getAbstractState();
	AbstractState incoming = dest->getAbstractStateWithAssumptions(*source, state);
	bool isChanged;
	bool isJoin = true;
	if (WideningThreshold && (joinCount >= WideningThreshold)) {
		isChanged = dest->getAbstractState().widen(incoming);
		isJoin = false;
	} else {
		isChanged = dest->getAbstractState().join(incoming);
	}
	llvm::errs() << dest->getName() << ": " << (isJoin ? "Joined" : "Widened") << " from " << source->getName() << ":\n";
	llvm::errs() << "Prev: " << prev << "Other: " << incoming << " New: " << dest->getAbstractState();
	llvm::errs() << "isChanged: " << isChanged << " and " << bool(prev != dest->getAbstractState()) << "\n";
	return isChanged;
}

void ChaoticExecution::print() {
	llvm::errs() << "Apron: Library " <<
			apron_manager->library <<
			", version " <<
			apron_manager->version << "\n";
	callGraph.printAsDot();
	std::set<BasicBlock *>::iterator it;
	for (it = seen.begin(); it != seen.end(); it++) {
		llvm::errs() << (*it)->toString() << "\n";
		ap_abstract1_t abst = ((*it)->getFunction()->trimAbstractValue((*it)->getAbstractState()));
		llvm::errs() << "Trimmed: " << (ap_abstract1_t*)&abst;
	}
}
