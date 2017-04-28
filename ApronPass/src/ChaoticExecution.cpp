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
	worklist.clear();
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
		bool isModified = block->update();
		//llvm::errs() << block->toString() <<
				//": isModified: " <<
				//isModified  << "\n";
		if (!wasSeen || isModified) {
			callGraph.populateWithSuccessors(
					worklist, block);
		}
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
	}
}
