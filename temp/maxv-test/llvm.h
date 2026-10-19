#ifndef LLVM_H                                        
#define LLVM_H


#define MAXV 8192
#define SYMLEN 128

typedef struct {
    int n;
    char name[MAXV][SYMLEN];
    unsigned char E[MAXV][MAXV];
    int kept_external;
} Raw_Graph;

int sym_id(Raw_Graph *g, const char *s);

const char *read_sym(const char *p, char *out);

/* keep_external: also wire declare-only externals (malloc, fprintf, ...)
 * into the graph; default 0 restricts the graph to module-defined symbols. */
void parse_ll(Raw_Graph *g, const char *path, int keep_external);


#endif /* LLVM_H */
