/**
 * @file llvm.c
 * @author Sigull
 * @brief 
 * @date 2026-10-17
 * 
 */

#include "llvm.h"
#include <stdio.h>


static int sym_id(Raw_Graph *g, const char *s) {
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


static void parse_ll(Raw_Graph *g, const char *path) {
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
