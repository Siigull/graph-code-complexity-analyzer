#ifndef IR_CORE_H                                        
#define IR_CORE_H

#include "graph.h"


/* PART 1: Direct degrees (Ca, Ce) and Warshall O(V^3) Transitive Closure */
static void step1_transitive_closure(Graph *g);


/* PART 2: Cycle Detection (Diagonal R[i][i]) & Mutual-Reachability SCCs */
static void step2_cycles_and_sccs(Graph *g);


/* PART 3: Downstream Blast Radius & Global Propagation Cost (Row-Major) */
static void step3_blast_and_propcost(Graph *g);


/* PART 4: Longest-Path DAG Levelization with Early Exit */
static void step4_topological_levels(Graph *g);


static void analyze(Graph *g);


static const char *role(const Graph *g, int i);


void print_graph(const char* filename, Graph* g);


void print_graph_dif(const char* basefilename, Graph* base, Graph* new);


int main(int argc, char **argv);


#endif /* IR_CORE */
