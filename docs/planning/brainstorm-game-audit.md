# Brainstorm: Game Audit Skills

> Exploration document from `/line:brainstorm` phase.

**Created:** 2026-02-13
**Status:** Implemented

---

## Problem Statement

### What pain point are we solving?

Game-spice currently activates only during the planning phase (`/line:mise`). When developers run `/line:plan-audit` or `/line:architecture-audit` on a game project, they get generic software audit results that miss game-specific concerns like core loop validation, game loop timing patterns, state machine architecture, frame budgets, and entity architecture patterns.

### Who experiences this pain?

Game developers using Claude Code + Line Cook who want to audit their game plans and code architecture. The generic audit commands check software engineering quality but don't know about game-specific patterns (fixed timestep, ECS vs inheritance, signal-up/call-down, input buffering).

### What happens if we don't solve it?

- Plan audits miss game-specific completeness checks (core loop defined? playtest plan exists?)
- Architecture audits miss game-specific patterns (physics in render loop, boolean flag explosion, no delta time)
- Developers must manually check game-specific concerns that the audit system should catch
- Game-spice's value is limited to planning phase only

---

## Exploration

### What game-specific concerns do plan audits miss?

1. **Core loop validation** — Is it actually a loop? Does it have reinvestment?
2. **GDD quality** — Is the design document actionable or a "novel"?
3. **Scope realism** — Is the scope feasible for the team size? Genre-specific traps?
4. **Economy design** — Do resources have sources, sinks, and player decisions?
5. **Difficulty curve** — Is there a deliberate curve or just random difficulty?
6. **Playtest readiness** — Are concrete testers and dates planned?
7. **Data strategy** — Is there a plan to measure whether changes work?

### What game-specific concerns do architecture audits miss?

1. **Game loop pattern** — Fixed update + variable render vs variable delta time
2. **State management** — Boolean flags vs FSM vs hierarchical state machines
3. **Entity architecture** — ECS vs components vs inheritance, appropriate to scale
4. **Input handling** — Raw key checks vs mapping layer vs action system
5. **Performance patterns** — Frame budget, spatial partitioning, object pooling
6. **Technical debt timing** — Which debt is acceptable during tracer bullet vs MLP vs release
7. **Engine-specific patterns** — Godot scene tree, Bevy ECS, etc.

### Progressive disclosure through sub-files

New convention: skill directories can contain sub-files for on-demand depth. Main SKILL.md stays within context budget (~250-300 lines). Sub-files load when referenced or when engine context is detected.

---

## Solution Shape

Two new skills:
- `plan-audit` — Activates during `/plan-audit` with game project context
- `architecture-audit` — Activates during `/architecture-audit` with game project context

Plus expansion of existing `playtesting` skill with RITE method, FFWWDD framework, session structure, and data-driven workflow.

Sub-files for progressive disclosure:
- `plan-audit/questionnaires.md` — Playtest questionnaire frameworks
- `plan-audit/telemetry.md` — Data collection and analysis methods
- `architecture-audit/godot.md` — Godot-specific patterns
- `architecture-audit/rust.md` — Rust/Bevy-specific patterns

---

## Key Sources

- Robert Nystrom, "Game Programming Patterns" — game loop, state, component patterns
- Glenn Fiedler, "Fix Your Timestep!" — fixed update + variable render
- Daniel Cook, "Game Design Logs" — value chains, economy design
- Microsoft Game Studios — RITE method
- GUESS-18, GEQ, PENS — validated playtest questionnaire instruments
- Bevy Engine documentation — ECS patterns, system ordering
- Godot Engine documentation — scene tree, signals, GDScript patterns
