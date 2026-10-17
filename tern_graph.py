#!/usr/bin/env python3
"""
tern_graph.py - Visualize the graph representation returned by ./tern.

./tern emits a table of per-symbol metrics (Ca, Ce, BLAST, SCC, LEVEL,
STRUCTURAL_ROLE), a SUMMARY line, and (as of the EDGE dump) the raw
caller->callee edge list. This script renders it as a spatial 2D graph:

  default (--layout force):  force-directed spring embedding from the
      EDGE list; nodes that call each other cluster together.
  --layout level:            layered DAG bands (level on Y, role on X).

  - node size  = total degree (Ca + Ce)
  - node color = STRUCTURAL_ROLE
  - labels     = top-degree symbols

Usage:
  ./tern_graph.py app.ll                    # runs ./tern app.ll
  ./tern_graph.py --raw tern_output.txt     # parse saved ./tern output
  ./tern app.ll | ./tern_graph.py -         # read from stdin
  add -o out.png / --layout level / --show as needed
"""

import argparse
import math
import os
import re
import subprocess
import sys

try:
    import matplotlib
except ImportError:
    sys.exit("matplotlib is required: pip install matplotlib")

try:
    import networkx as nx
except ImportError:
    nx = None

ROLE_COLORS = {
    "ENTRY_ROOT":        "#4c9f70",  # green
    "SINK_ABSTRACTION":  "#3b6ea5",  # blue
    "PASS_THROUGH_HUB":  "#d9822b",  # orange
    "CYCLE_TRAP":        "#c0392b",  # red
    "INTERNAL":          "#8e9aaf",  # grey
}

HEADER_RE = re.compile(r"^SYMBOL\s+Ca\s+Ce\s+BLAST\s+SCC\s+LEVEL\s+STRUCTURAL_ROLE")
ROW_RE = re.compile(
    r"^(?P<symbol>\S+)\s+"
    r"(?P<ca>\d+)\s+(?P<ce>\d+)\s+(?P<blast>\d+)\s+(?P<scc>\d+)\s+"
    r"(?P<level>L\d+|CYCLE)\s+(?P<role>\S+)\s*$"
)
EDGE_RE = re.compile(r"^EDGE (?P<caller>\S+) (?P<callee>\S+)$")
SUMMARY_RE = re.compile(
    r"SUMMARY \[(?P<file>[^\]]+)\]: Nodes=(?P<nodes>\d+) \| Edges=(?P<edges>\d+) \| "
    r"MaxSCC=(?P<maxscc>\d+) \| CyclicNodes=(?P<cyclic>\d+) \| PropCost=(?P<pc>[\d.]+)%"
)


def parse_tern_output(text):
    """Parse ./tern stdout into (nodes, edges, summary, delta, verdict)."""
    nodes, edges, summary, delta, verdict = [], [], None, None, None
    for line in text.splitlines():
        if HEADER_RE.match(line) or set(line.strip()) == {"-"}:
            continue
        m = ROW_RE.match(line)
        if m:
            d = m.groupdict()
            nodes.append({
                "symbol": d["symbol"],
                "ca": int(d["ca"]),
                "ce": int(d["ce"]),
                "blast": int(d["blast"]),
                "scc": int(d["scc"]),
                "level": -1 if d["level"] == "CYCLE" else int(d["level"][1:]),
                "role": d["role"],
            })
            continue
        m = EDGE_RE.match(line)
        if m:
            edges.append((m.group("caller"), m.group("callee")))
            continue
        m = SUMMARY_RE.search(line)
        if m:
            summary = {k: (float(v) if k == "pc" else int(v)) if k != "file" else v
                       for k, v in m.groupdict().items()}
            continue
        if line.startswith("DELTA vs"):
            delta = line.strip()
        elif line.startswith("VERDICT:"):
            verdict = line.strip()
    if not nodes:
        if delta or verdict:
            sys.exit("error: tern ran in delta mode and printed no node table; "
                     "invoke with a single .ll to get a plottable graph")
        sys.exit("error: no graph table found - is this really ./tern output?")
    return nodes, edges, summary, delta, verdict


# ---------------------------------------------------------------- level layout

def layout_level(nodes):
    """Assign (x, y): y = level band, x = role column + degree rank."""
    role_order = ["ENTRY_ROOT", "PASS_THROUGH_HUB", "INTERNAL", "SINK_ABSTRACTION"]
    levels = sorted({n["level"] for n in nodes if n["level"] >= 0})
    band = {lvl: i for i, lvl in enumerate(levels)}
    cycle_y = len(levels)

    buckets = {}
    for n in nodes:
        y = cycle_y if n["level"] < 0 else band[n["level"]]
        y = cycle_y - y  # L0 at bottom, higher levels up, cycles on top
        buckets.setdefault((y, n["role"]), []).append(n)

    for (y, role), group in buckets.items():
        group.sort(key=lambda n: (n["ca"] + n["ce"]), reverse=True)
        col = role_order.index(role) if role in role_order else len(role_order)
        for i, n in enumerate(group):
            n["x"] = col + (i / max(len(group) - 1, 1)) * 0.9
            n["y"] = y

    ys = sorted({n["y"] for n in nodes}, reverse=True)
    remap = {y: len(ys) - 1 - i for i, y in enumerate(ys)}
    for n in nodes:
        n["y"] = remap[n["y"]]
    return cycle_y


def render_level(nodes, ax):
    """Draw level-band layout; returns {symbol: (x, y)}."""
    layout_level(nodes)
    deg = [n["ca"] + n["ce"] for n in nodes]
    dmax = max(deg) or 1
    ax.scatter([n["x"] for n in nodes], [n["y"] for n in nodes],
               s=[40 + 900 * math.sqrt(d / dmax) for d in deg],
               c=[ROLE_COLORS.get(n["role"], "#777777") for n in nodes],
               alpha=0.75, edgecolors="black", linewidths=0.4, zorder=3)

    yvals = sorted({n["y"] for n in nodes})
    for y in yvals:
        sample = next(n for n in nodes if n["y"] == y)
        if sample["level"] < 0:
            label, style = "CYCLE", dict(color="#c0392b", linestyle="--")
        else:
            label, style = f"L{sample['level']}", dict(color="#999999", linestyle=":")
        ax.axhline(y + 0.5, **style, linewidth=0.7, zorder=1)
        ax.text(-0.55, y, label, ha="right", va="center", fontsize=8,
                color=style["color"], fontweight="bold")

    ax.set_xlabel("structural role (degree-ordered within each level band)")
    ax.set_ylabel("topological level")
    ax.set_xticks(range(5))
    ax.set_xticklabels(["ENTRY_ROOT", "PASS_THROUGH_HUB", "INTERNAL",
                        "SINK_ABSTRACTION", "other"], rotation=20)
    ax.set_xlim(-1, 5)
    ax.set_ylim(-0.8, max(yvals) + 0.8)
    return {n["symbol"]: (n["x"], n["y"]) for n in nodes}


# ---------------------------------------------------------------- force layout

# main.c prints table symbols truncated: %-24.24s
TRUNC = 24


def render_force(nodes, edges, ax, seed, edge_alpha):
    """Draw force-directed layout; returns {table_symbol: (x, y)}."""
    if nx is None:
        sys.exit("error: force layout needs networkx (pip install networkx)")

    G = nx.DiGraph()
    G.add_edges_from(edges)
    for n in nodes:  # keep isolated table-only nodes visible
        G.add_node(n["symbol"])

    # resolve table symbols (truncated by tern) to full graph names
    by_prefix = {}
    for s in G.nodes:
        by_prefix.setdefault(s[:TRUNC], []).append(s)
    used, resolved = set(), {}
    for n in nodes:
        s = n["symbol"]
        if s in G:
            resolved[s] = s
        else:
            cands = [c for c in by_prefix.get(s[:TRUNC], []) if c not in used]
            if cands:
                resolved[s] = cands[0]
                used.add(cands[0])

    pos = nx.spring_layout(G, k=1.2 / math.sqrt(max(len(G), 1)),
                           iterations=300, seed=seed)

    from matplotlib.collections import LineCollection

    # draw edges as one collection (fast, low alpha to see structure)
    segs = [(pos[a], pos[b]) for a, b in G.edges() if a in pos and b in pos]
    ax.add_collection(LineCollection(
        segs, colors="#9aa5b1", linewidths=0.4, alpha=edge_alpha, zorder=2))

    # nodes with table metrics
    vis = [(n, resolved[n["symbol"]]) for n in nodes if n["symbol"] in resolved]
    deg = [n["ca"] + n["ce"] for n, _ in vis]
    dmax = max(deg) or 1
    ax.scatter([pos[full][0] for _, full in vis],
               [pos[full][1] for _, full in vis],
               s=[20 + 500 * math.sqrt(d / dmax) for d in deg],
               c=[ROLE_COLORS.get(n["role"], "#777777") for n, _ in vis],
               alpha=0.85, edgecolors="black", linewidths=0.4, zorder=3)

    # graph endpoints tern never listed in its table: small grey dots
    rest = [s for s in G if s not in set(resolved.values())]
    if rest:
        ax.scatter([pos[s][0] for s in rest], [pos[s][1] for s in rest],
                   s=12, c="#c8cdd3", edgecolors="black", linewidths=0.3,
                   zorder=3)

    ax.set_xlabel(f"force-directed embedding ({len(G)} nodes, {len(G.edges())} edges; "
                  f"grey = unlisted endpoints)")
    ax.set_ylabel("")
    ax.set_xticks([])
    ax.set_yticks([])
    return {s: pos[full] for s, full in resolved.items()}


# ---------------------------------------------------------------- common

def render(nodes, edges, summary, delta, verdict, out, show, dpi, label_top,
           layout, seed, edge_alpha):
    use_agg = not show
    if use_agg:
        matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from matplotlib.lines import Line2D

    if layout == "force" and not edges:
        print("note: no EDGE lines in input; falling back to level layout")
        layout = "level"

    fig, ax = plt.subplots(figsize=(16, 11))

    if layout == "force":
        pos = render_force(nodes, edges, ax, seed, edge_alpha)
    else:
        pos = render_level(nodes, ax)

    # label the highest-degree nodes
    top = sorted(nodes, key=lambda n: n["ca"] + n["ce"], reverse=True)[:label_top]
    for n in top:
        p = pos.get(n["symbol"])
        if p is None:
            continue
        ax.annotate(n["symbol"], p, textcoords="offset points",
                    xytext=(5, 5), fontsize=7, zorder=4)

    if summary:
        title = (f"{summary['file']}: {summary['nodes']} nodes, "
                 f"{summary['edges']} edges | MaxSCC={summary['maxscc']} "
                 f"| Cyclic={summary['cyclic']} | PropCost={summary['pc']}%")
    else:
        title = "tern graph"
    if delta:
        title += f"\n{delta}"
    if verdict:
        title += f"  --  {verdict}"
    ax.set_title(title, fontsize=11)

    handles = [Line2D([0], [0], marker="o", color="w", markerfacecolor=c,
                      markersize=9, label=r, alpha=0.85)
               for r, c in ROLE_COLORS.items()]
    ax.legend(handles=handles, loc="upper right", fontsize=8, title="role")

    fig.tight_layout()
    if out:
        fig.savefig(out, dpi=dpi)
        print(f"saved: {out}")
    if show:
        plt.show()


def main():
    ap = argparse.ArgumentParser(description="Graph the output of ./tern")
    ap.add_argument("input", nargs="?", default="-",
                    help=".ll file (runs ./tern on it), saved tern output "
                         "with --raw, or '-' for stdin")
    ap.add_argument("baseline", nargs="?", help="optional baseline .ll (delta mode)")
    ap.add_argument("--raw", action="store_true",
                    help="treat INPUT as a pre-captured ./tern output file")
    ap.add_argument("--tern", default="./tern", help="path to tern binary")
    ap.add_argument("--layout", choices=["force", "level"], default="force",
                    help="spatial force-directed (default) or level bands")
    ap.add_argument("-o", "--out", default=None, help="output image (default tern_graph.png)")
    ap.add_argument("--dpi", type=int, default=150)
    ap.add_argument("--show", action="store_true", help="open an interactive window")
    ap.add_argument("--labels", type=int, default=15,
                    help="how many top-degree symbols to label")
    ap.add_argument("--seed", type=int, default=42, help="spring layout seed")
    ap.add_argument("--edge-alpha", type=float, default=0.25,
                    help="edge line opacity in force layout")
    args = ap.parse_args()

    if args.raw or args.input == "-":
        if args.input == "-" and sys.stdin.isatty() and not args.raw:
            sys.exit("error: no stdin; pass an .ll file or a --raw output file")
        text = sys.stdin.read() if args.input == "-" else open(args.input).read()
    else:
        if not os.access(args.tern, os.X_OK):
            sys.exit(f"error: {args.tern} not executable")
        cmd = [args.tern, args.input]
        if args.baseline:
            cmd.append(args.baseline)
        text = subprocess.run(cmd, capture_output=True, text=True, check=True).stdout

    nodes, edges, summary, delta, verdict = parse_tern_output(text)
    out = args.out or "tern_graph.png"
    render(nodes, edges, summary, delta, verdict, out, args.show, args.dpi,
           args.labels, args.layout, args.seed, args.edge_alpha)


if __name__ == "__main__":
    main()
