/**
 * @file main.c
 * @author Sigull
 * @brief Minimal (LLVM IR) Architectural Graph & Entanglement Analyzer
 * @date 2026-10-17
 * 
 */

#include "main.h"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* PART 1: Direct degrees (Ca, Ce) and Warshall O(V^3) Transitive Closure */
static void step1_transitive_closure(const Raw_Graph *raw, Analysis *a) {
    int n = raw->n;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (raw->E[i][j]) {
                a->R[i][j] = 1;
                a->ce[i]++;
                a->ca[j]++;
                a->edges++;
            }
        }
    }

    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            if (!a->R[i][k]) continue;
            for (int j = 0; j < n; j++)
                a->R[i][j] |= a->R[k][j];
        }
    }
}


/* PART 2: Cycle Detection (Diagonal R[i][i]) & Mutual-Reachability SCCs */
static void step2_cycles_and_sccs(int n, Analysis *a) {
    a->max_scc = n ? 1 : 0;

    for (int i = 0; i < n; i++) {
        if (!a->R[i][i]) {
            a->scc[i] = 1;
            a->lvl[i] = 0;
            continue;
        }

        a->cyc_nodes++;
        a->lvl[i] = -1;

        for (int j = 0; j < n; j++) {
            if (a->R[i][j] && a->R[j][i]) {
                a->scc[i]++;
            }
        }

        if (a->scc[i] > a->max_scc) {
            a->max_scc = a->scc[i];
        }
    }
}


/* PART 3: Downstream Blast Radius & Global Propagation Cost (Row-Major) */
static void step3_blast_and_propcost(int n, Analysis *a) {
    int reach_pairs = n;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (i != j && a->R[i][j]) {
                a->blast[j]++;
                reach_pairs++;
            }
        }
    }
    
    a->prop_cost = n ? (100.0 * reach_pairs) / (n * n) : 0.0;
}


/* PART 4: Longest-Path DAG Levelization with Early Exit */
static void step4_topological_levels(const Raw_Graph *raw, Analysis *a) {
    int n = raw->n;

    for (int step = 0; step < n; step++) {
        int changed = 0;

        for (int i = 0; i < n; i++) {

            if (a->lvl[i] < 0) continue;

            for (int j = 0; j < n; j++) {
                if (raw->E[i][j]) {
                    int callee_lvl = (a->lvl[j] < 0) ? 0 : a->lvl[j];
                    if (a->lvl[i] < callee_lvl + 1) {
                        a->lvl[i] = callee_lvl + 1;
                        changed = 1;
                    }
                }
            }
        }
        
        if (!changed) break;
    }
}


static void analyze(const Raw_Graph *raw, Analysis *a) {
    // memset(a, 0, sizeof(*a));
    step1_transitive_closure(raw, a);
    step2_cycles_and_sccs(raw->n, a);
    step3_blast_and_propcost(raw->n, a);
    step4_topological_levels(raw, a);
}


int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <current.ll> [baseline.ll]\n", argv[0]);
        return 1;
    }

    // Analyze current.ll
    Snapshot *cur = calloc(1, sizeof(Snapshot));
    memcpy(&cur->filename, argv[1], MIN(strlen(argv[1]), 49));
    parse_ll(&cur->raw, argv[1]);
    analyze(&cur->raw, &cur->metrics);

    if (argc == 2) {
        print_graph(cur);
    
    } else {
        // Analyze baseline.ll
        Snapshot *base = calloc(1, sizeof(Snapshot));
        memcpy(&base->filename, argv[2], MIN(strlen(argv[2]), 49));
        parse_ll(&base->raw, argv[2]);
        analyze(&base->raw, &base->metrics);

        print_graph_dif(cur, base);
        
        free(base);
    }

    free(cur);
    return 0;
}


static const char *role(const Analysis *a, int i) {
    if (a->scc[i] > 1)                 return "CYCLE_TRAP";
    if (a->ce[i] == 0 && a->ca[i])     return "SINK_ABSTRACTION";
    if (a->ca[i] >= 2 && a->ce[i] >= 2) return "PASS_THROUGH_HUB";
    if (a->ca[i] == 0 && a->ce[i])     return "ENTRY_ROOT";
    return "INTERNAL";
}


void print_graph(Snapshot* g) {
    const Raw_Graph *r = &g->raw;
    const Analysis *m = &g->metrics;

    printf("%-24s %4s %4s %6s %5s %6s  %s\n",
           "SYMBOL", "Ca", "Ce", "BLAST", "SCC", "LEVEL", "STRUCTURAL_ROLE");
    printf("------------------------------------------------------------------------\n");

    for (int i = 0; i < r->n; i++) {
        char lvl_s[16];
        if (m->lvl[i] < 0) snprintf(lvl_s, sizeof(lvl_s), "CYCLE");
        else snprintf(lvl_s, sizeof(lvl_s), "L%d", m->lvl[i]);
        printf("%-24.24s %4d %4d %6d %5d %6s  %s\n",
               r->name[i], m->ca[i], m->ce[i],
               m->blast[i], m->scc[i], lvl_s, role(m, i));
    }

    printf("------------------------------------------------------------------------\n");
    printf("SUMMARY [%s]: Nodes=%d | Edges=%d | MaxSCC=%d | CyclicNodes=%d | PropCost=%.2f%%\n",
           g->filename, r->n, m->edges, m->max_scc, m->cyc_nodes, m->prop_cost);

    return;
}


void print_graph_dif(Snapshot* new, Snapshot* base) {
    const Raw_Graph *r = &new->raw;
    const Analysis *m = &new->metrics;
    const Analysis *bm = &base->metrics;
    
    int d_cyc = m->cyc_nodes - bm->cyc_nodes;
    double d_pc = m->prop_cost - bm->prop_cost;

    printf("DELTA vs [%s]: dNodes=%+d | dEdges=%+d | dCyclic=%+d | dPropCost=%+.2f%%\n",
            base->filename, r->n - base->raw.n, m->edges - bm->edges, d_cyc, d_pc);
    if (d_cyc > 0 || m->max_scc > bm->max_scc)
        printf("VERDICT: BANDAGE DETECTED (New cyclic entanglement introduced)\n");
    else if (d_cyc < 0 || (r->n >= base->raw.n && d_pc < -0.5))
        printf("VERDICT: STRUCTURAL REFACTOR (Reduced propagation cost / cycles)\n");
    else
        printf("VERDICT: CLEAN EXTENSION (Hierarchy preserved)\n");

    return;
}
