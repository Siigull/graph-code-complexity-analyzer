#ifndef GRAPH_H                                        
#define GRAPH_H

#define MAXV 512
#define SYMLEN 64

// NOTE(Sigull): Weirdly split, Eh

typedef struct {
    int n, edges, max_scc, cyc_nodes;
    double prop_cost;
    char name[MAXV][SYMLEN];
    unsigned char E[MAXV][MAXV], R[MAXV][MAXV];
    int ca[MAXV], ce[MAXV], scc[MAXV], lvl[MAXV], blast[MAXV];
} Graph;

#endif /* GRAPH_H */
