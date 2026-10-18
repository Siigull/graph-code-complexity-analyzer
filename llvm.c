/**
 * @file llvm.c
 * @author Sigull
 * @brief 
 * @date 2026-10-17
 * 
 */

#include "llvm.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>

int sym_id(Raw_Graph *g, const char *s) {
    assert(strlen(s) < SYMLEN && "symbol name must be shorter than SYMLEN");
    assert(g->n < MAXV && "INCREASE MAXV");

    for (int i = 0; i < g->n; i++)
        if (!strcmp(g->name[i], s)) return i;
        
    snprintf(g->name[g->n], SYMLEN, "%s", s);
    return g->n++;
}


const char *read_sym(const char *p, char *out) {
    int i = 0;
    if (*p == '"') { /* Handle quoted LLVM identifiers: @"..." */
        for (p++; *p && *p != '"'; p++) {
            assert(i < SYMLEN - 1 && "quoted symbol must be shorter than SYMLEN");
            out[i++] = *p;
        }
        if (*p == '"') p++;
    } else {
        while (*p && (isalnum((unsigned char)*p) || strchr("_.$", *p))) {
            assert(i < SYMLEN - 1 && "symbol must be shorter than SYMLEN");
            out[i++] = *p;
            p++;
        }
    }
    out[i] = '\0';
    return p;
}


/* Build a "fn:block" node name, asserting it fits in SYMLEN (no silent truncation). */
static void mk_node_name(char *out, const char *fn, const char *block) {
    int n = snprintf(out, SYMLEN, "%s:%s", fn, block);
    assert(n >= 0 && n < SYMLEN && "node name must be shorter than SYMLEN");
}


void parse_ll(Raw_Graph *raw, const char *path) {
    FILE *f = fopen(path, "r");
    if (!f) { perror(path); exit(1); }
    char line[4096], fn[SYMLEN] = "", sym[SYMLEN], node_name[SYMLEN];
    int cur = -1, depth = 0;

    while (fgets(line, sizeof(line), f)) {
        char *semi = strchr(line, ';');
        if (semi) *semi = '\0';
        char *p = line;
        while (isspace((unsigned char)*p)) p++;

        if (!fn[0] && !strncmp(p, "define ", 7)) {
            char *at = strchr(p, '@'), *br = strchr(p, '{');
            if (at && br) {
                read_sym(at + 1, fn);
                mk_node_name(node_name, fn, "entry");
                cur = sym_id(raw, node_name); /* Function entry block */
                depth = 0; p = br;
            }
        }
        if (fn[0]) {
            /* Detect Basic Block label at start of line, e.g. "spot_auth:" */
            char *colon = strchr(p, ':');
            if (colon && colon > p && !strchr(p, ' ') && !strchr(p, '=')) {
                *colon = '\0';
                mk_node_name(node_name, fn, p);
                cur = sym_id(raw, node_name);
                p = colon + 1;
            }
            /* 1. Wire internal control-flow edges: "label %target_block" */
            for (char *q = p; (q = strstr(q, "label %")) != NULL; ) {
                q = (char *)read_sym(q + 7, sym);
                if (sym[0]) {
                    mk_node_name(node_name, fn, sym);
                    int dst = sym_id(raw, node_name);
                    if (dst != cur) raw->E[cur][dst] = 1;
                }
            }
            /* 2. Wire external function/global edges: "@target_func" */
            for (char *q = p; (q = strchr(q, '@')) != NULL; ) {
                q = (char *)read_sym(q + 1, sym);
                if (!sym[0] || sym[0] == '.' || !strncmp(sym, "llvm.", 5)) continue;
                mk_node_name(node_name, sym, "entry");
                int dst = sym_id(raw, node_name);
                if (dst != cur) raw->E[cur][dst] = 1;
            }
            for (char *b = p; *b; b++) depth += (*b == '{') - (*b == '}');
            if (depth <= 0) { fn[0] = '\0'; cur = -1; }
        }
    }
    fclose(f);
}
