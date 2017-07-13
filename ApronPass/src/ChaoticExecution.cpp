#include <unordered_set>
#include <list>

#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/depth_first_search.hpp>
#include <llvm/IR/Function.h>

#include <BasicBlock.h>
#include <CallGraph.h>
#include <ChaoticExecution.h>

extern unsigned UpdateCountMax;
extern unsigned WideningThreshold;

class VertexProperty;

typedef boost::adjacency_list < boost::listS, boost::listS, boost::bidirectionalS, VertexProperty> Graph;
//typedef boost::adjacency_list < boost::listS, boost::listS, boost::bidirectionalS, boost::no_property, boost::no_property, GraphProperty> Graph;
typedef Graph::vertex_descriptor Vertex;
typedef Graph::edge_descriptor Edge;
typedef std::map<Vertex, int> VertexIndexMap;

struct VertexProperty {
	BasicBlock * basicBlock = 0;
	Graph * region = 0;
	Vertex vertex = 0;
};

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

template <typename T>
struct BGLIterableClass {
	T first;
	T last;
	BGLIterableClass(std::pair<T,T> bgl_iterator) : first(bgl_iterator.first),
			last(bgl_iterator.second) {}
	T begin() {return first; }
	T end() {return last; }
};

template <typename T>
BGLIterableClass<T> BGLIterable(std::pair<T,T> bgl_iterator) {
	return BGLIterableClass<T>(bgl_iterator);
}

class Strategy {
public:
	CallGraph * m_callGraph = 0;
	CallGraph & callGraph() { return *m_callGraph; }
	virtual void execute() = 0;
};

class BFSStrategy : public Strategy {
	virtual void execute() {
		abort();
	}
};

class DFSStrategy : public Strategy {
	virtual void execute() {
		abort();
	}
};

class WTOStrategy : public Strategy {
	virtual std::map<BasicBlock*, int> indexBasicBlocks() {
		BasicBlockManager & factory = BasicBlockManager::getInstance();
		std::map<BasicBlock *, int> indexes;
		int runningIndex = 0;
		Function * function = callGraph().m_function;
		llvm::Function * llvmFunction = function->getLLVMFunction();
		for (llvm::BasicBlock & llvmbb : *llvmFunction) {
			BasicBlock * bb = factory.getBasicBlock(&llvmbb);
			indexes[bb] = runningIndex++;
		}
		return indexes;
	}

	virtual std::multimap<int,int> buildEdges(std::map<BasicBlock*,int> & indexes) {
		std::multimap<int,int> edges;
		for (std::pair<BasicBlock *, BasicBlock *> edge : callGraph().m_nexts) {
			int srcIndex = indexes[edge.first];
			int destIndex = indexes[edge.second];
			edges.insert(std::make_pair(srcIndex, destIndex));
		}
		return edges;
	}
	
	virtual void execute() {
		Graph g = buildGraph();
		llvm::errs() << "Original graph:\n";
		printToDot(g);
		reduce(g);
		llvm::errs() << "Reduced graph:\n";
		printToDot(g);
		//analyze(g);
	}

	virtual Graph buildGraph() {
		Graph g;
		BasicBlockManager & factory = BasicBlockManager::getInstance();
		Function * function = callGraph().m_function;
		llvm::Function * llvmFunction = function->getLLVMFunction();
		std::map<BasicBlock*, Vertex> bbVertexMap;
		for (llvm::BasicBlock & llvmbb : *llvmFunction) {
			BasicBlock * bb = factory.getBasicBlock(&llvmbb);
			Vertex v = boost::add_vertex(g);
			g[v].basicBlock = bb;
			bbVertexMap[bb] = v;
		}
		
		for (std::pair<BasicBlock *, BasicBlock*> edge : callGraph().m_nexts) {
			Vertex v0 = bbVertexMap[edge.first];
			Vertex v1 = bbVertexMap[edge.second];
			boost::add_edge(v0, v1, g);
		}
		return g;
	}

	virtual void reduce(Graph & g) {
		while (true) {
			std::list<Edge> backEdges = getBackEdges(g);
			if (backEdges.empty()) {
				llvm::errs() << "Debug: no more backedges\n";
				return;
			}
			Edge & backEdge = backEdges.front();
			Vertex source = boost::source(backEdge, g);
			Vertex target = boost::target(backEdge, g);
			BasicBlock * sourcebb = g[source].basicBlock;
			BasicBlock * targetbb = g[target].basicBlock;
			llvm::errs() << "Debug: Reducing backedge: " << sourcebb->getName() <<
					" -> " << targetbb->getName() << "\n";
			reduceLoop(backEdge, g);
		}
	}

	virtual std::list<Edge> getBackEdges(Graph & g) {
		std::list<Edge> backEdges;
		DiscoverLoopsVisitor visitor(callGraph(), backEdges);
		VertexIndexMap indexmap;
		int index = 0;
		for (Vertex v : BGLIterable(boost::vertices(g))) {
			indexmap[v] = index++;
		}
		boost::depth_first_search(g, boost::visitor(visitor).vertex_index_map(boost::associative_property_map<VertexIndexMap>(indexmap)));
		llvm::errs() << "Found this many back edges: " << backEdges.size() << "\n";
		return backEdges;
	}

	struct DiscoverLoopsVisitor : public boost::default_dfs_visitor {
		std::list<Edge> & backEdges;
		CallGraph & callGraph;
		DiscoverLoopsVisitor(CallGraph & callGraph, std::list<Edge> & backEdges) :
				boost::default_dfs_visitor(),
				callGraph(callGraph),
				backEdges(backEdges) {}

		template <typename Edge, typename Graph>
		void verifyHeadDominatesTailForBackEdge(Edge & edge, Graph & g) {
			// Verify head dominates tail:
			Vertex tail = boost::source(edge, g);
			Vertex head = boost::target(edge, g);
			BasicBlock * tailbb = g[tail].basicBlock;
			BasicBlock * headbb = g[head].basicBlock;
			if (!callGraph.isDominates(headbb, tailbb)) {
				llvm::errs() << "Warning: Back edge to non-dominating node: Edge: "
						<< tailbb->getName() << " -> " << headbb->getName() << "\n";
			}
		}

		template <typename Edge, typename Graph>
		void back_edge(Edge edge, Graph & g) {
			backEdges.push_back(edge);
			verifyHeadDominatesTailForBackEdge(edge, g);
		}
	};

	virtual void reduceLoop(Edge & backEdge, Graph & g) {
		std::map<Vertex, Vertex> reversegVertexMapping;
		Graph reverseg = reverse(g, reversegVertexMapping);
		Vertex origtail = boost::source(backEdge, g);
		Vertex orighead = boost::target(backEdge, g);
		Vertex tail = reversegVertexMapping[origtail];
		Vertex head = reversegVertexMapping[orighead];
		std::set<Vertex> loopMembers;
		LoopMembersVisitor<Graph> visitor(loopMembers, head, tail);
		VertexIndexMap indexmap;
		int index = 0;
		for (Vertex v : BGLIterable(boost::vertices(reverseg))) {
			indexmap[v] = index++;
		}
		boost::depth_first_search(reverseg, boost::visitor(visitor).root_vertex(tail).vertex_index_map(boost::associative_property_map<VertexIndexMap>(indexmap)));

		std::set<Vertex> revIncomingVertices = getIncomingVertices(reverseg, loopMembers);
		std::set<Vertex> targetVertices;
		for (Vertex v : revIncomingVertices) {
			Vertex u = reverseg[v].vertex;
			targetVertices.insert(u);
		}

		std::set<Vertex> sourceVertices;
		for (Edge edge : BGLIterable(boost::in_edges(orighead, g))) {
			sourceVertices.insert(boost::source(edge, g));
		}

		Vertex regionVertex = boost::add_vertex(g);
		Graph * graphp = new Graph();
		g[regionVertex].region = graphp;
		Graph & region = *graphp;

		for (Vertex member : loopMembers) {
			Vertex vertex = boost::add_vertex(region);
			Vertex origMember = reverseg[member].vertex;
			region[vertex] = g[origMember];
			boost::clear_vertex(origMember, g);
			llvm::errs() << "Removing vertex: " << g[member].basicBlock->getName() << "\n";
			boost::remove_vertex(member, g);
		}

		for (Vertex target : targetVertices) {
			boost::add_edge(regionVertex, target, g);
		}

		for (Vertex source : sourceVertices) {
			boost::add_edge(source, regionVertex, g);
		}

		reduce(region);
	}

	//virtual std::set<Vertex> getLoopMembers(Edge & backEdge, Graph & g) {
	//}

	std::set<Vertex> getIncomingVertices(Graph & g, std::set<Vertex> & loopMembers) {
		std::set<Vertex> result;
		for (Vertex v : loopMembers) {
			for (Vertex u : BGLIterable(boost::inv_adjacent_vertices(v, g))) {
				if (loopMembers.count(u) == 0) {
					result.insert(u);
				}
			}
		}
		return result;
	}

	std::set<Vertex> getOutgoingVertices(Graph & g, std::set<Vertex> & loopMembers) {
		std::set<Vertex> result;
		for (Vertex v : loopMembers) {
			for (Vertex u : BGLIterable(boost::adjacent_vertices(v, g))) {
				if (loopMembers.count(u) == 0) {
					result.insert(u);
				}
			}
		}
		return result;
	}

	template<typename Graph>
	struct LoopMembersVisitor : boost::default_dfs_visitor {
		typedef typename Graph::vertex_descriptor Vertex;
		typedef typename Graph::edge_descriptor Edge;

		std::set<Vertex> & loopMembers;
		Vertex tail;
		Vertex head;
		bool inLoop = true;
		bool finished = false;
		LoopMembersVisitor(std::set<Vertex> & loopMembers, Vertex head, Vertex tail) : loopMembers(loopMembers), head(head), tail(tail) {}

		template <typename Vertex, typename Graph_>
		void start_vertex(Vertex v, Graph_ & g) {
			if (finished) {
				return;
			}
			if (v != tail) {
				llvm::errs() << "Warning: LoopMembersVisitor::start_vertex with non-tail: " << g[v].basicBlock->getName() << "\n";
			}
		}

		template <typename Vertex, typename Graph_>
		void discover_vertex(Vertex v, Graph_ & g) {
			if (finished) {
				return;
			}
			if (inLoop) {
				llvm::errs() << "Discovered loop member: " <<
						g[v].basicBlock->getName() << "\n";
				loopMembers.insert(v);
			}
			if (v == head) {
				inLoop = false;
			}
		}

		template <typename Vertex, typename Graph_>
		void finish_vertex(Vertex v, Graph_ & g) {
			if (v == tail) {
				finished = true;
			}
			if (finished) {
				return;
			}
			if (inLoop) {
				return;
			}
			if (v == head) {
				inLoop = true;
			}
		}
	};

	virtual Graph reverse(Graph & orig, std::map<Vertex, Vertex> & mapping) {
		// NOTE: g is already the copy
		Graph g;
		for (Vertex v : BGLIterable(boost::vertices(orig))) {
			Vertex newv = boost::add_vertex(g);
			g[newv] = orig[v];
			g[newv].vertex = v;
			mapping[v] = newv;
		}

		std::list<std::pair<Vertex, Vertex> > edges;
		for (Edge edge : BGLIterable(boost::edges(orig))) {
			Vertex origsrc = boost::source(edge, orig);
			Vertex source = mapping[origsrc];
			if (source == 0) {
				VertexProperty & vprops = orig[origsrc];
				llvm::errs() << "Failed to find reverse mapping for: " << vprops.basicBlock->getName() << "\n";
				abort();
			}
			Vertex origtgt = boost::target(edge, orig);
			Vertex target = mapping[origtgt];
			if (target == 0) {
				VertexProperty & vprops = orig[origtgt];
				llvm::errs() << "Failed to find reverse mapping for: " << vprops.basicBlock->getName() << "\n";
				abort();
			}
			edges.push_back(std::make_pair(target, source));
		}
		for (std::pair<Vertex, Vertex> & edge : edges) {
			boost::add_edge(edge.first, edge.second, g);
		}
		return g;
	}

	virtual void printToDot(Graph & g) {
		llvm::errs() << "digraph G {\n";
		printToDotBody(g);
		llvm::errs() << "}\n";
	}

	void printToDotBody(Graph & g) {
		for (Vertex vertex : BGLIterable(boost::vertices(g))) {
			if (g[vertex].basicBlock) {
				llvm::errs() << "n_" << vertex << " [label=\"" <<
						g[vertex].basicBlock->getName() << "\"];\n";
			} else {
				llvm::errs() << "subgraph cluster_n" << vertex << " {\n";
				Graph * pgraph = (Graph*)g[vertex].region;
				printToDotBody(*pgraph);
				llvm::errs() << "}\n";
			}
		}

		for (Edge edge : BGLIterable(boost::edges(g))) {
			Vertex source = boost::source(edge, g);
			if (g[source].basicBlock) {
				llvm::errs() << "n_" << source;
			} else {
				llvm::errs() << "cluster_n" << source;
			}
			llvm::errs() << " -> ";
			Vertex target = boost::target(edge, g);
			if (g[target].basicBlock) {
				llvm::errs() << "n_" << target;
			} else {
				llvm::errs() << "cluster_n" << target;
			}
			llvm::errs() << ";\n";
		}
	}
};

Strategy * strategyFactory(CallGraph & callGraph, ChaoticExecution::StrategySelector a_strategy) {
	Strategy * strategy;
	switch (a_strategy) {
	case ChaoticExecution::ChaoticExecutionStrategy_BFS:
		strategy = new BFSStrategy();
		break;
	case ChaoticExecution::ChaoticExecutionStrategy_DFS:
		strategy = new DFSStrategy();
		break;
	case ChaoticExecution::ChaoticExecutionStrategy_WTO:
		strategy = new WTOStrategy();
		break;
	}
	strategy->m_callGraph = &callGraph;
	return strategy;
}

ChaoticExecution::ChaoticExecution(CallGraph & callGraph, ChaoticExecution::StrategySelector strategy) :
		callGraph(callGraph), m_strategy(strategyFactory(callGraph, strategy)) {
}

void ChaoticExecution::execute() {
	m_strategy->execute();

/*
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
		llvm::errs() << "Populating successors: " << block->getName() << "\n";
		populateWithSuccessors(worklist, block, state);
		llvm::errs() << "Update block: " << block->getName() << "\n";
	}
*/
}


void ChaoticExecution::print() {
/*
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
	*/
}
