#include <assert.h>
#include <unordered_set>
#include <list>

#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/depth_first_search.hpp>
#include <llvm/IR/Function.h>

#include <BasicBlock.h>
#include <CallGraph.h>
#include <ChaoticExecution.h>

extern bool Debug;
extern unsigned UpdateCountMax;
extern unsigned WideningThreshold;

class VertexProperty;
class EdgeProperty;

typedef boost::adjacency_list < boost::listS, boost::listS, boost::bidirectionalS, VertexProperty, EdgeProperty> Graph;
//typedef boost::adjacency_list < boost::listS, boost::listS, boost::bidirectionalS, boost::no_property, boost::no_property, GraphProperty> Graph;
typedef Graph::vertex_descriptor Vertex;
typedef Graph::edge_descriptor Edge;
typedef std::map<Vertex, int> VertexIndexMap;
typedef std::map<Vertex, boost::default_color_type> VertexColourMap;

template <typename Graph>
void printToDot(Graph & g);
void analyze(Graph & g);

struct VertexProperty {
	Graph * region = 0;
	Vertex vertex = 0;
	std::string name;
	mutable BasicBlock * basicBlock = 0;
	mutable AbstractState abstractState;
	mutable int joinCount = 0;
};

struct EdgeProperty {
	// If the source vertex is simple, use the source vertex.
	// If the source vertex is a region, use the source vertex from with
	// the region - i.e. the original source vertex for the edge
	Graph * sourceRegion = 0;
	Vertex sourceVertex = 0;
	// If the target vertex is simple, use the target vertex.
	// If the target vertex is a region, use the region's head
	Graph * targetRegion = 0;
	Vertex targetVertex = 0;
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
		initializeRootAbstractState(g);
		reduce(g);
		llvm::errs() << "Reduced graph:\n";
		printToDot(g);
		analyze(g);
		//llvm::errs() << "Analyzed graph:\n";
		//printToDot(g);
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
			g[v].name = bb->getName();
			bbVertexMap[bb] = v;
		}
		
		for (std::pair<BasicBlock *, BasicBlock*> edge : callGraph().m_nexts) {
			Vertex v0 = bbVertexMap[edge.first];
			Vertex v1 = bbVertexMap[edge.second];
			boost::add_edge(v0, v1, g);
		}
		return g;
	}

	virtual void initializeRootAbstractState(Graph & g) {
		BasicBlock * root = callGraph().getRoot();
		std::vector<std::string> userPointers = root->getFunction()->getUserPointers();
		AbstractState state(userPointers);
		root->getAbstractState() = state;
	}

	virtual void reduce(Graph & g) {
		while (true) {
			std::list<Edge> backEdges = getBackEdges(g);
			while (!backEdges.empty()) {
				Edge backEdge = backEdges.front();
				backEdges.pop_front();
				Vertex source = boost::source(backEdge, g);
				Vertex target = boost::target(backEdge, g);
				if (Debug) {
					llvm::errs() << "Debug: Reducing backedge: " << g[source].name <<
							" -> " << g[target].name << "\n";
				}
				if (reduceLoop(backEdge, g)) {
					break;
				}
			}
			if (backEdges.empty()) {
				if (Debug) {
					llvm::errs() << "Debug: no more backedges\n";
				}
				return;
			}
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
			if ((!tailbb) || (!headbb)) {
				// Region. We're good
				return;
			}
			if (!callGraph.isDominates(headbb, tailbb)) {
				llvm::errs() << "Warning: Back edge to non-dominating node: Edge: "
						<< tailbb->getName() << " -> " << headbb->getName() << "\n";
				printToDot(g);
			}
		}

		template <typename Edge, typename Graph>
		void back_edge(Edge edge, Graph & g) {
			backEdges.push_back(edge);
			verifyHeadDominatesTailForBackEdge(edge, g);
		}
	};

	virtual bool reduceLoop(Edge & backEdge, Graph & g) {
		// XXX This function can be improved greatly
		Vertex origtail = boost::source(backEdge, g);
		Vertex orighead = boost::target(backEdge, g);

		// START get loop members
		std::map<Vertex, Vertex> reversegVertexMapping;
		Graph reverseg = reverse(g, reversegVertexMapping);
		Vertex tail = reversegVertexMapping[origtail];
		Vertex head = reversegVertexMapping[orighead];
		boost::clear_out_edges(head, reverseg);
		std::set<Vertex> loopMembersSet;
		LoopMembersVisitor<Graph> visitor(loopMembersSet, head, tail);
		VertexIndexMap indexmap;
		int index = 0;
		for (Vertex v : BGLIterable(boost::vertices(reverseg))) {
			indexmap[v] = index++;
		}
		boost::depth_first_search(reverseg, boost::visitor(visitor).root_vertex(tail).vertex_index_map(boost::associative_property_map<VertexIndexMap>(indexmap)));
		if (loopMembersSet.size() == boost::num_vertices(g)) {
			// Loop is entire region. Reduction doesn't make sense
			return false;
		}
		std::list<Vertex> loopMembers(loopMembersSet.begin(), loopMembersSet.end());
		VertexIndexComparator vertexIndexComparator(indexmap);
		loopMembers.sort(vertexIndexComparator);
		std::list<Vertex> loopMembersOrigGraph;
		for (Vertex member : loopMembers) {
			loopMembersOrigGraph.push_back(reverseg[member].vertex);
		}
		// END get loop members

		std::set<Vertex> revIncomingVertices = getIncomingVertices(reverseg, loopMembersSet);
		std::set<Vertex> targetVertices;
		for (Vertex v : revIncomingVertices) {
			Vertex u = reverseg[v].vertex;
			targetVertices.insert(u);
		}

		std::set<Vertex> sourceVertices;
		for (Edge edge : BGLIterable(boost::in_edges(orighead, g))) {
			sourceVertices.insert(boost::source(edge, g));
		}
		sourceVertices.erase(origtail);

		// Create region
		Graph * graphp = new Graph();
		Graph & region = *graphp;
		std::ostringstream oss;
		oss << "Region " << g[orighead].name << " -> " << g[origtail].name;
		std::string regionName = oss.str();

		std::map<Vertex, Vertex> regionGraphVertexMapping;
		for (Vertex member : loopMembersOrigGraph) {
			Vertex vertex = boost::add_vertex(g[member], region);
			region[vertex].vertex = member;
			regionGraphVertexMapping[member] = vertex;
		}

		for (Vertex member : BGLIterable(boost::vertices(region))) {
			Vertex origMember = region[member].vertex;
			if (origMember == origtail) {
				continue;
			}
			for (Edge e : BGLIterable(boost::out_edges(origMember, g))) {
				Vertex origTarget = boost::target(e, g);
				auto targetit = regionGraphVertexMapping.find(origTarget);
				if (targetit == regionGraphVertexMapping.end()) {
					continue; // Edge to outside of region
				}
				Vertex target = targetit->second;
				boost::add_edge(member, target, g[e], region);
			}
		}
		Vertex regionHead = regionGraphVertexMapping[orighead];
		Vertex regionTail = regionGraphVertexMapping[origtail];
		boost::add_edge(regionTail, regionHead, region);

		// Modification to g starts here!
		Vertex regionVertex = boost::add_vertex(g);
		g[regionVertex].region = graphp;
		g[regionVertex].name = regionName;

		std::set<Vertex> loopMembersOrigGraphSet(loopMembersOrigGraph.begin(), loopMembersOrigGraph.end());
		for (Vertex member : loopMembersOrigGraph) {
			for (Edge e : BGLIterable(boost::out_edges(member, g))) {
				Vertex target = boost::target(e, g);
				if (loopMembersOrigGraphSet.count(target) != 0) {
					continue;
				}
				std::pair<Edge, bool> newedgepair = boost::add_edge(regionVertex, target, g[e], g);
				Edge & newedge = newedgepair.first;
				if (!g[newedge].sourceRegion) {
					g[newedge].sourceRegion = &region;
					g[newedge].sourceVertex = regionGraphVertexMapping[member];
				}
			}
		}

		for (Edge edge : BGLIterable(boost::in_edges(orighead, g))) {
			Vertex source = boost::source(edge, g);
			Vertex target = boost::target(edge, g);
			if (source == origtail) {
				continue;
			}
			std::pair<Edge, bool> newedgepair = boost::add_edge(source, regionVertex, g[edge], g);
			Edge newedge = newedgepair.first;
			if (!g[newedge].targetRegion) {
				g[newedge].targetRegion = &region;
				g[newedge].targetVertex = regionHead;
			}
		}

		for (Vertex member : loopMembersOrigGraph) {
		        boost::clear_vertex(member, g);
			boost::remove_vertex(member, g);
		}

		reduce(region);
		return true;
	}

	struct VertexIndexComparator {
		VertexIndexMap & indexmap;
		VertexIndexComparator(VertexIndexMap & indexmap) : indexmap(indexmap) {}
		bool operator()(Vertex & v, Vertex & u) {
			return (indexmap[v] < indexmap[u]);
		}
	};


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
				llvm::errs() << "Warning: LoopMembersVisitor::start_vertex with non-tail: " << g[v].name << "\n";
			}
		}

		template <typename Vertex, typename Graph_>
		void discover_vertex(Vertex v, Graph_ & g) {
			if (finished) {
				return;
			}
			if (inLoop) {
				loopMembers.insert(v);
			}
			if (v == head) {
				inLoop = false;
			}
		}

		template <typename Vertex, typename Graph_>
		void finish_vertex(Vertex v, Graph_ & g) {
			if (finished) {
				return;
			}
			if (v == tail) {
				finished = true;
			}
			if (inLoop) {
				return;
			}
			if (v == head) {
				inLoop = true;
			}
		}

		//template <typename Edge, typename Graph_>
		//void back_edge(Edge edge, Graph_ & g) {
		//	if ((!inLoop) || (finished)) {
		//		return;
		//	}
		//	llvm::errs() << "Found nested loop?: " <<
		//			g[boost::source(edge, g)].name << " -> " <<
		//			g[boost::target(edge, g)].name << "\n";
		//}
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
				llvm::errs() << "Failed to find reverse mapping for: " << vprops.name << "\n";
				abort();
			}
			Vertex origtgt = boost::target(edge, orig);
			Vertex target = mapping[origtgt];
			if (target == 0) {
				VertexProperty & vprops = orig[origtgt];
				llvm::errs() << "Failed to find reverse mapping for: " << vprops.name << "\n";
				abort();
			}
			edges.push_back(std::make_pair(target, source));
		}
		for (std::pair<Vertex, Vertex> & edge : edges) {
			boost::add_edge(edge.first, edge.second, g);
		}
		return g;
	}

};

struct StaticAnalysisVisitor : boost::default_dfs_visitor {
	VertexColourMap & colourmap;
	StaticAnalysisVisitor(VertexColourMap & colourmap) :
			colourmap(colourmap) {}

	template <typename Vertex, typename Graph_>
	void discover_vertex(Vertex v, Graph_ & g) {
		// basic block update
		// or region update
		if (g[v].basicBlock) {
			llvm::errs() << "Debug: StaticAnalysisVisitor::discover_vertex start simple: " << g[v].name << "\n";
			discover_simple_verex(v, g, g[v].basicBlock);
			llvm::errs() << "Debug: StaticAnalysisVisitor::discover_vertex done simple: " << g[v].name << "\n";
		} else if (g[v].region) {
			llvm::errs() << "Debug: StaticAnalysisVisitor::discover_vertex: start region: " << g[v].name << "\n";
			discover_region_verex(v, g, *g[v].region);
			llvm::errs() << "Debug: StaticAnalysisVisitor::discover_vertex: done region: " << g[v].name << "\n";
		} else {
			llvm::errs() << "Unknown tree vertex that is neither simple nor region: " << g[v].name << "\n";
		}
	}

	template <typename Vertex, typename Graph_>
	void discover_simple_verex(Vertex v, Graph_ & g, BasicBlock * block) {
		g[v].abstractState = block->getAbstractState();
		block->update(g[v].abstractState);
	}

	template <typename Vertex, typename Graph_>
	void discover_region_verex(Vertex v, Graph_ & g, Graph & region) {
		analyze(region);
	}

	template <typename Vertex, typename Graph_>
	void mark_for_revisit(Vertex v, Graph_ &g) {
		colourmap[v] = boost::color_traits<boost::default_color_type>::white();
	}

	template <typename Edge, typename Graph_>
	void tree_edge(Edge e, Graph_ & g) {
		join_or_widen_over_edge(e, g);
	}

	template <typename Edge, typename Graph_>
	void forward_or_cross_edge(Edge e, Graph_ & g) {
		join_or_widen_over_edge(e, g);
	}

	template <typename Edge, typename Graph_>
	void back_edge(Edge e, Graph_ & g) {
		// Should alwasys be simple vertices
		Vertex dest = boost::target(e,g);
		int & joinCount = g[dest].joinCount;
		++joinCount;
		bool is_widen = (joinCount >= WideningThreshold);
		join_or_widen_over_edge(e, g, is_widen);
	}


	template <typename Edge, typename Graph_>
	void join_or_widen_over_edge(Edge e, Graph_ & g, bool is_widen=false) {
		BasicBlock * source = getSourceBasicBlock(e, g);
		AbstractState & state = getSourceAbstractState(e, g);
		BasicBlock * target = getTargetBasicBlock(e, g);
		llvm::errs() << "Debug: StaticAnalysisVisitor::join_or_widen_basic_blocks enter: " << source->getName() << " -> " << target->getName() << "\n";
		llvm::errs() << "\t\top: " << (is_widen ? "Widen" : "Join") << "\n";
		bool isChanged = join_or_widen_basic_blocks(source, target, state, is_widen);
		if (isChanged) {
			mark_for_revisit(boost::target(e, g), g);
		}
		llvm::errs() << "Debug: StaticAnalysisVisitor::join_or_widen_basic_blocks done: " << source->getName() << " -> " << target->getName() << "\n";
		llvm::errs() << "\t\top: " << (is_widen ? "Widen" : "Join") <<
				" changed: " << isChanged << "\n";
	}

	template <typename Edge, typename Graph_>
	BasicBlock * getSourceBasicBlock(Edge e, Graph_ & g) {
		const VertexProperty & vprops = getSourceVertexProperty(e, g);
		assert(vprops.basicBlock);
		return vprops.basicBlock;
	}

	template <typename Edge, typename Graph_>
	BasicBlock * getTargetBasicBlock(Edge e, Graph_ & g) {
		const VertexProperty & vprops = getTargetVertexProperty(e, g);
		assert(vprops.basicBlock);
		return vprops.basicBlock;
	}

	template <typename Edge, typename Graph_>
	AbstractState & getSourceAbstractState(Edge e, Graph_ & g) {
		const VertexProperty & vprops = getSourceVertexProperty(e, g);
		return vprops.abstractState;
	}

	template <typename Edge, typename Graph_>
	const VertexProperty & getTargetVertexProperty(Edge e, Graph_ & g) {
		const EdgeProperty & eprop = g[e];
		if (eprop.targetRegion) {
			const Graph & region = *eprop.targetRegion;
			return region[eprop.targetVertex];
		}
		return g[boost::target(e, g)];
	}

	template <typename Edge, typename Graph_>
	const VertexProperty & getSourceVertexProperty(Edge e, Graph_ & g) {
		const EdgeProperty & eprop = g[e];
		if (eprop.sourceRegion) {
			const Graph & region = *eprop.sourceRegion;
			return region[eprop.sourceVertex];
		}
		return g[boost::source(e, g)];
	}

	bool join_or_widen_basic_blocks(BasicBlock * source, BasicBlock * dest, AbstractState & state, bool is_widen=false) {
		AbstractState incoming = dest->getAbstractStateWithAssumptions(*source, state);
		bool isChanged;
		if (is_widen) {
			isChanged = dest->getAbstractState().widen(incoming);
		} else {
			isChanged = dest->getAbstractState().join(incoming);
		}
		return isChanged;
	}
};

void analyze(Graph & g) {
	VertexColourMap colourmap;
	StaticAnalysisVisitor visitor(colourmap);
	boost::depth_first_search(g, boost::visitor(visitor).color_map(boost::associative_property_map<VertexColourMap>(colourmap)));
}

template <typename Graph>
void printToDotBody(Graph & g) {
	for (Vertex vertex : BGLIterable(boost::vertices(g))) {
		if (g[vertex].basicBlock) {
			llvm::errs() << "n_" << vertex << " [label=\"" <<
					g[vertex].name << "\"];\n";
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

template <typename Graph>
void printToDot(Graph & g) {
	llvm::errs() << "digraph G {\n";
	printToDotBody(g);
	llvm::errs() << "}\n";
}

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
