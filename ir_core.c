/**
 * @file ir_core.c
 * @author your name (you@domain.com)
 * @brief Minimal LLVM IRREDUCIBLE Architectural Graph & Entanglement Analyzer
 * @date 2026-10-17
 * 
 */

#include "graph.h"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



/* PART 1: Direct degrees (Ca, Ce) and Warshall O(V^3) Transitive Closure */
static void step1_transitive_closure(Graph *g) {
    int n = g->n;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (g->E[i][j]) {
                g->R[i][j] = 1;
                g->ce[i]++;
                g->ca[j]++;
                g->edges++;
            }
        }
    }
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            if (!g->R[i][k]) continue; /* Skip row i if it cannot reach bridge k */
            for (int j = 0; j < n; j++)
                g->R[i][j] |= g->R[k][j];
        }
    }
}


/* PART 2: Cycle Detection (Diagonal R[i][i]) & Mutual-Reachability SCCs */
static void step2_cycles_and_sccs(Graph *g) {
    int n = g->n;
    g->max_scc = n ? 1 : 0;
    for (int i = 0; i < n; i++) {
        if (!g->R[i][i]) {
            g->scc[i] = 1;
            g->lvl[i] = 0; /* Acyclic: eligible for topological levelization */
            continue;
        }
        g->cyc_nodes++;
        g->lvl[i] = -1;    /* Cyclic: topological level is undefined */
        for (int j = 0; j < n; j++)
            if (g->R[i][j] && g->R[j][i])
                g->scc[i]++;
        if (g->scc[i] > g->max_scc)
            g->max_scc = g->scc[i];
    }
}


/* PART 3: Downstream Blast Radius & Global Propagation Cost (Row-Major) */
static void step3_blast_and_propcost(Graph *g) {
    int n = g->n, reach_pairs = n; /* Count reflexive self-reachability (n) */
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (i != j && g->R[i][j]) {
                g->blast[j]++; /* Caller i reaches callee j -> j blasts i */
                reach_pairs++;
            }
        }
    }
    g->prop_cost = n ? (100.0 * reach_pairs) / (n * n) : 0.0;
}


/* PART 4: Longest-Path DAG Levelization with Early Exit */
static void step4_topological_levels(Graph *g) {
    int n = g->n;
    for (int step = 0; step < n; step++) {
        int changed = 0;
        for (int i = 0; i < n; i++) {
            if (g->lvl[i] < 0) continue; /* Skip nodes inside cycles */
            for (int j = 0; j < n; j++) {
                if (g->E[i][j]) {
                    int callee_lvl = (g->lvl[j] < 0) ? 0 : g->lvl[j];
                    if (g->lvl[i] < callee_lvl + 1) {
                        g->lvl[i] = callee_lvl + 1;
                        changed = 1;
                    }
                }
            }
        }
        if (!changed) break; /* Hierarchy settled early */
    }
}


static void analyze(Graph *g) {
    step1_transitive_closure(g);
    step2_cycles_and_sccs(g);
    step3_blast_and_propcost(g);
    step4_topological_levels(g);
}


int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <current.ll> [baseline.ll]\n", argv[0]);
        return 1;
    }

    // Analyze current.ll
    Graph *cur = calloc(1, sizeof(Graph));
    parse_ll(cur, argv[1]);
    analyze(cur);

    if (argc == 2) {
        print_graph(argv[1], cur);
    
    } else {
        // Analyze baseline.ll
        Graph *base = calloc(1, sizeof(Graph));
        parse_ll(base, argv[2]);
        analyze(base);

        print_graph_dif(argv[2], base, cur);
        
        free(base);
    }

    free(cur);
    return 0;
}


static const char *role(const Graph *g, int i) {
    if (g->scc[i] > 1)              return "CYCLE_TRAP";
    if (g->ce[i] == 0 && g->ca[i])  return "SINK_ABSTRACTION";
    if (g->ca[i] >= 2 && g->ce[i] >= 2) return "PASS_THROUGH_HUB";
    if (g->ca[i] == 0 && g->ce[i])  return "ENTRY_ROOT";
    return "INTERNAL";
}


void print_graph(const char* filename, Graph* g) {
        printf("%-24s %4s %4s %6s %5s %6s  %s\n",
           "SYMBOL", "Ca", "Ce", "BLAST", "SCC", "LEVEL", "STRUCTURAL_ROLE");
    printf("------------------------------------------------------------------------\n");
    for (int i = 0; i < g->n; i++) {
        char lvl_s[16];
        if (g->lvl[i] < 0) snprintf(lvl_s, sizeof(lvl_s), "CYCLE");
        else snprintf(lvl_s, sizeof(lvl_s), "L%d", g->lvl[i]);
        printf("%-24.24s %4d %4d %6d %5d %6s  %s\n",
               g->name[i], g->ca[i], g->ce[i],
               g->blast[i], g->scc[i], lvl_s, role(g, i));
    }
    printf("------------------------------------------------------------------------\n");
    printf("SUMMARY [%s]: Nodes=%d | Edges=%d | MaxSCC=%d | CyclicNodes=%d | PropCost=%.2f%%\n",
           filename, g->n, g->edges, g->max_scc, g->cyc_nodes, g->prop_cost);
}


void print_graph_dif(const char* basefilename, Graph* base, Graph* new) {
    int d_cyc = new->cyc_nodes - base->cyc_nodes;
    double d_pc = new->prop_cost - base->prop_cost;
    printf("DELTA vs [%s]: dNodes=%+d | dEdges=%+d | dCyclic=%+d | dPropCost=%+.2f%%\n",
            basefilename, new->n - base->n, new->edges - base->edges, d_cyc, d_pc);
    if (d_cyc > 0 || new->max_scc > base->max_scc)
        printf("VERDICT: BANDAGE DETECTED (New cyclic entanglement introduced)\n");
    else if (d_cyc < 0 || (new->n >= base->n && d_pc < -0.5))
        printf("VERDICT: STRUCTURAL REFACTOR (Reduced propagation cost / cycles)\n");
    else
        printf("VERDICT: CLEAN EXTENSION (Hierarchy preserved)\n");
}
