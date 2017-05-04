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
/* INCLUDE FILES :: this project */
/***********************************/
#include <AbstractState.h>
#include <APStream.h>
#include <Value.h>
#include <CallGraph.h>
#include <Function.h>
#include <Contract.h>
#include <ChaoticExecution.h>

bool Debug;
llvm::cl::opt<bool, true> DebugOpt ("d", llvm::cl::desc("Enable additional debug output"), llvm::cl::location(Debug));

unsigned UpdateCountMax;
llvm::cl::opt<unsigned, true> UpdateCountMaxOpt ("update-count-max",
		llvm::cl::location(UpdateCountMax),
		llvm::cl::init(10),
		llvm::cl::desc("Maximum number of times to update a basic block. 0 to disable. (10)"));

unsigned WideningThreshold;
llvm::cl::opt<unsigned, true> WideningThresholdOpt ("widening-threshold",
		llvm::cl::desc("Widening threshold. (11)"),
		llvm::cl::location(WideningThreshold),
		llvm::cl::init(11));

llvm::cl::opt<std::string> SingleFunction("run-on-single-function",
		llvm::cl::init(""),
		llvm::cl::desc("Run on the specified function. '' for all (default)"));

/**************************/
/* NAMESPACE :: anonymous */
/**************************/
namespace
{
	template <class T>
	class CallOnScopeEnd {
		T m_t;
	public:
		CallOnScopeEnd(T t) : m_t(t) {}
		~CallOnScopeEnd() { m_t(); }
	};

	template <class T>
	CallOnScopeEnd<T> callOnScopeEnd(const T t) {
		return CallOnScopeEnd<T>(t);
	}

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
	class Apron : public llvm::FunctionPass {
	private:
		//map<llvm::BasicBlock *, std::string> basicBlockNames;
		int blockCount;
	public:
		static char ID;
		/* OREN ISH SHALOM removed : Apron() : blockCount(0), llvm::FunctionPass(ID) {} */
		Apron() : blockCount(0), llvm::FunctionPass(ID) {}

        virtual bool runOnSCC(llvm::CallGraphSCC &SCC)
        {
		for (llvm::CallGraphNode *CGN : SCC) {
			if (llvm::Function *F = CGN->getFunction()) {
				runOnFunction(*F);
			}
		}
		return false;
	}

	virtual bool runOnFunction(llvm::Function & F) {
		if (F.isDeclaration()) {
			return false;
		}
		if (!SingleFunction.empty()) {
			if (SingleFunction != F.getName().str()) {
				return false;
			}
		}
		if (Debug) {
			llvm::errs() << "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n";
			llvm::errs() << "Apron: Function: " << F.getName() << "\n";
		}
		// Analyze
		ValueFactory * factory = ValueFactory::getInstance();
		auto deleteCreatedLLVMValues = callOnScopeEnd(ValueFactory::deleteCreatedInstances);
		FunctionManager & functionManager = FunctionManager::getInstance();
		Function * function = functionManager.getFunction(&F);
		CallGraph funcCallGraph(function);
		ChaoticExecution chaoticExecution(funcCallGraph);
		chaoticExecution.execute();
		// Print
		if (Debug) {
			chaoticExecution.print();
		}

		// Get 'return' instruction
		if (Debug) {
			ap_manager_t * manager = apron_manager;
			llvm::errs() << "Error states:\n";
			std::map<std::string, ApronAbstractState> errorStates = function->generateErrorStates();
			for (auto & state : errorStates) {
				llvm::errs() << "// Error state for " << state.first << ":\n";
				llvm::errs() << state.second;
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
		abs_path_filename_builder << "/tmp/llvm_apron_pass/" << F.getName() << ".txt";

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
		fl << F.getName() << " = [ " << *interval->inf << " " << *interval->sup << " ]\n";
		fl.close();

		std::string contract_path_filename;
		llvm::raw_string_ostream contract_path_filename_builder(contract_path_filename);
		contract_path_filename_builder << "/tmp/llvm_apron_pass/" << F.getName() << ".contract.c";
		llvm::raw_fd_ostream fl2(contract_path_filename_builder.str().c_str(), EC);
		function->getReturnAbstractState().m_apronAbstractState.renameVarsForC();
		fl2 << contract(function);
		fl2.close();
		return false;
	}
	};
}

char Apron::ID = 0;
static llvm::RegisterPass<Apron> _X(
		"apron", "Numerical analysis with Apron", false, false);

