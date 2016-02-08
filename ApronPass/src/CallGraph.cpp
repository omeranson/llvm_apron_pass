#include <CallGraph.h>

#include <iostream>
#include <set>

#include <llvm/IR/InstrTypes.h>

CallGraph::CallGraph(std::string name, BasicBlock * root) :
		m_root(root), m_name(name) {
	BasicBlockManager & factory = BasicBlockManager::getInstance();
	std::list<llvm::BasicBlock *> worklist;
	std::set<llvm::BasicBlock *> seen;
	worklist.push_back(m_root->getLLVMBasicBlock());
	while (!worklist.empty()) {
		llvm::BasicBlock * bb = worklist.front();
		BasicBlock * bb1 = factory.getBasicBlock(bb);
		worklist.pop_front();
		const llvm::TerminatorInst *TInst = bb->getTerminator();
		int NSucc = TInst->getNumSuccessors();
		for (unsigned succIdx = 0; succIdx < NSucc; ++succIdx) {
			llvm::BasicBlock * succ = TInst->getSuccessor(succIdx);
			BasicBlock * succBasicBlock = factory.getBasicBlock(succ);
			m_nexts.insert(std::pair<BasicBlock*,BasicBlock*>(
					bb1, succBasicBlock));
			m_prevs.insert(std::pair<BasicBlock*,BasicBlock*>(
					succBasicBlock, bb1));
			if (seen.find(succ) == seen.end()) {
				worklist.push_back(succ);
				seen.insert(succ);
			}
		}
	}
}

BasicBlock * CallGraph::getRoot() {
	return m_root;
}

std::string & CallGraph::getName() {
	return m_name;
}

void CallGraph::populateWithSuccessors(
		std::list<BasicBlock *> & list, BasicBlock * block) {
	std::multimap<BasicBlock *, BasicBlock *>::iterator it;
	std::multimap<BasicBlock *, BasicBlock *>::iterator stop;
	stop = m_nexts.upper_bound(block);
	for (it = m_nexts.lower_bound(block); it != stop; it++) {
		BasicBlock * succ = it->second;
		std::cerr << block->getName() << " -> " << succ->getName() << std::endl;
		bool isSuccModified = succ->join(*block);
		if (isSuccModified) {
			succ->setChanged();
		}
		list.push_back(succ);
	}
}

void CallGraph::populateWithPredecessors(
		std::list<BasicBlock *> & list, BasicBlock * block) {
	std::multimap<BasicBlock *, BasicBlock *>::iterator it;
	std::multimap<BasicBlock *, BasicBlock *>::iterator stop;
	stop = m_prevs.upper_bound(block);
	for (it = m_prevs.lower_bound(block); it != stop; it++) {
		std::cerr << block->getName() << " -> " << it->second->getName() << std::endl;
		list.push_back(it->second);
	}
}

void CallGraph::printAsDot() {
	std::multimap<BasicBlock *, BasicBlock *>::iterator it;
	std::cout << "digraph \"" << getName() << "\" {" << std::endl;
	for (it = m_nexts.begin(); it != m_nexts.end(); it++) {
		std::cout << "\t"
				<< "\"" << it->first->getName() << "\""
				<< " -> "
				<< "\"" << it->second->getName() << "\""
				<< std::endl;
	}
	std::cout << "}" << std::endl;
}

