#ifndef LLVM_H                                        
#define LLVM_H


#define MAXV 2048
#define SYMLEN 128

typedef struct {
    int n;
    char name[MAXV][SYMLEN];
    unsigned char E[MAXV][MAXV];
} Raw_Graph;

int sym_id(Raw_Graph *g, const char *s);

const char *read_sym(const char *p, char *out);

void parse_ll(Raw_Graph *g, const char *path);


#endif /* LLVM_H */
