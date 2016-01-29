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
	class Value {
	protected:
		static std::map<llvm::Value *, Value *> values;
		static int values_index;
		ap_manager_t * ap_manager;
		ap_abstract1_t m_value;
		std::string m_name;
		llvm::Value * m_llvm_value;
		Value() {}

		std::string llvm_value_name(llvm::Value * value) {
			if (value->hasName()) {
				return value->getName().str();
			}
			if (llvm::isa<llvm::ConstantInt>(value)) {
				llvm::ConstantInt & constant = llvm::cast<llvm::ConstantInt>(*value);
				return constant.getValue().toString(10, true);
			}
			std::ostringstream oss;
			oss << "%" << values_index++;
			return oss.str();
		}

		Value(llvm::Value * value) :
				m_llvm_value(value),
				m_name(llvm_value_name(value))
			{}
		ap_manager_t * getManager() {
			return NULL;
		}
		bool is_eq(ap_abstract1_t & value) {
			return ap_abstract1_is_eq(getManager(),
					&m_value, &value);

		}
	public:
		static Value * get_value(llvm::Value * value) {
			std::map<llvm::Value *, Value*>::iterator it;
			it = values.find(value);
			if (it != values.end()) {
				return it->second;
			}
			Value * result = new Value(value);
			values.insert(std::pair<llvm::Value *, Value*>(
					value, result));
			return result;

		}
		virtual const std::string & get_name() const {
			return m_name;
		}
		virtual std::string to_string() const {
			std::ostringstream oss;
			if (llvm::isa<llvm::ReturnInst>(m_llvm_value)) {
				oss << "Return (" <<
						to_string_as_unnamed_operand()
						<< ")";
			} else {
				oss << get_name() << " <- " <<
						to_string_as_unnamed_operand();
			}
			return oss.str();
		}
		virtual std::string get_constant_value() const {
			std::ostringstream oss;
			if (llvm::isa<llvm::ConstantInt>(m_llvm_value)) {
				llvm::ConstantInt & int_value =
						llvm::cast<llvm::ConstantInt>(
								*m_llvm_value);
				const llvm::APInt & apint = int_value.getValue();
				oss << apint.toString(10, true);
			} else if (llvm::isa<llvm::ConstantFP>(m_llvm_value)) {
				llvm::ConstantFP & fp_value =
						llvm::cast<llvm::ConstantFP>(
								*m_llvm_value);
				const llvm::APFloat & apfloat = fp_value.getValueAPF();
				llvm::SmallVector<char,10> str;
				apfloat.toString(str);
				for (auto it = str.begin(); it != str.end(); it++) {
					oss << *it;
				}
			} else {
				std::cerr << "Unknown constant!!!" << std::endl;
			}
			return oss.str();
		}

		virtual std::string get_operation_symbol() const {
			if (!llvm::isa<llvm::BinaryOperator>(*m_llvm_value)) {
				return " ??? ";
			}
			llvm::BinaryOperator & op =
					llvm::cast<llvm::BinaryOperator>(*m_llvm_value);
			switch (op.getOpcode()) {
				case llvm::BinaryOperator::Add:
				case llvm::BinaryOperator::FAdd:
					return " + ";
				case llvm::BinaryOperator::Sub:
				case llvm::BinaryOperator::FSub:
					return " - ";
				case llvm::BinaryOperator::Mul:
				case llvm::BinaryOperator::FMul:
					return " * ";
				case llvm::BinaryOperator::UDiv:
				case llvm::BinaryOperator::SDiv:
				case llvm::BinaryOperator::FDiv:
					return " / ";
				case llvm::BinaryOperator::URem:
				case llvm::BinaryOperator::SRem:
				case llvm::BinaryOperator::FRem:
					return " % ";
				default:
					return " !!! ";
			}
		}

		virtual std::string to_string_as_unnamed_operand() const {
			std::ostringstream oss;
			if (llvm::isa<llvm::ReturnInst>(m_llvm_value)) {
				llvm::ReturnInst & returnInst =
						llvm::cast<llvm::ReturnInst>(*m_llvm_value);
				llvm::Value * llvm_value = returnInst.getReturnValue();
				if (llvm_value) {
					Value * value = Value::get_value(llvm_value);
					return value->to_string_as_operand();
				} else {
					return "(null)";
				}
			} else if (llvm::isa<llvm::Constant>(m_llvm_value)) {
				oss << get_constant_value();
			} else if (llvm::isa<llvm::User>(m_llvm_value)) {
				llvm::User & user = llvm::cast<llvm::User>(*m_llvm_value);
				llvm::BinaryOperator::op_iterator it;
				std::string op_symbol = get_operation_symbol();
				bool is_first = true;
				for (it = user.op_begin(); it != user.op_end(); it++) {
					if (!is_first) {
						oss << get_operation_symbol();
					}
					is_first = false;
					llvm::Value * llvm_operand = it->get();
					Value * operand = Value::get_value(llvm_operand);
					oss << operand->to_string_as_operand();
				}
			} else {
				std::cerr << "Unknown operand" << std::endl;
			}
			return oss.str();
		}

		virtual std::string to_string_as_operand() const {
			if (m_llvm_value->hasName()) {
				return m_llvm_value->getName().str();
			}
			return to_string_as_unnamed_operand();
		}

		virtual bool join(Value & value) {
			ap_abstract1_t prev = m_value;
			m_value = ap_abstract1_join(getManager(), false,
					&m_value, &(value.m_value));
			return is_eq(prev);
		}
		virtual bool meet(Value & value) {
			ap_abstract1_t prev = m_value;
			m_value = ap_abstract1_meet(getManager(), false,
					&m_value, &(value.m_value));
			return is_eq(prev);
		}
		virtual bool isTop() {
			return ap_abstract1_is_top(getManager(), &m_value);
		}
		virtual bool isBottom() {
			return ap_abstract1_is_bottom(getManager(), &m_value);
		}
		virtual bool operator==(Value & value) {
			return is_eq(value.m_value);
		}
	};
	std::map<llvm::Value *, Value *> Value::values;
	int Value::values_index = 0;

#if 0
	class ConstantPropogationValue : public Value {
	protected:
		int value;
	public:
		ConstantPropogationValue() : value(0), Value() {}
		ConstantPropogationValue(int value) : value(value), Value(false, false) {}
		virtual bool join(const Value & value) {
			if (isTop()) {
				return false;
			}
			const ConstantPropogationValue & cpValue = static_cast<const ConstantPropogationValue&>(value);
			if (cpValue.isBottom()) {
				return false;
			}
			if (cpValue.isTop()) {
				this->_isTop = true;
				this->_isBottom = false;
				return true;
			}
			if (isBottom()) {
				this->value = cpValue.value;
				this->_isBottom = false;
				return true;
			}
			if (cpValue.value == this->value) {
				return false;
			}
			this->_isTop = true;
			return true;
		}

		virtual bool operator==(const Value & value) {
			const ConstantPropogationValue & cpValue = static_cast<const ConstantPropogationValue&>(value);
			return (cpValue.value == this->value) &&
					(cpValue.isTop() == this->isTop()) &&
					(cpValue.isBottom() && this->isBottom());
		}
	};
#endif

	/** Holds a map from variable name to values */
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

		bool processBinaryOperator(llvm::BinaryOperator & op) {
			
			switch (op.getOpcode()) {
			// Standard binary operators...
			case llvm::BinaryOperator::Add:
std::cout << "Operation: " << "add" << std::endl;
break;
			case llvm::BinaryOperator::FAdd:
std::cout << "Operation: " << "fadd" << std::endl;
break;
			case llvm::BinaryOperator::Sub:
std::cout << "Operation: " << "sub" << std::endl;
break;
			case llvm::BinaryOperator::FSub:
std::cout << "Operation: " << "fsub" << std::endl;
break;
			case llvm::BinaryOperator::Mul:
std::cout << "Operation: " << "mul" << std::endl;
break;
			case llvm::BinaryOperator::FMul:
std::cout << "Operation: " << "fmul" << std::endl;
break;
			case llvm::BinaryOperator::UDiv:
std::cout << "Operation: " << "udiv" << std::endl;
break;
			case llvm::BinaryOperator::SDiv:
std::cout << "Operation: " << "sdiv" << std::endl;
break;
			case llvm::BinaryOperator::FDiv:
std::cout << "Operation: " << "fdiv" << std::endl;
break;
			case llvm::BinaryOperator::URem:
std::cout << "Operation: " << "urem" << std::endl;
break;
			case llvm::BinaryOperator::SRem:
std::cout << "Operation: " << "srem" << std::endl;
break;
			case llvm::BinaryOperator::FRem:
std::cout << "Operation: " << "frem" << std::endl;
break;
			default:
				std::cout << "Unhandled operation: "
						<< op.getOpcode() << std::endl;
				break;
			}
			Value * opValue = Value::get_value(&op);
			std::cout << opValue->get_name() << std::endl;
			llvm::BinaryOperator::op_iterator it;
			int idx = 0;
			for (it = op.op_begin(); it != op.op_end(); it++) {
				llvm::Value * llvm_operand = it->get();
				Value * operand = Value::get_value(llvm_operand);
				std::cout << idx++ << ": "
						<< operand->get_name()
						<< std::endl;
			}
			op.dump();
			return false;
		}

		bool processInstruction(llvm::Instruction & inst) {
			const llvm::DebugLoc & debugLoc = inst.getDebugLoc();
			//llvm::DIScope * scope = llvm::cast<llvm::DIScope>(debugLoc.getScope(inst.getContext()));
			llvm::errs() << "\t\tApron: instruction: " << /*scope->getFilename() << ": " << */ debugLoc.getLine() << ": ";
			Value * as_value = Value::get_value(&inst);
			llvm::errs() << as_value->to_string() << "\n";
			return false;
			//llvm::errs() << "\t\tApron: instruction: ";
			//inst.getDebugLoc().print(llvm::errs());
			//llvm::errs() << ": ";
			//inst.print(llvm::errs());
			//llvm::errs() << "\n";
			if (inst.isBinaryOp()) {
				return processBinaryOperator(
						llvm::cast<llvm::BinaryOperator>(inst));
			}
			switch (inst.getOpcode()) {
			case llvm::BinaryOperator::Ret:
std::cout << "Operation: " << "ret" << std::endl;
break;;
			// Terminators
			case llvm::BinaryOperator::Br:
std::cout << "Operation: " << "br" << std::endl;
break;;
			case llvm::BinaryOperator::Switch:
std::cout << "Operation: " << "switch" << std::endl;
break;;
			case llvm::BinaryOperator::IndirectBr:
std::cout << "Operation: " << "indirectbr" << std::endl;
break;;
			case llvm::BinaryOperator::Invoke:
std::cout << "Operation: " << "invoke" << std::endl;
break;;
			case llvm::BinaryOperator::Unreachable:
std::cout << "Operation: " << "unreachable" << std::endl;
break;;
			
			// Standard binary operators...
			case llvm::BinaryOperator::Add:
std::cout << "Operation: " << "add" << std::endl;
break;;
			case llvm::BinaryOperator::FAdd:
std::cout << "Operation: " << "fadd" << std::endl;
break;;
			case llvm::BinaryOperator::Sub:
std::cout << "Operation: " << "sub" << std::endl;
break;;
			case llvm::BinaryOperator::FSub:
std::cout << "Operation: " << "fsub" << std::endl;
break;;
			case llvm::BinaryOperator::Mul:
std::cout << "Operation: " << "mul" << std::endl;
break;;
			case llvm::BinaryOperator::FMul:
std::cout << "Operation: " << "fmul" << std::endl;
break;;
			case llvm::BinaryOperator::UDiv:
std::cout << "Operation: " << "udiv" << std::endl;
break;;
			case llvm::BinaryOperator::SDiv:
std::cout << "Operation: " << "sdiv" << std::endl;
break;;
			case llvm::BinaryOperator::FDiv:
std::cout << "Operation: " << "fdiv" << std::endl;
break;;
			case llvm::BinaryOperator::URem:
std::cout << "Operation: " << "urem" << std::endl;
break;;
			case llvm::BinaryOperator::SRem:
std::cout << "Operation: " << "srem" << std::endl;
break;;
			case llvm::BinaryOperator::FRem:
std::cout << "Operation: " << "frem" << std::endl;
break;;
			
			// Logical operators...
			case llvm::BinaryOperator::And:
std::cout << "Operation: " << "and" << std::endl;
break;;
			case llvm::BinaryOperator::Or :
std::cout << "Operation: " << "or" << std::endl;
break;;
			case llvm::BinaryOperator::Xor:
std::cout << "Operation: " << "xor" << std::endl;
break;;
			
			// Memory instructions...
			case llvm::BinaryOperator::Alloca:
std::cout << "Operation: " << "alloca" << std::endl;
break;;
			case llvm::BinaryOperator::Load:
std::cout << "Operation: " << "load" << std::endl;
break;;
			case llvm::BinaryOperator::Store:
std::cout << "Operation: " << "store" << std::endl;
break;;
			case llvm::BinaryOperator::GetElementPtr:
std::cout << "Operation: " << "getelementptr" << std::endl;
break;;
			
			// Convert instructions...
			case llvm::BinaryOperator::Trunc:
std::cout << "Operation: " << "trunc" << std::endl;
break;;
			case llvm::BinaryOperator::ZExt:
std::cout << "Operation: " << "zext" << std::endl;
break;;
			case llvm::BinaryOperator::SExt:
std::cout << "Operation: " << "sext" << std::endl;
break;;
			case llvm::BinaryOperator::FPTrunc:
std::cout << "Operation: " << "fptrunc" << std::endl;
break;;
			case llvm::BinaryOperator::FPExt:
std::cout << "Operation: " << "fpext" << std::endl;
break;;
			case llvm::BinaryOperator::FPToUI:
std::cout << "Operation: " << "fptoui" << std::endl;
break;;
			case llvm::BinaryOperator::FPToSI:
std::cout << "Operation: " << "fptosi" << std::endl;
break;;
			case llvm::BinaryOperator::UIToFP:
std::cout << "Operation: " << "uitofp" << std::endl;
break;;
			case llvm::BinaryOperator::SIToFP:
std::cout << "Operation: " << "sitofp" << std::endl;
break;;
			case llvm::BinaryOperator::IntToPtr:
std::cout << "Operation: " << "inttoptr" << std::endl;
break;;
			case llvm::BinaryOperator::PtrToInt:
std::cout << "Operation: " << "ptrtoint" << std::endl;
break;;
			case llvm::BinaryOperator::BitCast:
std::cout << "Operation: " << "bitcast" << std::endl;
break;;
			
			// Other instructions...
			case llvm::BinaryOperator::ICmp:
std::cout << "Operation: " << "icmp" << std::endl;
break;;
			case llvm::BinaryOperator::FCmp:
std::cout << "Operation: " << "fcmp" << std::endl;
break;;
			case llvm::BinaryOperator::PHI:
std::cout << "Operation: " << "phi" << std::endl;
break;;
			case llvm::BinaryOperator::Select:
std::cout << "Operation: " << "select" << std::endl;
break;;
			case llvm::BinaryOperator::Call:
std::cout << "Operation: " << "call" << std::endl;
break;;
			case llvm::BinaryOperator::Shl:
std::cout << "Operation: " << "shl" << std::endl;
break;;
			case llvm::BinaryOperator::LShr:
std::cout << "Operation: " << "lshr" << std::endl;
break;;
			case llvm::BinaryOperator::AShr:
std::cout << "Operation: " << "ashr" << std::endl;
break;;
			case llvm::BinaryOperator::VAArg:
std::cout << "Operation: " << "va_arg" << std::endl;
break;;
			case llvm::BinaryOperator::ExtractElement:
std::cout << "Operation: " << "extractelement" << std::endl;
break;;
			case llvm::BinaryOperator::InsertElement:
std::cout << "Operation: " << "insertelement" << std::endl;
break;;
			case llvm::BinaryOperator::ShuffleVector:
std::cout << "Operation: " << "shufflevector" << std::endl;
break;;
			case llvm::BinaryOperator::ExtractValue:
std::cout << "Operation: " << "extractvalue" << std::endl;
break;;
			case llvm::BinaryOperator::InsertValue:
std::cout << "Operation: " << "insertvalue" << std::endl;
break;;
			
			default:
std::cout << "Operation: " << "<Invalid operator> " << std::endl;
break;;
			}

			return false;
		}
		/** Process the block. Return true if the block's context is
		 *  modified.
		 */
		bool processBlock(BasicBlock * block) {
			std::cout << "Processing block " <<
					block->getName() << std::endl;
			llvm::BasicBlock * bb = block->getLLVMBasicBlock();
			llvm::BasicBlock::iterator it;
			for (it = bb->begin(); it != bb->end(); it ++) {
				llvm::Instruction & inst = *it;
				processInstruction(inst);
			}
			return false;
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
					callGraph.populateWithSuccessors(worklist, block);
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
			llvm::errs() << "Apron: Function: ";
			llvm::errs().write_escaped(F.getName()) << '\n';
			llvm::BasicBlock * first =  &F.getEntryBlock();
			CallGraph funcCallGraph(F.getName().str(), BasicBlock::getBasicBlock(first));
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
static llvm::RegisterPass<Apron> X("apron", "Numerical analysis with Apron", false, false);

