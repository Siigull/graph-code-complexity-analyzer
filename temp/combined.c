/* ir_core.c - Minimal LLVM IR Architectural Graph & Entanglement Analyzer
 * Build: cc -O2 -Wall -Wextra ir_core.c -o ir_core
 * Usage: ./ir_core <current.ll> [baseline.ll]
 */
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int n, edges, max_scc, cyc_nodes;
    double prop_cost;
    char name[MAXV][SYMLEN];
    unsigned char E[MAXV][MAXV], R[MAXV][MAXV];
    int ca[MAXV], ce[MAXV], scc[MAXV], lvl[MAXV], blast[MAXV];
} Graph;

static int sym_id(Graph *g, const char *s) {
    for (int i = 0; i < g->n; i++)
        if (!strcmp(g->name[i], s)) return i;
    if (g->n >= MAXV) { fprintf(stderr, "MAXV exceeded\n"); exit(1); }
    snprintf(g->name[g->n], SYMLEN, "%s", s);
    return g->n++;
}

static const char *read_sym(const char *p, char *out) {
    int i = 0;
    if (*p == '"') { /* Handle quoted LLVM identifiers: @"..." */
        for (p++; *p && *p != '"'; p++)
            if (i < SYMLEN - 1) out[i++] = *p;
        if (*p == '"') p++;
    } else {
        while (*p && (isalnum((unsigned char)*p) || strchr("_.$", *p)))
            if (i < SYMLEN - 1) out[i++] = *p++; else p++;
    }
    out[i] = '\0';
    return p;
}

static void parse_ll(Graph *g, const char *path) {
    FILE *f = fopen(path, "r");
    if (!f) { perror(path); exit(1); }
    char line[4096], sym[SYMLEN];
    int cur = -1, depth = 0;

    while (fgets(line, sizeof(line), f)) {
        char *semi = strchr(line, ';');
        if (semi) *semi = '\0';
        char *p = line;
        while (isspace((unsigned char)*p)) p++;

        if (cur < 0 && !strncmp(p, "define ", 7)) {
            char *at = strchr(p, '@'), *br = strchr(p, '{');
            if (at && br) {
                read_sym(at + 1, sym);
                if (sym[0]) { cur = sym_id(g, sym); depth = 0; p = br; }
            }
        }
        if (cur >= 0) {
            for (char *q = p; (q = strchr(q, '@')) != NULL; ) {
                q = (char *)read_sym(q + 1, sym);
                if (!sym[0] || sym[0] == '.' || !strncmp(sym, "llvm.", 5)) continue;
                int dst = sym_id(g, sym);
                if (dst >= 0 && dst != cur) g->E[cur][dst] = 1;
            }
            for (char *b = p; *b; b++) depth += (*b == '{') - (*b == '}');
            if (depth <= 0) cur = -1;
        }
    }
    fclose(f);
}

static void analyze(Graph *g) {
    int n = g->n, reach_pairs = n;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (g->E[i][j]) { g->R[i][j] = 1; g->ce[i]++; g->ca[j]++; g->edges++; }

    /* Warshall Transitive Closure: R[i][j] = 1 iff i transitively depends on j */
    for (int k = 0; k < n; k++)
        for (int i = 0; i < n; i++)
            if (g->R[i][k])
                for (int j = 0; j < n; j++)
                    g->R[i][j] |= g->R[k][j];

    g->max_scc = n ? 1 : 0;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++)
            if (i != j && g->R[j][i]) { g->blast[i]++; reach_pairs++; }
        if (g->R[i][i]) {
            g->cyc_nodes++;
            g->lvl[i] = -1;
            for (int j = 0; j < n; j++)
                if (g->R[i][j] && g->R[j][i]) g->scc[i]++;
            if (g->scc[i] > g->max_scc) g->max_scc = g->scc[i];
        } else {
            g->scc[i] = 1;
            g->lvl[i] = 0;
        }
    }

    /* Topological Levelization: Sinks = 0, Callers = 1 + max(callee level) */
    for (int step = 0; step < n; step++)
        for (int i = 0; i < n; i++)
            if (g->lvl[i] >= 0)
                for (int j = 0; j < n; j++)
                    if (g->E[i][j]) {
                        int d = (g->lvl[j] < 0 ? 0 : g->lvl[j]) + 1;
                        if (g->lvl[i] < d) g->lvl[i] = d;
                    }

    g->prop_cost = n ? (100.0 * reach_pairs) / (n * n) : 0.0;
}

static const char *role(const Graph *g, int i) {
    if (g->scc[i] > 1)              return "CYCLE_TRAP";
    if (g->ce[i] == 0 && g->ca[i])  return "SINK_ABSTRACTION";
    if (g->ca[i] >= 2 && g->ce[i] >= 2) return "PASS_THROUGH_HUB";
    if (g->ca[i] == 0 && g->ce[i])  return "ENTRY_ROOT";
    return "INTERNAL";
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <current.ll> [baseline.ll]\n", argv[0]);
        return 1;
    }
    Graph *cur = calloc(1, sizeof(Graph));
    parse_ll(cur, argv[1]);
    analyze(cur);

    printf("%-24s %4s %4s %6s %5s %6s  %s\n",
           "SYMBOL", "Ca", "Ce", "BLAST", "SCC", "LEVEL", "STRUCTURAL_ROLE");
    printf("------------------------------------------------------------------------\n");
    for (int i = 0; i < cur->n; i++) {
        char lvl_s[16];
        if (cur->lvl[i] < 0) snprintf(lvl_s, sizeof(lvl_s), "CYCLE");
        else snprintf(lvl_s, sizeof(lvl_s), "L%d", cur->lvl[i]);
        printf("%-24.24s %4d %4d %6d %5d %6s  %s\n",
               cur->name[i], cur->ca[i], cur->ce[i],
               cur->blast[i], cur->scc[i], lvl_s, role(cur, i));
    }
    printf("------------------------------------------------------------------------\n");
    printf("SUMMARY [%s]: Nodes=%d | Edges=%d | MaxSCC=%d | CyclicNodes=%d | PropCost=%.2f%%\n",
           argv[1], cur->n, cur->edges, cur->max_scc, cur->cyc_nodes, cur->prop_cost);

    if (argc >= 3) {
        Graph *base = calloc(1, sizeof(Graph));
        parse_ll(base, argv[2]);
        analyze(base);
        int d_cyc = cur->cyc_nodes - base->cyc_nodes;
        double d_pc = cur->prop_cost - base->prop_cost;
        printf("DELTA vs [%s]: dNodes=%+d | dEdges=%+d | dCyclic=%+d | dPropCost=%+.2f%%\n",
               argv[2], cur->n - base->n, cur->edges - base->edges, d_cyc, d_pc);
        if (d_cyc > 0 || cur->max_scc > base->max_scc)
            printf("VERDICT: BANDAGE DETECTED (New cyclic entanglement introduced)\n");
        else if (d_cyc < 0 || (cur->n >= base->n && d_pc < -0.5))
            printf("VERDICT: STRUCTURAL REFACTOR (Reduced propagation cost / cycles)\n");
        else
            printf("VERDICT: CLEAN EXTENSION (Hierarchy preserved)\n");
        free(base);
    }
    free(cur);
    return 0;
}
