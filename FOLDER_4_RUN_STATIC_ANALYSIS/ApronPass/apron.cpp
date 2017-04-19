/****************************************************************/
/* OREN ISH SHALOM is a big nudnik that separates INCLUDE files */
/****************************************************************/
/************************/
/* INCLUDE FILES :: stl */
/************************/
#include <list>
#include <set>
#include <map>
#include <string>
#include <iostream>
#include <sstream>

/*************************/
/* INCLUDE FILES :: llvm */
/*************************/
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstrTypes.h>
//#include <llvm/IR/DebugLoc.h>
#include <llvm/DebugInfo.h>
#include <llvm/IR/Constants.h>
#include "llvm/Analysis/CallGraphSCCPass.h"

/**************************/
/* INCLUDE FILES :: apron */
/**************************/
#include <ap_global0.h>
#include <ap_global1.h>
#include <ap_abstract1.h>
#include <box.h>
#include <oct.h>
#include <pk.h>
#include <pkeq.h>
#include <ap_ppl.h>

/***********************************/
/* INCLUDE FILES :: omer's project */
/***********************************/
#include <APStream.h>
#include <Value.h>
#include <CallGraph.h>
#include <Function.h>
#include <Contract.h>

bool Debug;
llvm::cl::opt<bool, true> DebugOpt ("d", llvm::cl::desc("Enable additional debug output"), llvm::cl::location(Debug));

llvm::cl::opt<unsigned> UpdateCountMax ("update-count-max",
		llvm::cl::init(10),
		llvm::cl::desc("Maximum number of times to update a basic block. 0 to disable. (10)"));

/**************************/
/* NAMESPACE :: anonymous */
/**************************/
namespace
{
	/*******************************************************/
	/* OREN ISH SHALOM edited:                             */
	/* Write the summary of each function into a dedicated */
	/* text file with the same name                        */
	/*******************************************************/
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

		void print() {
			llvm::errs() << "Apron: Library " <<
					BasicBlockManager::getInstance().m_manager->library <<
					", version " <<
					BasicBlockManager::getInstance().m_manager->version << "\n";
			callGraph.printAsDot();
			std::set<BasicBlock *>::iterator it;
			for (it = seen.begin(); it != seen.end(); it++) {
				llvm::errs() << (*it)->toString() << "\n";
			}
		}
	};

    /****************************************************/
    /*                                                  */
    /* OREN ISH SHALOM:                                 */
    /*                                                  */
    /* Change the Apron pass to subclass from SCCPass   */
    /* Suppose we have this simple example:             */
    /*                                                  */
    /* int f1(int i)                                    */
    /* {                                                */
    /*     int x = 80;                                  */
    /*     int y = f2(600);                             */
    /*                                                  */
    /*     return x+y;                                  */
    /* }                                                */
    /*                                                  */
    /* And Apron summarized f2 to return [3,40]         */
    /*                                                  */
    /* The once Apron starts to analyze f1, the         */
    /*                                                  */
    /* returned ointerval [3,40] of f2 is ready, and so */
    /*                                                  */
    /* the returned value of f1 should be [83, 120]     */
    /*                                                  */
    /****************************************************/
    /**********************************************************************/
	/* OREN ISH SHALOM removed: class Apron : public llvm::FunctionPass   */
    /**********************************************************************/
	class Apron : public llvm::CallGraphSCCPass {
	private:
		//map<llvm::BasicBlock *, std::string> basicBlockNames;
		int blockCount;
	public:
		static char ID;
		/* OREN ISH SHALOM removed : Apron() : blockCount(0), llvm::FunctionPass(ID) {} */
		Apron() : blockCount(0), llvm::CallGraphSCCPass(ID) {}

        /***************************************************/
        /* OREN ISH SHALOM removed:                        */
        /*                                                 */
        /* virtual bool runOnFunction(llvm::Function &F)   */
        /*                                                 */
        /***************************************************/
        virtual bool runOnSCC(llvm::CallGraphSCC &SCC)
        {
            /********************************************************************/
            /* OREN ISH SHALOM added: extract the current function from the SCC */
            /********************************************************************/
            /***************************************************/
            /* OREN ISH SHALOM remarks: I simply l-o-v-e C++11 */
            /***************************************************/
            for (llvm::CallGraphNode *CGN : SCC)
			{
                /********************************************************************/
                /* OREN ISH SHALOM added: extract the current function from the SCC */
                /********************************************************************/
				if (llvm::Function *F = CGN->getFunction())
				{
			        if (F->getName().equals("main"))
			        {
				        continue;
			        }
				if (F->isDeclaration()) {
					continue;
				}

                    /****************************************************************/
                    /* OREN ISH SHALOM: From here downward, lots of F. to F-> stuff */
                    /****************************************************************/
			if (Debug) {
				llvm::errs() << "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n";
				llvm::errs() << "Apron: Function: ";
				llvm::errs().write_escaped(F->getName()) << '\n';
			}
			// Analyze
			llvm::BasicBlock * llvmfirst =  &F->getEntryBlock();
			BasicBlock * first = BasicBlockManager::getInstance().getBasicBlock(
					llvmfirst);
			ap_environment_t * ap_environment =
					ap_environment_alloc_empty();
			first->setEnvironment(ap_environment);
			CallGraph funcCallGraph(F->getName().str(), first);
			ChaoticExecution chaoticExecution(funcCallGraph);
			chaoticExecution.execute();
			// Print
			if (Debug) {
				chaoticExecution.print();
			}

			// Get 'return' instruction
			FunctionManager & functionManager = FunctionManager::getInstance();
			Function * function = functionManager.getFunction(F);
			if (Debug) {
				ap_manager_t * manager = BasicBlockManager::getInstance().m_manager;
				ap_abstract1_t trimmedAbstract1 = function->trimmedLastASAbstractValue();
				llvm::errs() << "Trimmed AS abstract value: " <<
						std::make_pair(manager,
								&trimmedAbstract1);
				trimmedAbstract1 = function->trimmedLastBBAbstractValue();
				llvm::errs() << "Trimmed BB abstract value: " <<
						std::make_pair(manager,
								&trimmedAbstract1);
				trimmedAbstract1 = function->trimmedLastJoinedAbstractValue();
				llvm::errs() << "Trimmed joined abstract value: " <<
						std::make_pair(manager,
								&trimmedAbstract1);
				llvm::errs() << "Error states:\n";
				std::map<std::string, ap_abstract1_t> errorStates = function->generateErrorStates();
				for (auto & state : errorStates) {
					llvm::errs() << "// Error state for " << state.first << ":\n";
					llvm::errs() << std::make_pair(manager, &state.second);
				}
			}
			llvm::ReturnInst * returnInst = function->getReturnInstruction();
			if (!returnInst) {
				return false;
			}
			// get temporary
			llvm::Value * llvmValue = returnInst->getReturnValue();
			if (!llvmValue) {
				return false;
			}
			ValueFactory * factory = ValueFactory::getInstance();
			Value * val = factory->getValue(llvmValue);
			if (!val) {
				return false;
			}
			// get temporary's abstract value
			llvm::BasicBlock * llvmlast = returnInst->getParent();
			BasicBlock * last = BasicBlockManager::getInstance().getBasicBlock(
					llvmlast);
			ap_interval_t * interval = last->getVariableInterval(val);
                    /*********************************************/
                    /* OREN ISH SHALOM: Print the way I like it! */
                    /*********************************************/
                    std::string abs_path_filename;
                    llvm::raw_string_ostream abs_path_filename_builder(abs_path_filename);
                    abs_path_filename_builder << "/tmp/llvm_apron_pass/" << F->getName() << ".txt";

	                /*********************************************************/
	                /* OREN ISH SHALOM: Write in the human readable format:  */
	                /*                                                       */
	                /* MY_FUNCTION_NAME = [45 200], or for another example:  */
	                /*                                                       */
	                /* MY_FUNCTION_NAME = [17 +00]                           */
	                /*                                                       */
	                /*********************************************************/
		    std::string EC;
		    llvm::raw_fd_ostream fl(abs_path_filename_builder.str().c_str(), EC);
		    fl << F->getName() << " = [ " << *interval->inf << " " << *interval->sup << " ]\n";
		    fl.close();

                    std::string contract_path_filename;
                    llvm::raw_string_ostream contract_path_filename_builder(contract_path_filename);
                    contract_path_filename_builder << "/tmp/llvm_apron_pass/" << F->getName() << ".contract.c";
		    llvm::raw_fd_ostream fl2(contract_path_filename_builder.str().c_str(), EC);
		    fl2 << contract(function);
		    fl2.close();
			        return false;
                }
            }
            return false;
		}
	};
}

char Apron::ID = 0;
static llvm::RegisterPass<Apron> _X(
		"apron", "Numerical analysis with Apron", false, false);

