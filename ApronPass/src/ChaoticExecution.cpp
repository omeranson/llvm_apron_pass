#include <BasicBlock.h>
#include <CallGraph.h>
#include <ChaoticExecution.h>

extern unsigned UpdateCountMax;

ChaoticExecution::ChaoticExecution(CallGraph & callGraph) :
		callGraph(callGraph) {}

bool ChaoticExecution::isSeen(BasicBlock * block) {
	return !(seen.find(block) == seen.end());
}

void ChaoticExecution::see(BasicBlock * block) {
	seen.insert(block);
}

void ChaoticExecution::execute() {
	std::list<BasicBlock *> worklist;
	BasicBlock * root = callGraph.getRoot();
	std::vector<std::string> userPointers = root->getFunction()->getUserPointers();
	AbstractState state(userPointers);
	root->getAbstractState() = state;
	worklist.push_front(root);
	while (!worklist.empty()) {
		BasicBlock * block = worklist.front();
		worklist.pop_front();
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
		std::list<BasicBlock *> & worklist, BasicBlock * block, AbstractState & state) {
	for (BasicBlock * succ : callGraph.successors(block)) {
		bool isSuccModified = succ->join(*block, state);
		if (!isSuccModified) {
			continue;
		}
		worklist.push_back(succ);
	}
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
