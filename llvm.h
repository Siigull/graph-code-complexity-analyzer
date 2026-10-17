#ifndef LLVM_H                                        
#define LLVM_H

#include "graph.h"


static int sym_id(Graph *g, const char *s);

static const char *read_sym(const char *p, char *out);

static void parse_ll(Graph *g, const char *path);


#endif /* LLVM_H */
