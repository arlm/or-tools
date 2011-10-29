CP_LIBS = \
	$(LIBPREFIX)routing.$(LIBSUFFIX)       \
	$(LIBPREFIX)constraint_solver.$(LIBSUFFIX)

GRAPH_LIBS = \
	$(LIBPREFIX)graph.$(LIBSUFFIX) \
	$(LIBPREFIX)shortestpaths.$(LIBSUFFIX)

graphlibs: $(GRAPH_LIBS) $(BASE_LIBS)

BASE_LIBS = \
	$(LIBPREFIX)util.$(LIBSUFFIX)          \
	$(LIBPREFIX)base.$(LIBSUFFIX)

cplibs: $(CP_LIBS) $(BASE_LIBS)

LP_LIBS = \
	$(LIBPREFIX)linear_solver.$(LIBSUFFIX)

lplibs: $(LP_LIBS) $(BASE_LIBS)

CPBINARIES = \
	costas_array$E \
	cryptarithm$E \
        cvrptw$E \
	flow_example$E \
	golomb$E \
	jobshop$E \
	linear_assignment_example$E \
	magic_square$E \
	model_util$E \
	network_routing$E \
	nqueens$E \
	solve_dimacs_assignment$E \
	tsp$E

cpexe: $(CPBINARIES)

LPBINARIES = \
	column_generation$E \
	integer_solver_example$E \
	linear_solver_example$E \
	linear_solver_example_with_protocol_buffers$E

lpexe: $(LPBINARIES)

ALGORITHMS_LIBS = \
	$(LIBPREFIX)algorithms.$(LIBSUFFIX)

algorithmslibs: $(ALGORITHMS_LIBS)

DIMACS_LIBS = \
	$(LIBPREFIX)dimacs.$(LIBSUFFIX)

dimacslibs: $(DIMACS_LIBS)

clean:
	$(DEL) *.$(LIBSUFFIX)
	$(DEL) objs$S*.$O
	$(DEL) $(CPBINARIES)
	$(DEL) $(LPBINARIES)
	$(DEL) gen$Salgorithms$S*wrap*
	$(DEL) gen$Scom$Sgoogle$Sortools$Sconstraintsolver$S*.java
	$(DEL) gen$Scom$Sgoogle$Sortools$Sflow$S*.java
	$(DEL) gen$Scom$Sgoogle$Sortools$Sknapsacksolver$S*.java
	$(DEL) gen$Scom$Sgoogle$Sortools$Slinearsolver$S*.java
	$(DEL) gen$Sconstraint_solver$S*.pb.*
	$(DEL) gen$Sconstraint_solver$S*wrap*
	$(DEL) gen$Sgraph$S*wrap*
	$(DEL) gen$Slinear_solver$S*.pb.*
	$(DEL) gen$Slinear_solver$S*wrap*
	$(DEL) objs$Scom$Sgoogle$Sortools$Sconstraintsolver$S*.class
	$(DEL) objs$Scom$Sgoogle$Sortools$Sflow$S*.class
	$(DEL) objs$Scom$Sgoogle$Sortools$Sknapsacksolver$S*.class
	$(DEL) objs$Scom$Sgoogle$Sortools$Slinearsolver$S*.class
	$(DEL) *.$(SHAREDLIBEXT)
	$(DEL) *.$(JNILIBEXT)
	$(DEL) *.jar

# Constraint Solver Lib.

CONSTRAINT_SOLVER_LIB_OS = \
	objs/alldiff_cst.$O\
	objs/assignment.$O\
	objs/assignment.pb.$O\
	objs/constraint_solver.$O\
	objs/constraints.$O\
	objs/count_cst.$O\
	objs/default_search.$O\
	objs/demon_profiler.$O\
	objs/demon_profiler.pb.$O\
	objs/deviation.$O\
	objs/element.$O\
	objs/expr_array.$O\
	objs/expr_cst.$O\
	objs/expressions.$O\
	objs/hybrid.$O\
	objs/interval.$O\
	objs/io.$O\
	objs/local_search.$O\
	objs/model.pb.$O\
	objs/model_cache.$O\
	objs/nogoods.$O\
	objs/pack.$O\
	objs/range_cst.$O\
	objs/resource.$O\
	objs/sched_search.$O\
	objs/search.$O\
	objs/search_limit.pb.$O\
	objs/table.$O\
	objs/timetabling.$O\
	objs/tree_monitor.$O\
	objs/utilities.$O

objs/alldiff_cst.$O:constraint_solver/alldiff_cst.cc
	$(CCC) $(CFLAGS) -c constraint_solver/alldiff_cst.cc $(OBJOUT)objs/alldiff_cst.$O

objs/assignment.$O:constraint_solver/assignment.cc gen/constraint_solver/assignment.pb.h
	$(CCC) $(CFLAGS) -c constraint_solver/assignment.cc $(OBJOUT)objs/assignment.$O

objs/assignment.pb.$O:gen/constraint_solver/assignment.pb.cc
	$(CCC) $(CFLAGS) -c gen/constraint_solver/assignment.pb.cc $(OBJOUT)objs/assignment.pb.$O

gen/constraint_solver/assignment.pb.cc:constraint_solver/assignment.proto
	$(PROTOBUF_DIR)/bin/protoc --proto_path=. --cpp_out=gen constraint_solver/assignment.proto

gen/constraint_solver/assignment.pb.h:gen/constraint_solver/assignment.pb.cc

objs/constraint_solver.$O:constraint_solver/constraint_solver.cc gen/constraint_solver/model.pb.h
	$(CCC) $(CFLAGS) -c constraint_solver/constraint_solver.cc $(OBJOUT)objs/constraint_solver.$O

objs/constraints.$O:constraint_solver/constraints.cc
	$(CCC) $(CFLAGS) -c constraint_solver/constraints.cc $(OBJOUT)objs/constraints.$O

objs/count_cst.$O:constraint_solver/count_cst.cc
	$(CCC) $(CFLAGS) -c constraint_solver/count_cst.cc $(OBJOUT)objs/count_cst.$O

objs/default_search.$O:constraint_solver/default_search.cc
	$(CCC) $(CFLAGS) -c constraint_solver/default_search.cc $(OBJOUT)objs/default_search.$O

objs/demon_profiler.$O:constraint_solver/demon_profiler.cc gen/constraint_solver/demon_profiler.pb.h
	$(CCC) $(CFLAGS) -c constraint_solver/demon_profiler.cc $(OBJOUT)objs/demon_profiler.$O

objs/demon_profiler.pb.$O:gen/constraint_solver/demon_profiler.pb.cc
	$(CCC) $(CFLAGS) -c gen/constraint_solver/demon_profiler.pb.cc $(OBJOUT)objs/demon_profiler.pb.$O

gen/constraint_solver/demon_profiler.pb.cc:constraint_solver/demon_profiler.proto
	$(PROTOBUF_DIR)/bin/protoc --proto_path=. --cpp_out=gen constraint_solver/demon_profiler.proto

gen/constraint_solver/demon_profiler.pb.h:gen/constraint_solver/demon_profiler.pb.cc

objs/deviation.$O:constraint_solver/deviation.cc
	$(CCC) $(CFLAGS) -c constraint_solver/deviation.cc $(OBJOUT)objs/deviation.$O

objs/element.$O:constraint_solver/element.cc
	$(CCC) $(CFLAGS) -c constraint_solver/element.cc $(OBJOUT)objs/element.$O

objs/expr_array.$O:constraint_solver/expr_array.cc
	$(CCC) $(CFLAGS) -c constraint_solver/expr_array.cc $(OBJOUT)objs/expr_array.$O

objs/expr_cst.$O:constraint_solver/expr_cst.cc
	$(CCC) $(CFLAGS) -c constraint_solver/expr_cst.cc $(OBJOUT)objs/expr_cst.$O

objs/expressions.$O:constraint_solver/expressions.cc
	$(CCC) $(CFLAGS) -c constraint_solver/expressions.cc $(OBJOUT)objs/expressions.$O

objs/hybrid.$O:constraint_solver/hybrid.cc
	$(CCC) $(CFLAGS) -c constraint_solver/hybrid.cc $(OBJOUT)objs/hybrid.$O

objs/interval.$O:constraint_solver/interval.cc
	$(CCC) $(CFLAGS) -c constraint_solver/interval.cc $(OBJOUT)objs/interval.$O

objs/io.$O:constraint_solver/io.cc gen/constraint_solver/model.pb.h
	$(CCC) $(CFLAGS) -c constraint_solver/io.cc $(OBJOUT)objs/io.$O

objs/local_search.$O:constraint_solver/local_search.cc
	$(CCC) $(CFLAGS) -c constraint_solver/local_search.cc $(OBJOUT)objs/local_search.$O

objs/model.pb.$O:gen/constraint_solver/model.pb.cc
	$(CCC) $(CFLAGS) -c gen/constraint_solver/model.pb.cc $(OBJOUT)objs/model.pb.$O

objs/model_cache.$O:constraint_solver/model_cache.cc
	$(CCC) $(CFLAGS) -c constraint_solver/model_cache.cc $(OBJOUT)objs/model_cache.$O

gen/constraint_solver/model.pb.cc:constraint_solver/model.proto
	$(PROTOBUF_DIR)/bin/protoc --proto_path=. --cpp_out=gen constraint_solver/model.proto

gen/constraint_solver/model.pb.h:gen/constraint_solver/model.pb.cc gen/constraint_solver/search_limit.pb.h

objs/nogoods.$O:constraint_solver/nogoods.cc
	$(CCC) $(CFLAGS) -c constraint_solver/nogoods.cc $(OBJOUT)objs/nogoods.$O

objs/pack.$O:constraint_solver/pack.cc
	$(CCC) $(CFLAGS) -c constraint_solver/pack.cc $(OBJOUT)objs/pack.$O

objs/range_cst.$O:constraint_solver/range_cst.cc
	$(CCC) $(CFLAGS) -c constraint_solver/range_cst.cc $(OBJOUT)objs/range_cst.$O

objs/resource.$O:constraint_solver/resource.cc
	$(CCC) $(CFLAGS) -c constraint_solver/resource.cc $(OBJOUT)objs/resource.$O

objs/sched_search.$O:constraint_solver/sched_search.cc
	$(CCC) $(CFLAGS) -c constraint_solver/sched_search.cc $(OBJOUT)objs/sched_search.$O

objs/search.$O:constraint_solver/search.cc gen/constraint_solver/search_limit.pb.h
	$(CCC) $(CFLAGS) -c constraint_solver/search.cc $(OBJOUT)objs/search.$O

objs/search_limit.pb.$O:gen/constraint_solver/search_limit.pb.cc
	$(CCC) $(CFLAGS) -c gen/constraint_solver/search_limit.pb.cc $(OBJOUT)objs/search_limit.pb.$O

gen/constraint_solver/search_limit.pb.cc:constraint_solver/search_limit.proto
	$(PROTOBUF_DIR)/bin/protoc --proto_path=. --cpp_out=gen constraint_solver/search_limit.proto

gen/constraint_solver/search_limit.pb.h:gen/constraint_solver/search_limit.pb.cc

objs/table.$O:constraint_solver/table.cc
	$(CCC) $(CFLAGS) -c constraint_solver/table.cc $(OBJOUT)objs/table.$O

objs/timetabling.$O:constraint_solver/timetabling.cc
	$(CCC) $(CFLAGS) -c constraint_solver/timetabling.cc $(OBJOUT)objs/timetabling.$O

objs/tree_monitor.$O:constraint_solver/tree_monitor.cc
	$(CCC) $(CFLAGS) -c constraint_solver/tree_monitor.cc $(OBJOUT)objs/tree_monitor.$O

objs/utilities.$O:constraint_solver/utilities.cc
	$(CCC) $(CFLAGS) -c constraint_solver/utilities.cc $(OBJOUT)objs/utilities.$O

$(LIBPREFIX)constraint_solver.$(LIBSUFFIX): $(CONSTRAINT_SOLVER_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)constraint_solver.$(LIBSUFFIX) $(CONSTRAINT_SOLVER_LIB_OS)

# Linear Solver Library

LINEAR_SOLVER_LIB_OS = \
	objs/cbc_interface.$O \
	objs/clp_interface.$O \
	objs/glpk_interface.$O \
	objs/linear_solver.$O \
	objs/linear_solver.pb.$O \
	objs/scip_interface.$O

objs/cbc_interface.$O:linear_solver/cbc_interface.cc
	$(CCC) $(CFLAGS) $(CBC_STRING) -c linear_solver/cbc_interface.cc $(OBJOUT)objs/cbc_interface.$O

objs/clp_interface.$O:linear_solver/clp_interface.cc
	$(CCC) $(CFLAGS) $(CLP_STRING) -c linear_solver/clp_interface.cc $(OBJOUT)objs/clp_interface.$O

objs/glpk_interface.$O:linear_solver/glpk_interface.cc
	$(CCC) $(CFLAGS) -c linear_solver/glpk_interface.cc $(OBJOUT)objs/glpk_interface.$O

objs/linear_solver.$O:linear_solver/linear_solver.cc gen/linear_solver/linear_solver.pb.h
	$(CCC) $(CFLAGS) -c linear_solver/linear_solver.cc $(OBJOUT)objs/linear_solver.$O

objs/linear_solver.pb.$O:gen/linear_solver/linear_solver.pb.cc
	$(CCC) $(CFLAGS) -c gen/linear_solver/linear_solver.pb.cc $(OBJOUT)objs/linear_solver.pb.$O

gen/linear_solver/linear_solver.pb.cc:linear_solver/linear_solver.proto
	$(PROTOBUF_DIR)/bin/protoc --proto_path=. --cpp_out=gen linear_solver/linear_solver.proto

gen/linear_solver/linear_solver.pb.h:gen/linear_solver/linear_solver.pb.cc

objs/scip_interface.$O:linear_solver/scip_interface.cc
	$(CCC) $(CFLAGS) -c linear_solver/scip_interface.cc $(OBJOUT)objs/scip_interface.$O

$(LIBPREFIX)linear_solver.$(LIBSUFFIX): $(LINEAR_SOLVER_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)linear_solver.$(LIBSUFFIX) $(LINEAR_SOLVER_LIB_OS)

# Util library.

UTIL_LIB_OS=\
	objs/bitset.$O \
	objs/cached_log.$O \
	objs/const_int_array.$O \
	objs/xml_helper.$O

objs/bitset.$O:util/bitset.cc
	$(CCC) $(CFLAGS) -c util/bitset.cc $(OBJOUT)objs/bitset.$O

objs/cached_log.$O:util/cached_log.cc
	$(CCC) $(CFLAGS) -c util/cached_log.cc $(OBJOUT)objs/cached_log.$O

objs/const_int_array.$O:util/const_int_array.cc
	$(CCC) $(CFLAGS) -c util/const_int_array.cc $(OBJOUT)objs/const_int_array.$O

objs/xml_helper.$O:util/xml_helper.cc
	$(CCC) $(CFLAGS) -c util/xml_helper.cc $(OBJOUT)objs/xml_helper.$O

$(LIBPREFIX)util.$(LIBSUFFIX): $(UTIL_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)util.$(LIBSUFFIX) $(UTIL_LIB_OS)

# Graph library.

GRAPH_LIB_OS=\
	objs/linear_assignment.$O \
	objs/bron_kerbosch.$O \
	objs/connectivity.$O \
	objs/max_flow.$O \
	objs/min_cost_flow.$O

objs/linear_assignment.$O:graph/linear_assignment.cc
	$(CCC) $(CFLAGS) -c graph/linear_assignment.cc $(OBJOUT)objs/linear_assignment.$O

objs/bron_kerbosch.$O:graph/bron_kerbosch.cc
	$(CCC) $(CFLAGS) -c graph/bron_kerbosch.cc $(OBJOUT)objs/bron_kerbosch.$O

objs/connectivity.$O:graph/connectivity.cc
	$(CCC) $(CFLAGS) -c graph/connectivity.cc $(OBJOUT)objs/connectivity.$O

objs/max_flow.$O:graph/max_flow.cc
	$(CCC) $(CFLAGS) -c graph/max_flow.cc $(OBJOUT)objs/max_flow.$O

objs/min_cost_flow.$O:graph/min_cost_flow.cc
	$(CCC) $(CFLAGS) -c graph/min_cost_flow.cc $(OBJOUT)objs/min_cost_flow.$O

$(LIBPREFIX)graph.$(LIBSUFFIX): $(GRAPH_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)graph.$(LIBSUFFIX) $(GRAPH_LIB_OS)

# Shortestpaths library.

SHORTESTPATHS_LIB_OS=\
	objs/bellman_ford.$O \
	objs/dijkstra.$O \
	objs/shortestpaths.$O

objs/bellman_ford.$O:graph/bellman_ford.cc
	$(CCC) $(CFLAGS) -c graph/bellman_ford.cc $(OBJOUT)objs/bellman_ford.$O

objs/dijkstra.$O:graph/dijkstra.cc
	$(CCC) $(CFLAGS) -c graph/dijkstra.cc $(OBJOUT)objs/dijkstra.$O

objs/shortestpaths.$O:graph/shortestpaths.cc
	$(CCC) $(CFLAGS) -c graph/shortestpaths.cc $(OBJOUT)objs/shortestpaths.$O

$(LIBPREFIX)shortestpaths.$(LIBSUFFIX): $(SHORTESTPATHS_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)shortestpaths.$(LIBSUFFIX) $(SHORTESTPATHS_LIB_OS)

# Routing library.

ROUTING_LIB_OS=\
	objs/routing.$O

objs/routing.$O:constraint_solver/routing.cc
	$(CCC) $(CFLAGS) -c constraint_solver/routing.cc $(OBJOUT)objs/routing.$O

$(LIBPREFIX)routing.$(LIBSUFFIX): $(ROUTING_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)routing.$(LIBSUFFIX) $(ROUTING_LIB_OS)

# Algorithms library.

ALGORITHMS_LIB_OS=\
	objs/hungarian.$O \
	objs/knapsack_solver.$O

objs/hungarian.$O:algorithms/hungarian.cc
	$(CCC) $(CFLAGS) -c algorithms/hungarian.cc $(OBJOUT)objs/hungarian.$O

objs/knapsack_solver.$O:algorithms/knapsack_solver.cc gen/linear_solver/linear_solver.pb.h
	$(CCC) $(CFLAGS) -c algorithms/knapsack_solver.cc $(OBJOUT)objs/knapsack_solver.$O

$(LIBPREFIX)algorithms.$(LIBSUFFIX): $(ALGORITHMS_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)algorithms.$(LIBSUFFIX) $(ALGORITHMS_LIB_OS)

# Base library.

BASE_LIB_OS=\
	objs/bitmap.$O\
	objs/callback.$O\
	objs/file.$O\
	objs/join.$O\
	objs/logging.$O\
	objs/random.$O\
	objs/recordio.$O\
	objs/split.$O\
	objs/stringpiece.$O\
	objs/stringprintf.$O\
	objs/sysinfo.$O\
	objs/timer.$O

objs/bitmap.$O:base/bitmap.cc
	$(CCC) $(CFLAGS) -c base/bitmap.cc $(OBJOUT)objs/bitmap.$O
objs/callback.$O:base/callback.cc
	$(CCC) $(CFLAGS) -c base/callback.cc $(OBJOUT)objs/callback.$O
objs/file.$O:base/file.cc
	$(CCC) $(CFLAGS) -c base/file.cc $(OBJOUT)objs/file.$O
objs/logging.$O:base/logging.cc
	$(CCC) $(CFLAGS) -c base/logging.cc $(OBJOUT)objs/logging.$O
objs/join.$O:base/join.cc
	$(CCC) $(CFLAGS) -c base/join.cc $(OBJOUT)objs/join.$O
objs/random.$O:base/random.cc
	$(CCC) $(CFLAGS) -c base/random.cc $(OBJOUT)objs/random.$O
objs/recordio.$O:base/recordio.cc
	$(CCC) $(CFLAGS) -c base/recordio.cc $(OBJOUT)objs/recordio.$O
objs/split.$O:base/split.cc
	$(CCC) $(CFLAGS) -c base/split.cc $(OBJOUT)objs/split.$O
objs/stringpiece.$O:base/stringpiece.cc
	$(CCC) $(CFLAGS) -c base/stringpiece.cc $(OBJOUT)objs/stringpiece.$O
objs/stringprintf.$O:base/stringprintf.cc
	$(CCC) $(CFLAGS) -c base/stringprintf.cc $(OBJOUT)objs/stringprintf.$O
objs/sysinfo.$O:base/sysinfo.cc
	$(CCC) $(CFLAGS) -c base/sysinfo.cc $(OBJOUT)objs/sysinfo.$O
objs/timer.$O:base/timer.cc
	$(CCC) $(CFLAGS) -c base/timer.cc $(OBJOUT)objs/timer.$O

$(LIBPREFIX)base.$(LIBSUFFIX): $(BASE_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)base.$(LIBSUFFIX) $(BASE_LIB_OS)

# DIMACS challenge problem format library

DIMACS_LIB_OS=\
	objs/parse_dimacs_assignment.$O\
	objs/print_dimacs_assignment.$O

objs/parse_dimacs_assignment.$O:examples/parse_dimacs_assignment.cc
	$(CCC) $(CFLAGS) -c examples/parse_dimacs_assignment.cc $(OBJOUT)objs/parse_dimacs_assignment.$O
objs/print_dimacs_assignment.$O:examples/print_dimacs_assignment.cc
	$(CCC) $(CFLAGS) -c examples/print_dimacs_assignment.cc $(OBJOUT)objs/print_dimacs_assignment.$O

$(LIBPREFIX)dimacs.$(LIBSUFFIX): $(DIMACS_LIB_OS)
	$(LINKCMD) $(LINKPREFIX)$(LIBPREFIX)dimacs.$(LIBSUFFIX) $(DIMACS_LIB_OS)

# Flow and linear assignment examples

objs/linear_assignment_example.$O:examples/linear_assignment_example.cc
	$(CCC) $(CFLAGS) -c examples/linear_assignment_example.cc $(OBJOUT)objs/linear_assignment_example.$O

linear_assignment_example$E: $(GRAPH_LIBS) $(BASE_LIBS) objs/linear_assignment_example.$O
	$(CCC) $(CFLAGS) objs/linear_assignment_example.$O $(GRAPH_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)linear_assignment_example$E

objs/flow_example.$O:examples/flow_example.cc
	$(CCC) $(CFLAGS) -c examples/flow_example.cc $(OBJOUT)objs/flow_example.$O

flow_example$E: $(GRAPH_LIBS) $(BASE_LIBS) objs/flow_example.$O
	$(CCC) $(CFLAGS) objs/flow_example.$O $(GRAPH_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)flow_example$E

objs/solve_dimacs_assignment.$O:examples/solve_dimacs_assignment.cc
	$(CCC) $(CFLAGS) -c examples/solve_dimacs_assignment.cc $(OBJOUT)objs/solve_dimacs_assignment.$O

solve_dimacs_assignment$E: $(ALGORITHMS_LIBS) $(BASE_LIBS) $(DIMACS_LIBS) $(GRAPH_LIBS) objs/solve_dimacs_assignment.$O
	$(CCC) $(CFLAGS) objs/solve_dimacs_assignment.$O $(DIMACS_LIBS) $(ALGORITHMS_LIBS) $(GRAPH_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)solve_dimacs_assignment$E

# Pure CP and Routing Examples

objs/costas_array.$O: examples/costas_array.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/costas_array.cc $(OBJOUT)objs/costas_array.$O

costas_array$E: $(CP_LIBS) $(BASE_LIBS) objs/costas_array.$O
	$(CCC) $(CFLAGS) objs/costas_array.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)costas_array$E

objs/cryptarithm.$O:examples/cryptarithm.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/cryptarithm.cc $(OBJOUT)objs/cryptarithm.$O

cryptarithm$E: $(CP_LIBS) $(BASE_LIBS) objs/cryptarithm.$O
	$(CCC) $(CFLAGS) objs/cryptarithm.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)cryptarithm$E

objs/cvrptw.$O: examples/cvrptw.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/cvrptw.cc $(OBJOUT)objs/cvrptw.$O

cvrptw$E: $(CP_LIBS) $(BASE_LIBS) objs/cvrptw.$O
	$(CCC) $(CFLAGS) objs/cvrptw.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)cvrptw$E

objs/dobble_ls.$O:examples/dobble_ls.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/dobble_ls.cc $(OBJOUT)objs/dobble_ls.$O

dobble_ls$E: $(CP_LIBS) $(BASE_LIBS) objs/dobble_ls.$O
	$(CCC) $(CFLAGS) objs/dobble_ls.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)dobble_ls$E

objs/golomb.$O:examples/golomb.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/golomb.cc $(OBJOUT)objs/golomb.$O

golomb$E: $(CP_LIBS) $(BASE_LIBS) objs/golomb.$O
	$(CCC) $(CFLAGS) objs/golomb.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)golomb$E

objs/jobshop.$O:examples/jobshop.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/jobshop.cc $(OBJOUT)objs/jobshop.$O

jobshop$E: $(CP_LIBS) $(BASE_LIBS) objs/jobshop.$O
	$(CCC) $(CFLAGS) objs/jobshop.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)jobshop$E

objs/magic_square.$O:examples/magic_square.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/magic_square.cc $(OBJOUT)objs/magic_square.$O

magic_square$E: $(CP_LIBS) $(BASE_LIBS) objs/magic_square.$O
	$(CCC) $(CFLAGS) objs/magic_square.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)magic_square$E

objs/model_util.$O:examples/model_util.cc gen/constraint_solver/model.pb.h constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/model_util.cc $(OBJOUT)objs/model_util.$O

model_util$E: $(CP_LIBS) $(BASE_LIBS) objs/model_util.$O
	$(CCC) $(CFLAGS) objs/model_util.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)model_util$E

objs/network_routing.$O:examples/network_routing.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/network_routing.cc $(OBJOUT)objs/network_routing.$O

network_routing$E: $(CP_LIBS) $(BASE_LIBS) $(GRAPH_LIBS) objs/network_routing.$O
	$(CCC) $(CFLAGS) objs/network_routing.$O $(CP_LIBS) $(GRAPH_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)network_routing$E

objs/nqueens.$O: examples/nqueens.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/nqueens.cc $(OBJOUT)objs/nqueens.$O

nqueens$E: $(CP_LIBS) $(BASE_LIBS) objs/nqueens.$O
	$(CCC) $(CFLAGS) objs/nqueens.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)nqueens$E

objs/tricks.$O: examples/tricks.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/tricks.cc $(OBJOUT)objs/tricks.$O

objs/global_arith.$O: examples/global_arith.cc constraint_solver/constraint_solver.h
	$(CCC) $(CFLAGS) -c examples/global_arith.cc $(OBJOUT)objs/global_arith.$O

tricks$E: $(CPLIBS) $(BASE_LIBS) objs/tricks.$O objs/global_arith.$O
	$(CCC) $(CFLAGS) objs/tricks.$O objs/global_arith.$O $(CPLIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)tricks$E

objs/tsp.$O: examples/tsp.cc constraint_solver/routing.h
	$(CCC) $(CFLAGS) -c examples/tsp.cc $(OBJOUT)objs/tsp.$O

tsp$E: $(CP_LIBS) $(BASE_LIBS) objs/tsp.$O
	$(CCC) $(CFLAGS) objs/tsp.$O $(CP_LIBS) $(BASE_LIBS) $(LDFLAGS) $(EXEOUT)tsp$E

# Linear Programming Examples

objs/column_generation.$O: examples/column_generation.cc linear_solver/linear_solver.h
	$(CCC) $(CFLAGS) -c examples/column_generation.cc $(OBJOUT)objs/column_generation.$O

column_generation$E: $(LP_LIBS) $(BASE_LIBS) objs/column_generation.$O
	$(CCC) $(CFLAGS) objs/column_generation.$O $(LP_LIBS) $(BASE_LIBS) $(LDLPDEPS) $(LDFLAGS) $(EXEOUT)column_generation$E

objs/linear_solver_example.$O: examples/linear_solver_example.cc linear_solver/linear_solver.h
	$(CCC) $(CFLAGS) -c examples/linear_solver_example.cc $(OBJOUT)objs/linear_solver_example.$O

linear_solver_example$E: $(LP_LIBS) $(BASE_LIBS) objs/linear_solver_example.$O
	$(CCC) $(CFLAGS) objs/linear_solver_example.$O $(LP_LIBS) $(BASE_LIBS) $(LDLPDEPS) $(LDFLAGS) $(EXEOUT)linear_solver_example$E

objs/linear_solver_example_with_protocol_buffers.$O: examples/linear_solver_example_with_protocol_buffers.cc linear_solver/linear_solver.h
	$(CCC) $(CFLAGS) -c examples/linear_solver_example_with_protocol_buffers.cc $(OBJOUT)objs/linear_solver_example_with_protocol_buffers.$O

linear_solver_example_with_protocol_buffers$E: $(LP_LIBS) $(BASE_LIBS) objs/linear_solver_example_with_protocol_buffers.$O
	$(CCC) $(CFLAGS) objs/linear_solver_example_with_protocol_buffers.$O $(LP_LIBS) $(BASE_LIBS) $(LDLPDEPS) $(LDFLAGS) $(EXEOUT)linear_solver_example_with_protocol_buffers$E

objs/integer_solver_example.$O: examples/integer_solver_example.cc linear_solver/linear_solver.h
	$(CCC) $(CFLAGS) -c examples/integer_solver_example.cc $(OBJOUT)objs/integer_solver_example.$O

integer_solver_example$E: $(LP_LIBS) $(BASE_LIBS) objs/integer_solver_example.$O
	$(CCC) $(CFLAGS) objs/integer_solver_example.$O $(LP_LIBS) $(BASE_LIBS) $(LDLPDEPS) $(LDFLAGS) $(EXEOUT)integer_solver_example$E
