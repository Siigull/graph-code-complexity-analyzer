#ifndef MAIN_H                                        
#define MAIN_H


#include "llvm.h"


#define MAX(a, b) (((a) > (b)) ? (a) : (b))
#define MIN(a, b) (((a) < (b)) ? (a) : (b))


typedef struct {
    int edges, max_scc, cyc_nodes;
    double prop_cost;
    unsigned char R[MAXV][MAXV];
    int ca[MAXV], ce[MAXV], scc[MAXV], lvl[MAXV], blast[MAXV];
} Analysis;


typedef struct {
    Raw_Graph raw;
    Analysis metrics;
    char filename[50];
} Snapshot;



/* PART 1: Direct degrees (Ca, Ce) and Warshall O(V^3) Transitive Closure */
static void step1_transitive_closure(const Raw_Graph *raw, Analysis *a);


/* PART 2: Cycle Detection (Diagonal R[i][i]) & Mutual-Reachability SCCs */
static void step2_cycles_and_sccs(int n, Analysis *a);


/* PART 3: Downstream Blast Radius & Global Propagation Cost (Row-Major) */
static void step3_blast_and_propcost(int n, Analysis *a);


/* PART 4: Longest-Path DAG Levelization with Early Exit */
static void step4_topological_levels(const Raw_Graph *raw, Analysis *a);


static void analyze(Raw_Graph *raw, Analysis *a);

static int is_internal_bb(const Raw_Graph *raw, int i);

static void remove_vertex(Raw_Graph *raw, int del);

static void collapse_linear_blocks(Raw_Graph *raw);

int main(int argc, char **argv);

static const char *role(const Analysis *a, int i);


void print_graph(Snapshot* g);


void print_graph_dif(Snapshot* new, Snapshot* base);


#endif /* MAIN */
