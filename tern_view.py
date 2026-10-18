#!/usr/bin/env python3
"""
tern_view.py - Interactive game-style graph viewer for ./tern output.

Reuses the parsing and layout logic from tern_graph.py, but renders to a
real window with a 60fps render loop (pygame) instead of matplotlib:

  - pan (drag empty space) and zoom (wheel, at cursor)
  - hover a node -> highlight + tooltip with its full tern metrics row
  - drag a node -> it is pinned to the cursor while the spring simulation
    keeps running, so its neighborhood gets pulled along live
  - live force-directed physics (SPACE to pause/resume, R to re-seed,
    L to toggle force <-> level-band layout, S to save a screenshot)
  - left sidebar: list of every node; click a row to show/hide that node
    in the graph (N toggles the sidebar, hover a row to locate the node)

Usage (same input conventions as tern_graph.py):
  ./tern_view.py app.ll                  # runs ./tern app.ll
  ./tern_view.py --raw tern_output.txt
  ./tern app.ll | ./tern_view.py -
"""

import argparse
import math
import os
import random
import subprocess
import sys

import numpy as np
import pygame

from tern_graph import parse_tern_output, layout_level, ROLE_COLORS

# interactive world is bigger than the unit square spring_layout_numpy
# normalizes to; physics runs directly in world units
WORLD = 100.0

BG = (16, 18, 22)
EDGE_COLOR = (96, 104, 116)
TEXT = (200, 206, 214)
DIM = (120, 126, 134)
PANEL = (28, 32, 38)

ROLE_RGB = {r: tuple(int(c[i:i + 2], 16) for i in (1, 3, 5))
            for r, c in ROLE_COLORS.items()}
UNKNOWN_RGB = (200, 205, 211)   # endpoints not in tern's table
HOVER_RING = (245, 220, 90)

# left node-list sidebar geometry (pixels)
SB_W = 270
SB_TITLE_H = 40
SB_ROW = 17
SB_SORTS = ("name", "degree", "role")


def hex_rgb(c):
    return tuple(int(c[i:i + 2], 16) for i in (1, 3, 5))


# ---------------------------------------------------------------- graph setup

def build_universe(nodes, edges):
    """Table symbols + every EDGE endpoint, with table metrics attached.

    Returns dict with:
      names   list of symbols (index order)
      src,dst int arrays of edge endpoints
      info    {symbol: node dict} for table symbols
      degree  float array, total degree per node (table Ca+Ce, or count
              of incident edges for unlisted endpoints)
    """
    names = {n["symbol"] for n in nodes}
    for a, b in edges:
        names.add(a)
        names.add(b)
    names = sorted(names)
    idx = {s: i for i, s in enumerate(names)}

    src = np.array([idx[a] for a, b in edges], dtype=np.int64) if edges \
        else np.zeros(0, np.int64)
    dst = np.array([idx[b] for a, b in edges], dtype=np.int64) if edges \
        else np.zeros(0, np.int64)

    degree = np.zeros(len(names), dtype=np.float64)
    if len(src):
        np.add.at(degree, src, 1.0)
        np.add.at(degree, dst, 1.0)
    info = {}
    for n in nodes:
        degree[idx[n["symbol"]]] = n["ca"] + n["ce"]
        info[n["symbol"]] = n
    return {"names": names, "idx": idx, "src": src, "dst": dst,
            "info": info, "degree": degree}


def initial_force_positions(univ, seed, iterations):
    from tern_graph import spring_layout_numpy
    pos = spring_layout_numpy(len(univ["names"]), (univ["src"], univ["dst"]),
                              iterations, seed, None)
    return (pos * WORLD).astype(np.float64)


def level_positions(univ):
    """Level-band layout in world coords; unknown endpoints get stacked
    in the 'other' column next to their highest-level table neighbor."""
    nodes = list(univ["info"].values())
    layout_level(nodes)  # sets n["x"], n["y"]
    pos = np.zeros((len(univ["names"]), 2), dtype=np.float64)
    for n in nodes:
        pos[univ["idx"][n["symbol"]]] = (n["x"] * 14.0, -n["y"] * 9.0)

    known = set(univ["info"])
    adj = {}
    for a, b in zip(univ["src"], univ["dst"]):
        adj.setdefault(a, set()).add(b)
        adj.setdefault(b, set()).add(a)
    stack = {}
    for i, s in enumerate(univ["names"]):
        if s in known:
            continue
        nbrs = [univ["info"][univ["names"][j]]
                for j in adj.get(i, ()) if univ["names"][j] in known]
        lvl = max((n["level"] for n in nbrs if n["level"] >= 0), default=-1)
        col = stack.get(lvl, 0)
        stack[lvl] = col + 1
        pos[i] = (4.6 * 14.0 + (col % 25) * 0.4,
                  (-lvl * 9.0 if lvl >= 0 else 1.5) + (col // 25) * 0.8)
    return pos


# ---------------------------------------------------------------- live physics

def fr_step(pos, src, dst, k, temp):
    """One Fruchterman-Reingold iteration in world units.
    Same force model as tern_graph.spring_layout_numpy; pinned/dragged
    nodes are restored by the caller after each step."""
    dx = pos[:, 0][:, None] - pos[:, 0][None, :]
    dy = pos[:, 1][:, None] - pos[:, 1][None, :]
    dist = np.sqrt(dx * dx + dy * dy)
    np.fill_diagonal(dist, 1.0)
    np.maximum(dist, 0.01, out=dist)
    d2 = dist * dist
    # anti-overlap: extra 1/d^4 repulsion below ~k/2 so nodes can't sit on
    # top of each other; smooth, negligible at normal spacing (25% extra at
    # d=k, none beyond), and still temp-capped so it cannot explode
    s2 = (k / 2.0) ** 2
    inv2 = 1.0 / d2 + s2 / (d2 * d2)
    k2 = k * k

    fx = (k2 * inv2 * dx).sum(axis=1)
    fy = (k2 * inv2 * dy).sum(axis=1)

    if len(src):
        ex = pos[dst, 0] - pos[src, 0]
        ey = pos[dst, 1] - pos[src, 1]
        ed = np.maximum(np.sqrt(ex * ex + ey * ey), 0.01)
        coef = ed / k
        np.add.at(fx, src, coef * ex)
        np.add.at(fy, src, coef * ey)
        np.add.at(fx, dst, -coef * ex)
        np.add.at(fy, dst, -coef * ey)

    disp = np.stack((fx, fy), axis=1)
    norm = np.maximum(np.sqrt((disp * disp).sum(axis=1)), 1e-6)
    step = np.minimum(norm, temp) / norm
    pos += disp * step[:, None]


def resolve_overlaps(pos, radii, cap, pad=0.5, relax=0.8, iters=3,
                    eps=0.1):
    """Post-pass after fr_step: push node circles apart so big nodes can
    never sit on top of each other. Directly moves positions (not a force)
    toward zero penetration for every overlapping pair. Kept gentle on
    purpose so it cannot fight the springs or inflate the layout:
      - pairs overlapping by less than `eps` (sub-pixel) are ignored
      - per-node push is capped at `cap` (well under fr_step's temp)
    Springs may pull nodes back together next step, but this runs last
    each frame, so the drawn state is always (nearly) overlap-free.
    Pinned/dragged nodes are restored by the caller afterwards."""
    n = len(pos)
    if n < 2:
        return
    sep = radii[:, None] + radii[None, :] + pad
    for _ in range(iters):
        dx = pos[:, 0][:, None] - pos[:, 0][None, :]
        dy = pos[:, 1][:, None] - pos[:, 1][None, :]
        d = np.sqrt(dx * dx + dy * dy)
        np.fill_diagonal(d, np.inf)
        pen = sep - d
        pen[pen < eps] = 0.0        # kissing pairs: leave them be
        if not pen.any():
            return
        coincident = d <= 1e-6
        d = np.maximum(d, 1e-6)
        # coincident pairs split along +x/-x by index order (opposite dirs,
        # so they always separate instead of drifting together)
        split = np.sign(np.arange(n)[:, None] - np.arange(n)[None, :])
        ux = np.where(coincident, split, dx / d)
        uy = np.where(coincident, 0.0, dy / d)
        push = np.stack(((pen * ux).sum(axis=1), (pen * uy).sum(axis=1)), axis=1)
        disp = 0.5 * relax * push
        norm = np.maximum(np.sqrt((disp * disp).sum(axis=1)), 1e-6)
        scale = np.minimum(norm, cap) / norm
        pos += disp * scale[:, None]


# ---------------------------------------------------------------- camera

class Camera:
    def __init__(self, w, h):
        self.scale = 7.0          # pixels per world unit
        self.cx, self.cy = WORLD / 2, WORLD / 2   # world point at screen center
        self.w, self.h = w, h

    def to_screen(self, pos):
        """array (N,2) world -> (N,2) screen ints"""
        s = (pos - (self.cx, self.cy)) * self.scale
        return np.stack((s[:, 0] + self.w / 2, self.h / 2 - s[:, 1]), axis=1)

    def to_world(self, mx, my):
        return ((mx - self.w / 2) / self.scale + self.cx,
                (self.h / 2 - my) / self.scale + self.cy)

    def zoom(self, mx, my, factor):
        wx, wy = self.to_world(mx, my)
        self.scale = min(max(self.scale * factor, 0.05), 400.0)
        # keep the world point under the cursor fixed
        self.cx = wx - (mx - self.w / 2) / self.scale
        self.cy = wy + (my - self.h / 2) / self.scale

    def pan(self, dx_px, dy_px):
        self.cx -= dx_px / self.scale
        self.cy += dy_px / self.scale


# ---------------------------------------------------------------- app

def node_radius(univ, i, dmax):
    return 0.5 + 3.2 * math.sqrt(univ["degree"][i] / dmax)


class App:
    def __init__(self, univ, pos, layout, summary, delta, verdict, warning, args):
        self.univ = univ
        self.pos = pos
        self.layout = layout
        self.summary, self.delta, self.verdict = summary, delta, verdict
        self.warning = warning
        self.args = args
        self.n = len(univ["names"])
        self.k = WORLD / math.sqrt(self.n)
        self.dmax = max(univ["degree"].max(), 1.0)
        # visual radii (same formula as node_radius) for overlap resolution
        self.radii = 0.5 + 3.2 * np.sqrt(univ["degree"] / self.dmax)

        pygame.init()
        pygame.display.set_caption("tern view")
        self.screen = pygame.display.set_mode((args.width, args.height),
                                              pygame.RESIZABLE)
        # Font(None) = pygame's bundled font: avoids SysFont's fc-list scan,
        # which can time out on WSL
        self.font = pygame.font.Font(None, 19)
        self.font_big = pygame.font.Font(None, 22)
        self.font_small = pygame.font.Font(None, 15)
        self.clock = pygame.time.Clock()

        self.cam = Camera(args.width, args.height)
        self.physics = layout == "force"
        self.temp = 0.45            # interactive temperature, world units
        self.drag_idx = -1
        self.hover_idx = -1
        self.panning = False
        self.mouse = (0, 0)
        self.frame = 0
        self.fps = 0.0
        self.help = True
        self.pinned = np.zeros(self.n, dtype=bool)
        self.pin_pos = np.zeros((self.n, 2))

        # node-list sidebar (N to toggle); hidden nodes are excluded from
        # drawing, edges, hover and the physics simulation
        self.sidebar = True
        self.visible = np.ones(self.n, dtype=bool)
        self.sb_scroll = 0
        self.sb_hover = -1
        self.sb_selected = -1
        self.sb_set_sort("name")
        self._rebuild_active()

        # top-degree table symbols get persistent labels
        table_deg = [(univ["degree"][i], i)
                     for i, s in enumerate(univ["names"]) if s in univ["info"]]
        table_deg.sort(reverse=True)
        self.labeled = {i for _, i in table_deg[:args.labels]}

    # ------------------------------------------------------------ events

    def handle_events(self):
        for ev in pygame.event.get():
            if ev.type == pygame.QUIT:
                return False
            if ev.type == pygame.VIDEORESIZE:
                self.screen = pygame.display.set_mode(ev.size, pygame.RESIZABLE)
                self.cam.w, self.cam.h = ev.size
            elif ev.type == pygame.KEYDOWN:
                if ev.key in (pygame.K_ESCAPE, pygame.K_q):
                    return False
                elif ev.key == pygame.K_SPACE:
                    self.physics = not self.physics if self.layout == "force" \
                        else self.physics
                elif ev.key == pygame.K_r:
                    if self.layout == "force":
                        self.pos = initial_force_positions(
                            self.univ, random.randrange(1 << 30),
                            self.args.iterations)
                elif ev.key == pygame.K_l:
                    self.layout = "level" if self.layout == "force" else "force"
                    self.pos = (level_positions(self.univ) if self.layout == "level"
                                else initial_force_positions(
                                    self.univ, self.args.seed, self.args.iterations))
                    self.physics = self.layout == "force"
                elif ev.key == pygame.K_h:
                    self.help = not self.help
                elif ev.key == pygame.K_n:
                    self.sidebar = not self.sidebar
                elif ev.key == pygame.K_p and self.hover_idx >= 0:
                    i = self.hover_idx
                    self.pinned[i] = not self.pinned[i]
                    if self.pinned[i]:
                        self.pin_pos[i] = self.pos[i]
                elif ev.key == pygame.K_s:
                    out = self.args.screenshot
                    pygame.image.save(self.screen, out)
                    print(f"saved: {out}")
            elif ev.type == pygame.MOUSEWHEEL:
                # MOUSEWHEEL carries no .pos in pygame 2; use live cursor
                mx, my = pygame.mouse.get_pos()
                if self.sidebar and mx < SB_W:
                    self.sb_scroll = max(0, min(self.sb_scroll - ev.y * 5,
                                                self.n - self.sb_rows()))
                else:
                    self.cam.zoom(mx, my, 1.25 if ev.y > 0 else 0.8)
            elif ev.type == pygame.MOUSEBUTTONDOWN:
                if ev.button == 1:
                    if self.sidebar and ev.pos[0] < SB_W:
                        if ev.pos[1] < SB_TITLE_H:   # header: cycle sort mode
                            self.sb_set_sort(SB_SORTS[
                                (SB_SORTS.index(self.sb_sort) + 1) % len(SB_SORTS)])
                        else:
                            i = self.sb_row_at(ev.pos[1])
                            if i >= 0:
                                self.toggle_node(i)
                    elif self.hover_idx >= 0:
                        self.sb_select(self.hover_idx)
                        self.drag_idx = self.hover_idx
                    else:
                        self.panning = True
                elif ev.button == 3:
                    if not (self.sidebar and ev.pos[0] < SB_W):
                        self.panning = True
            elif ev.type == pygame.MOUSEBUTTONUP:
                if ev.button == 1 and self.drag_idx >= 0:
                    self.drag_idx = -1
                if ev.button in (1, 3):
                    self.panning = False
            elif ev.type == pygame.MOUSEMOTION:
                last = self.mouse
                self.mouse = ev.pos
                if self.panning:
                    self.cam.pan(ev.pos[0] - last[0], ev.pos[1] - last[1])
        return True

    # ------------------------------------------------------------ visibility

    def _rebuild_active(self):
        """Cache the visible node set and the edges/physics views of it."""
        act = np.flatnonzero(self.visible)
        self.active = act
        self.radii_local = self.radii[act]
        rank = np.full(self.n, -1, dtype=np.int64)
        rank[act] = np.arange(len(act))
        src, dst = self.univ["src"], self.univ["dst"]
        if len(src):
            keep = self.visible[src] & self.visible[dst]
            self.active_edges = (src[keep], dst[keep])
            self.asrc, self.adst = rank[src[keep]], rank[dst[keep]]
        else:
            self.active_edges = (src, dst)
            self.asrc = self.adst = np.zeros(0, np.int64)

    def toggle_node(self, i):
        self.visible[i] = not self.visible[i]
        self._rebuild_active()
        if not self.visible[i]:
            self.pinned[i] = False
            if self.drag_idx == i:
                self.drag_idx = -1
        if self.hover_idx == i:
            self.hover_idx = -1

    def sb_set_sort(self, mode):
        """Rebuild the row order of the node list."""
        self.sb_sort = mode
        names, info = self.univ["names"], self.univ["info"]
        if mode == "degree":
            self.sb_order = np.argsort(-self.univ["degree"], kind="stable")
        elif mode == "role":
            rank = {r: i for i, r in enumerate(
                ("ENTRY_ROOT", "SINK_ABSTRACTION", "PASS_THROUGH_HUB",
                 "CYCLE_TRAP", "INTERNAL"))}
            self.sb_order = np.array(sorted(
                range(self.n),
                key=lambda i: (rank.get(info[names[i]]["role"], 99)
                               if names[i] in info else 99, names[i])),
                dtype=np.int64)
        else:   # name
            self.sb_order = np.arange(self.n)

    def sb_select(self, i):
        """Mark node i as selected; scroll the list so its row is on screen"""
        self.sb_selected = i
        if not self.sidebar or i < 0:
            return
        row = int(np.flatnonzero(self.sb_order == i)[0])
        rows = self.sb_rows()
        if not self.sb_scroll <= row < self.sb_scroll + rows:
            self.sb_scroll = max(0, min(row - rows // 3, self.n - rows))

    def sb_rows(self):
        return max(1, (self.cam.h - SB_TITLE_H - 8) // SB_ROW)

    def sb_row_at(self, my):
        """node index of the sidebar row at pixel y, or -1"""
        if my < SB_TITLE_H:
            return -1
        k = (my - SB_TITLE_H) // SB_ROW + self.sb_scroll
        return self.sb_order[k] if 0 <= k < self.n else -1

    # ------------------------------------------------------------ per-frame

    def update_hover(self):
        if self.sidebar and self.mouse[0] < SB_W:
            self.hover_idx = -1
            self.sb_hover = self.sb_row_at(self.mouse[1])
            return
        self.sb_hover = -1
        wx, wy = self.cam.to_world(*self.mouse)
        d = np.hypot(self.pos[:, 0] - wx, self.pos[:, 1] - wy)
        d[~self.visible] = np.inf
        i = int(np.argmin(d)) if self.n else -1
        r = node_radius(self.univ, i, self.dmax) + 1.5 / self.cam.scale
        self.hover_idx = i if self.n and d[i] <= r else -1

    def step_physics(self):
        act = self.active
        if not len(act):
            return
        sub = self.pos[act]
        pin_l = self.pinned[act]
        pin_pos_l = self.pin_pos[act]
        drag_l = -1
        if self.drag_idx >= 0 and self.visible[self.drag_idx]:
            drag_l = int(np.searchsorted(act, self.drag_idx))
            wx, wy = self.cam.to_world(*self.mouse)
            sub[drag_l] = (wx, wy)
        for _ in range(self.args.steps):
            fr_step(sub, self.asrc, self.adst, self.k, self.temp)
            sub[pin_l] = pin_pos_l[pin_l]
            if drag_l >= 0:
                sub[drag_l] = self.cam.to_world(*self.mouse)
            resolve_overlaps(sub, self.radii_local, self.temp / 3.0)
            sub[pin_l] = pin_pos_l[pin_l]      # pins/drag win over collisions
            if drag_l >= 0:
                sub[drag_l] = self.cam.to_world(*self.mouse)
        self.pos[act] = sub   # self.pos[act] is a copy; write results back

    # ------------------------------------------------------------ drawing

    def draw(self):
        scr = self.screen
        scr.fill(BG)

        if self.layout == "level":
            self.draw_bands()

        cam = self.cam
        pts = cam.to_screen(self.pos).astype(np.int32)

        # edges (only between visible nodes)
        ec = EDGE_COLOR
        src, dst = self.active_edges
        for a, b in zip(src, dst):
            pygame.draw.line(scr, ec, pts[a], pts[b], 1)

        # nodes
        info = self.univ["info"]
        names = self.univ["names"]
        for i in range(self.n):
            if not self.visible[i]:
                continue
            r = max(node_radius(self.univ, i, self.dmax) * cam.scale, 1.0)
            col = ROLE_RGB.get(info[names[i]]["role"], UNKNOWN_RGB) \
                if names[i] in info else UNKNOWN_RGB
            pygame.draw.circle(scr, col, pts[i], int(r))
            if r > 2.5:
                pygame.draw.circle(scr, (0, 0, 0), pts[i], int(r), 1)

        # hover highlight
        if self.hover_idx >= 0:
            i = self.hover_idx
            r = max(node_radius(self.univ, i, self.dmax) * cam.scale, 2.0)
            pygame.draw.circle(scr, HOVER_RING, pts[i], int(r) + 3, 2)
            self.draw_tooltip(i, pts[i])
        elif self.sb_hover >= 0:      # hovered sidebar row -> locate node
            i = self.sb_hover
            r = max(node_radius(self.univ, i, self.dmax) * cam.scale, 2.0)
            pygame.draw.circle(scr, HOVER_RING, pts[i], int(r) + 3, 2)

        # labels for top-degree nodes (only once they're readable)
        for i in self.labeled:
            if not self.visible[i]:
                continue
            r = node_radius(self.univ, i, self.dmax) * cam.scale
            if r < 6 or (i == self.hover_idx):
                continue
            surf = self.font_small.render(names[i], True, TEXT)
            scr.blit(surf, (pts[i][0] + int(r) + 3, pts[i][1] - surf.get_height() // 2))

        if self.sidebar:
            self.draw_sidebar()
        self.draw_hud()

    def draw_bands(self):
        """level-mode horizontal band separators with L# / CYCLE labels"""
        scr, cam = self.screen, self.cam
        seen = {}
        for i, s in enumerate(self.univ["names"]):
            if not self.visible[i]:
                continue
            n = self.univ["info"].get(s)
            if n and n["level"] >= 0:
                seen.setdefault(n["level"], self.pos[i][1])
        for lvl, wy in seen.items():
            sy = int(cam.h / 2 - (wy - cam.cy) * cam.scale)
            if -50 < sy < cam.h + 50:
                surf = self.font_small.render(f"L{lvl}", True, DIM)
                scr.blit(surf, (4, sy + 3))
                pygame.draw.line(scr, (46, 50, 58), (0, sy), (cam.w, sy), 1)
        for i, s in enumerate(self.univ["names"]):
            if not self.visible[i]:
                continue
            n = self.univ["info"].get(s)
            if n and n["level"] < 0:
                sy = int(cam.h / 2 - (self.pos[i][1] + 4.5 - cam.cy) * cam.scale)
                surf = self.font_small.render("CYCLE", True, ROLE_RGB["CYCLE_TRAP"])
                scr.blit(surf, (4, sy + 3))
                pygame.draw.line(scr, (70, 40, 40), (0, sy), (cam.w, sy), 1)
                break

    def draw_tooltip(self, i, pt):
        info = self.univ["info"]
        name = self.univ["names"][i]
        lines = [name]
        if name in info:
            n = info[name]
            lines += [
                f"role   {n['role']}",
                f"Ca {n['ca']:<4} Ce {n['ce']:<4} deg {n['ca'] + n['ce']}",
                f"BLAST {n['blast']}   SCC {n['scc']}",
                f"level {'CYCLE' if n['level'] < 0 else 'L' + str(n['level'])}",
            ]
        else:
            lines += ["external endpoint (not in tern table)",
                      f"deg {int(self.univ['degree'][i])}"]
        w = max(self.font.size(l)[0] for l in lines) + 14
        h = len(lines) * 16 + 10
        x = min(pt[0] + 18, self.cam.w - w - 4)
        y = min(pt[1] + 18, self.cam.h - h - 4)
        pygame.draw.rect(scr := self.screen, PANEL, (x, y, w, h),
                         border_radius=4)
        pygame.draw.rect(scr, (70, 76, 86), (x, y, w, h), 1, border_radius=4)
        for j, l in enumerate(lines):
            col = TEXT if j else (ROLE_RGB.get(info[name]["role"], TEXT)
                                  if name in info else TEXT)
            scr.blit(self.font.render(l, True, col), (x + 7, y + 6 + j * 16))

    def draw_sidebar(self):
        """Left panel: directory-style list of all nodes; click to toggle"""
        scr, cam = self.screen, self.cam
        rows = self.sb_rows()
        self.sb_scroll = max(0, min(self.sb_scroll, self.n - rows))
        pygame.draw.rect(scr, PANEL, (0, 0, SB_W, cam.h))
        pygame.draw.line(scr, (70, 76, 86), (SB_W - 1, 0), (SB_W - 1, cam.h))

        vis = int(self.visible.sum())
        scr.blit(self.font_small.render(
            f"nodes {vis}/{self.n}   click row: show/hide", True, DIM), (8, 6))
        scr.blit(self.font_small.render(
            f"sort: {self.sb_sort}   (click to change)", True, DIM), (8, 22))

        names, info, deg = self.univ["names"], self.univ["info"], self.univ["degree"]
        sel_row = -1
        if self.sb_selected >= 0:
            hits = np.flatnonzero(self.sb_order == self.sb_selected)
            sel_row = int(hits[0]) if len(hits) else -1
        for k in range(self.sb_scroll, min(self.n, self.sb_scroll + rows)):
            i = self.sb_order[k]
            y = SB_TITLE_H + (k - self.sb_scroll) * SB_ROW
            if k == sel_row:
                pygame.draw.rect(scr, (52, 58, 70), (2, y, SB_W - 4, SB_ROW))
                pygame.draw.rect(scr, HOVER_RING, (2, y, 3, SB_ROW))
            elif i == self.sb_hover:
                pygame.draw.rect(scr, (44, 50, 60), (2, y, SB_W - 4, SB_ROW))
            nm = names[i]
            ninfo = info.get(nm)
            col = ROLE_RGB.get(ninfo["role"], UNKNOWN_RGB) if ninfo else UNKNOWN_RGB
            bx, by = 10, y + (SB_ROW - 10) // 2
            if self.visible[i]:
                pygame.draw.rect(scr, col, (bx, by, 10, 10), border_radius=2)
            else:
                pygame.draw.rect(scr, (90, 96, 104), (bx, by, 10, 10), 1,
                                 border_radius=2)
            text = nm
            while self.font_small.size(text)[0] > SB_W - 16 - 10 - 44 and len(text) > 4:
                text = text[:-2]
            if text != nm:
                text += "\u2026"
            name_col = TEXT if self.visible[i] else (108, 112, 120)
            if i == self.sb_selected:
                name_col = (245, 220, 90) if self.visible[i] else (150, 140, 80)
            surf = self.font_small.render(text, True, name_col)
            scr.blit(surf, (bx + 16, y + (SB_ROW - surf.get_height()) // 2))
            d = self.font_small.render(str(int(deg[i])), True, DIM)
            scr.blit(d, (SB_W - 10 - d.get_width(),
                         y + (SB_ROW - d.get_height()) // 2))

        # scrollbar, if the list does not fit
        if self.n > rows:
            track_y0, track_y1 = SB_TITLE_H + 2, cam.h - 4
            frac = self.sb_scroll / self.n
            bar_h = max(20, (track_y1 - track_y0) * rows // self.n)
            bar_y = track_y0 + frac * (track_y1 - track_y0 - bar_h)
            pygame.draw.rect(scr, (60, 66, 76),
                             (SB_W - 6, bar_y, 4, bar_h), border_radius=2)

    def draw_hud(self):
        scr, cam = self.screen, self.cam
        u = self.univ
        ox = SB_W if self.sidebar else 0
        parts = []
        if self.summary:
            parts.append(f"{self.summary['file']}: {self.summary['nodes']} nodes, "
                         f"{self.summary['edges']} edges | MaxSCC={self.summary['maxscc']} "
                         f"| Cyclic={self.summary['cyclic']} | PropCost={self.summary['pc']}%")
        else:
            parts.append(f"{self.n} nodes, {len(u['src'])} edges")
        parts.append(f"{self.layout} layout | physics "
                     f"{'on' if self.physics else 'off'} | {self.fps:.0f} fps")
        if self.verdict:
            parts.append(self.verdict)
        if self.warning:
            parts.append(self.warning)
        if self.delta:
            parts.append(self.delta)
        for j, p in enumerate(parts):
            scr.blit(self.font_big.render(p, True, TEXT), (ox + 8, 6 + j * 18))

        # legend, top right
        x = cam.w - 10
        for role in ("ENTRY_ROOT", "SINK_ABSTRACTION", "PASS_THROUGH_HUB",
                     "CYCLE_TRAP", "INTERNAL"):
            surf = self.font_small.render(role, True, TEXT)
            x -= surf.get_width()
            scr.blit(surf, (x, 8))
            pygame.draw.circle(scr, ROLE_RGB[role], (x - 14, 13), 5)
            x -= 62
        x -= 40
        surf = self.font_small.render("unlisted", True, DIM)
        x -= surf.get_width()
        scr.blit(surf, (x, 8))
        pygame.draw.circle(scr, UNKNOWN_RGB, (x - 14, 13), 5)

        if self.help:
            lines = ["drag node: move it (springs pull neighbors)",
                     "P: pin/unpin hovered node",
                     "drag space / RMB: pan    wheel: zoom",
                     "L: force/level   SPACE: pause physics   R: re-seed",
                     "N: node list   click node: locate in list   H: help   S: screenshot   Q/ESC: quit"]
            for j, l in enumerate(lines):
                scr.blit(self.font_small.render(l, True, DIM),
                         (ox + 8, cam.h - 14 - (len(lines) - j) * 15))

    # ------------------------------------------------------------ run

    def run(self, max_frames=0):
        running = True
        while running:
            running = self.handle_events()
            self.update_hover()
            if self.physics and self.layout == "force":
                self.step_physics()
            elif self.drag_idx >= 0:   # dragging works even with physics paused
                wx, wy = self.cam.to_world(*self.mouse)
                self.pos[self.drag_idx] = (wx, wy)
            self.draw()
            pygame.display.flip()
            self.fps = self.clock.tick(60) and 1000.0 / max(self.clock.get_time(), 1)
            self.frame += 1
            if max_frames and self.frame >= max_frames:
                running = False
        pygame.quit()


# ---------------------------------------------------------------- input

def read_input(args):
    if args.raw or args.input == "-":
        if args.input == "-" and sys.stdin.isatty() and not args.raw:
            sys.exit("error: no stdin; pass an .ll file or a --raw output file")
        return sys.stdin.read() if args.input == "-" else open(args.input).read()
    if not os.access(args.tern, os.X_OK):
        sys.exit(f"error: {args.tern} not executable")
    cmd = [args.tern] + (["--keep-external"] if args.keep_external else []) + [args.input]
    if args.baseline:
        cmd.append(args.baseline)
    return subprocess.run(cmd, capture_output=True, text=True, check=True).stdout


def main():
    ap = argparse.ArgumentParser(description="Interactive tern graph viewer")
    ap.add_argument("input", nargs="?", default="-")
    ap.add_argument("baseline", nargs="?")
    ap.add_argument("--raw", action="store_true")
    ap.add_argument("--tern", default="./tern")
    ap.add_argument("--keep-external", action="store_true",
                    help="pass --keep-external to tern (wire declare-only libc "
                         "externals like malloc/fprintf into the graph)")
    ap.add_argument("--layout", choices=["force", "level"], default="force")
    ap.add_argument("--seed", type=int, default=42)
    ap.add_argument("--iterations", type=int, default=150,
                    help="initial spring layout iterations")
    ap.add_argument("--steps", type=int, default=2,
                    help="physics steps per frame while interactive")
    ap.add_argument("--labels", type=int, default=20,
                    help="how many top-degree symbols get labels")
    ap.add_argument("--width", type=int, default=1600)
    ap.add_argument("--height", type=int, default=900)
    ap.add_argument("--screenshot", default="tern_view.png")
    args = ap.parse_args()

    text = read_input(args)
    nodes, edges, summary, delta, verdict, warning = parse_tern_output(text)
    if args.layout == "force" and not edges:
        print("note: no EDGE lines in input; using level layout")
        args.layout = "level"

    univ = build_universe(nodes, edges)
    if args.layout == "force":
        pos = initial_force_positions(univ, args.seed, args.iterations)
    else:
        pos = level_positions(univ)

    App(univ, pos, args.layout, summary, delta, verdict, warning, args).run(
        int(os.environ.get("TERN_VIEW_MAX_FRAMES", "0")))


if __name__ == "__main__":
    main()
