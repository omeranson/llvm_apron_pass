#include <list>
#include <set>
#include <map>
#include <string>
#include <iostream>
#include <sstream>

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstrTypes.h>
//#include <llvm/IR/DebugLoc.h>
#include <llvm/DebugInfo.h>
#include <llvm/IR/Constants.h>

#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>
#include <box.h>
#include <oct.h>
#include <pk.h>
#include <pkeq.h>

#include <Value.h>

namespace {
	static int basicBlockCount = 0;
	class BasicBlock {
	private:
		static std::map<llvm::BasicBlock *, BasicBlock *> instances;
		llvm::BasicBlock * basicBlock;
		void initialiseBlockName() {
			llvm::Twine iname(++basicBlockCount);
			llvm::Twine name("BasicBlock ");
			name.concat(iname);
			basicBlock->setName(name);
		}

		BasicBlock(llvm::BasicBlock * bb) : basicBlock(bb) {
			if (!basicBlock->hasName()) {
				initialiseBlockName();
			}
		}
	public:
		static BasicBlock * getBasicBlock(llvm::BasicBlock * bb) {
			std::map<llvm::BasicBlock *, BasicBlock *>::iterator it;
			it = instances.find(bb);
			if (it != instances.end()) {
				return it->second;
			}
			BasicBlock * result = new BasicBlock(bb);
			instances.insert(std::pair<llvm::BasicBlock *, BasicBlock*>(bb, result));
			return result;
		}

		llvm::BasicBlock * getLLVMBasicBlock() {
			return basicBlock;
		}
		const std::string getName() {
			return basicBlock->getName();
		}
	};
	std::map<llvm::BasicBlock *, BasicBlock *> BasicBlock::instances;
/*
	class Function {
	private:
		llvm::Function & function;
	public:
		Function(llvm::Function & function) : function(function) {}
		const llvm::Function & getFunction() {
			return function;
		}
		BasicBlock * root;
	}
	*/
	class CallGraph {
	private:
		std::multimap<BasicBlock *, BasicBlock *> nexts;
		BasicBlock * root;
		std::string name;
	public:
		CallGraph(std::string name, BasicBlock * root) : root(root), name(name) {
			std::list<llvm::BasicBlock *> worklist;
			std::set<llvm::BasicBlock *> seen;
			worklist.push_back(root->getLLVMBasicBlock());
			while (!worklist.empty()) {
				llvm::BasicBlock * bb = worklist.front();
				BasicBlock * bb1 = BasicBlock::getBasicBlock(bb);
				worklist.pop_front();
				const llvm::TerminatorInst *TInst = bb->getTerminator();
				int NSucc = TInst->getNumSuccessors();
				for (unsigned succIdx = 0; succIdx < NSucc; ++succIdx) {
					llvm::BasicBlock * succ = TInst->getSuccessor(succIdx);
					nexts.insert(std::pair<BasicBlock*,BasicBlock*>(bb1, BasicBlock::getBasicBlock(succ)));
					if (seen.find(succ) == seen.end()) {
						worklist.push_back(succ);
						seen.insert(succ);
					}
				}
			}
		}

		BasicBlock * getRoot() {
			return root;
		}

		void populateWithSuccessors(std::list<BasicBlock *> & list,
				BasicBlock * block) {
			std::multimap<BasicBlock *, BasicBlock *>::iterator it;
			std::multimap<BasicBlock *, BasicBlock *>::iterator stop;
			stop = nexts.upper_bound(block);
			for (it = nexts.lower_bound(block); it != stop; it++) {
				std::cerr << block->getName() << " -> " << it->second->getName() << std::endl;
				list.push_back(it->second);
			}
		}

		void printAsDot() {
			std::multimap<BasicBlock *, BasicBlock *>::iterator it;
			std::cout << "digraph \"" << name << "\" {" << std::endl;
			for (it = nexts.begin(); it != nexts.end(); it++) {
				std::cout << "\t"
						<< "\"" << it->first->getName() << "\""
						<< " -> "
						<< "\"" << it->second->getName() << "\""
						<< std::endl;
			}
			std::cout << "}" << std::endl;
		}
	};

	/** Holds a (possibly abstract) value.
	 *  Abstract domains to extend this parameter.
	 */

	/** Holds a map from variable name to values */
	/*
	class Context {
	private:
		std::map<std::string, Value*> values;
	public:
		bool setValue(std::string & varName, Value * value) {
			std::map<std::string, Value*>::iterator it = values.find(varName);
			if (it == values.end()) {
				values.insert(std::pair<std::string, Value*>(varName, value));
				return true;
			}
			return it->second->join(*value);
		}
	};
	*/

	class ChaoticExecution {
	private:
		CallGraph & callGraph;
		std::list<BasicBlock *> worklist;
		std::set<BasicBlock *> seen;
		struct ap_manager_t * ap_manager;
	public:
		ChaoticExecution(CallGraph & callGraph) :
				callGraph(callGraph),
				ap_manager(box_manager_alloc())
			{}

		bool processInstruction(llvm::Instruction & inst) {
			const llvm::DebugLoc & debugLoc = inst.getDebugLoc();
			ValueFactory * factory = ValueFactory::getInstance();
			Value * value = factory->getValue(&inst);
			if (value && !value->isSkip()) {
				std::cout << "\t\tApron: instruction: "
						/*<< scope->getFilename()
						<< ": " */
						<< debugLoc.getLine()
						<< ": "
						<< value->toString()
						<< "\n";
				//value->update();
			}
			return false;
		}

		/** Process the block. Return true if the block's context is
		 *  modified.
		 */
		bool processBlock(BasicBlock * block) {
			std::cout << "Processing block " <<
					block->getName() << std::endl;
			bool result = false;
			llvm::BasicBlock * bb = block->getLLVMBasicBlock();
			llvm::BasicBlock::iterator it;
			for (it = bb->begin(); it != bb->end(); it ++) {
				llvm::Instruction & inst = *it;
				result |= processInstruction(inst);
			}
			return result;
		}

		bool isSeen(BasicBlock * block) {
			return !(seen.find(block) == seen.end());
		}

		void see(BasicBlock * block) {
			seen.insert(block);
		}

		void execute() {
			worklist.clear();
			worklist.push_front(callGraph.getRoot());
			while (!worklist.empty()) {
				BasicBlock * block = worklist.front();
				worklist.pop_front();
				bool wasSeen = isSeen(block);
				see(block);
				bool isModified = processBlock(block);
				if (!wasSeen || isModified) {
					callGraph.populateWithSuccessors(
							worklist, block);
				}
			}
		}
		
		void print() {
			printf("Apron: Library %s, version %s\n",
					ap_manager->library,
					ap_manager->version);
			

		}
	};


	class Apron : public llvm::FunctionPass {
	private:
		//map<llvm::BasicBlock *, std::string> basicBlockNames;
		int blockCount;
	public:
		static char ID;
		Apron() : blockCount(0), llvm::FunctionPass(ID) {}

		void runOnInstruction(llvm::Instruction & inst) {
			llvm::errs() << "\t\tApron: instruction: " << inst.getDebugLoc().getLine() << ": ";
			inst.print(llvm::errs());
			llvm::errs() << "\n";
		}

		void runOnBasicBlock(llvm::BasicBlock & bb) {
			llvm::errs() << "\tApron: Basic block: " << bb.getName() << "\n";
			llvm::BasicBlock::iterator it;
			for (it = bb.begin(); it != bb.end(); it ++) {
				llvm::Instruction & inst = *it;
				runOnInstruction(inst);
			}
		}

		void setName(llvm::BasicBlock & succ) {
			if (succ.hasName()) {
				return;
			}
			int name = ++blockCount;
			//llvm::Twine twine(name);
			succ.setName(llvm::Twine(name));
		}

		void runOnBasicBlocks(std::list<llvm::BasicBlock *> & bbs) {
			std::set<llvm::BasicBlock *> seen;
			while (!bbs.empty()) {
				llvm::BasicBlock * bb = bbs.front();
				bbs.pop_front();
				const llvm::TerminatorInst *TInst = bb->getTerminator();
				int NSucc = TInst->getNumSuccessors();
				for (unsigned succIdx = 0; succIdx < NSucc; ++succIdx) {
					llvm::BasicBlock * succ = TInst->getSuccessor(succIdx);
					setName(*succ);
					if (seen.find(succ) == seen.end()) {
						bbs.push_back(succ);
						seen.insert(succ);
					}
				}
				runOnBasicBlock(*bb);
			}
		}

		virtual bool runOnFunction(llvm::Function &F) {
			if (F.getName().equals("main")) {
				return false; /* Skip */
			}
			llvm::errs() << "Apron: Function: ";
			llvm::errs().write_escaped(F.getName()) << '\n';
			llvm::BasicBlock * first =  &F.getEntryBlock();
			CallGraph funcCallGraph(F.getName().str(),
					BasicBlock::getBasicBlock(first));
			funcCallGraph.printAsDot();
			ChaoticExecution chaoticExecution(funcCallGraph);
			chaoticExecution.execute();
			chaoticExecution.print();
			//std::list<llvm::BasicBlock *> bbs;
			//bbs.push_front(first);
			//runOnBasicBlocks(bbs);
			return false;
		}
	};
}

char Apron::ID = 0;
static llvm::RegisterPass<Apron> _X(
		"apron", "Numerical analysis with Apron", false, false);

