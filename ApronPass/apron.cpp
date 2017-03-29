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
#include <ap_ppl.h>

#include <Value.h>
#include <CallGraph.h>

namespace {
	llvm::raw_ostream & operator<<(llvm::raw_ostream & ro, ap_scalar_t & scalar) {
		char * buffer;
		size_t size;
		FILE * bufferfp = open_memstream(&buffer, &size);
		ap_scalar_fprint(bufferfp, &scalar);
		fclose(bufferfp);
		ro << buffer;
		return ro;
	}
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
	public:
		ChaoticExecution(CallGraph & callGraph) :
				callGraph(callGraph) {
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
		
		void print() {
			//llvm::errs() << "Apron: Library " <<
					//BasicBlockManager::getInstance().m_manager->library <<
					//", version " <<
					//BasicBlockManager::getInstance().m_manager->version << "\n";
			std::set<BasicBlock *>::iterator it;
			for (it = seen.begin(); it != seen.end(); it++) {
				llvm::errs() << (*it)->toString() << "\n";
			}
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
			//llvm::errs() << "\t\tApron: instruction: " << inst.getDebugLoc().getLine() << ": ";
			//inst.print(llvm::errs());
			//llvm::errs() << "\n";
		}

		void runOnBasicBlock(llvm::BasicBlock & bb) {
			//llvm::errs() << "\tApron: Basic block: " << bb.getName() << "\n";
			//llvm::BasicBlock::iterator it;
			//for (it = bb.begin(); it != bb.end(); it ++) {
				//llvm::Instruction & inst = *it;
				//runOnInstruction(inst);
			//}
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

		virtual llvm::ReturnInst * getReturnInstruction(llvm::Function &F) {
			for (auto bbit = F.begin(), bbie = F.end(); bbit != bbie; bbit++) {
				llvm::BasicBlock & bb = *bbit;
				for (auto iit = bb.begin(), iie = bb.end(); iit != iie; iit++) {
					llvm::Instruction & inst = *iit;
					if (llvm::isa<llvm::ReturnInst>(inst)) {
						llvm::ReturnInst & result = llvm::cast<llvm::ReturnInst>(inst);
						return &result;
					}
				}
			}
			return NULL;
		}

		virtual bool runOnFunction(llvm::Function &F) {
			if (F.getName().equals("main")) {
				return false; /* Skip */
			}
			// llvm::errs() << "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n";
			// llvm::errs() << "Apron: Function: ";
			// llvm::errs().write_escaped(F.getName()) << '\n';
			llvm::BasicBlock * llvmfirst =  &F.getEntryBlock();
			BasicBlock * first = BasicBlockManager::getInstance().getBasicBlock(
					llvmfirst);
			ap_environment_t * ap_environment =
					ap_environment_alloc_empty();
			first->setEnvironment(ap_environment);
			CallGraph funcCallGraph(F.getName().str(), first);
			// funcCallGraph.printAsDot();
			ChaoticExecution chaoticExecution(funcCallGraph);
			chaoticExecution.execute();
			// Get 'return' instruction
			llvm::ReturnInst * returnInst = getReturnInstruction(F);
			if (!returnInst) {
				llvm::errs() << F.getName() << " " << "-inf" << " " << "inf" << "\n";
				return false;
			}
			// get temporary
			llvm::Value * llvmValue = returnInst->getReturnValue();
			if (!llvmValue) {
				llvm::errs() << F.getName() << " " << "-inf" << " " << "inf" << "\n";
				return false;
			}
			ValueFactory * factory = ValueFactory::getInstance();
			Value * val = factory->getValue(llvmValue);
			if (!val) {
				llvm::errs() << F.getName() << " " << "-inf" << " " << "inf" << "\n";
				return false;
			}
			// get temporary's abstract value
			llvm::BasicBlock * llvmlast = returnInst->getParent();
			BasicBlock * last = BasicBlockManager::getInstance().getBasicBlock(
					llvmlast);
			ap_interval_t * interval = last->getVariableInterval(val);
			// print it
			llvm::errs() << F.getName() << " " << *interval->inf << " " << *interval->sup << "\n";

			// chaoticExecution.print();
			// llvm::errs() << "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n";
			return false;
		}
	};
}

char Apron::ID = 0;
static llvm::RegisterPass<Apron> _X(
		"apron", "Numerical analysis with Apron", false, false);

