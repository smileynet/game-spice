# Planning Context: Game Audit Skills

**Status:** implemented
**Created:** 2026-02-13

## Problem

Game-spice only activates during `/mise` planning phase. Plan and architecture audits (`/plan-audit`, `/architecture-audit`) produce generic software results that miss game-specific concerns like core loop validation, game loop timing, state machine patterns, frame budgets, and entity architecture.

## Approach

Add two new audit skills (`plan-audit`, `architecture-audit`) that inject game-specific knowledge into Line Cook's audit commands. Expand `playtesting` with structured methodology (RITE, FFWWDD, session structure). Introduce sub-files convention for progressive disclosure of engine-specific and deep-dive content.

## Key Decisions

- Two audit skills align to Line Cook's two audit commands (`/plan-audit`, `/architecture-audit`)
- Sub-files for progressive disclosure — main SKILL.md stays within context budget, sub-files load on demand
- Engine-specific patterns (Godot, Rust/Bevy) in sub-files, not inline — keeps core audit engine-agnostic
- Questionnaire frameworks and telemetry methods in plan-audit sub-files — reusable across skills
- Expanded playtesting with structured methods rather than creating a separate skill

## Artifacts

- Brainstorm: docs/planning/brainstorm-game-audit.md
- Architecture: docs/planning/context-game-audit/architecture.md
- Decisions: docs/planning/context-game-audit/decisions.log

## Scope

### In Scope
- Game plan completeness scorecard (10 checks with severity)
- Core loop validation tests (sentence, verb chain, reinvestment, 30-second)
- GDD quality audit (6 antipatterns, 7-point actionability test)
- MLP scope complexity scoring (10-factor matrix)
- Game architecture health scorecard (8 categories)
- Game loop patterns (4 patterns compared, correct answer identified)
- State management audit (FSM progression, boolean flag problem)
- Entity architecture audit (ECS vs component vs inheritance)
- Input handling audit (3-layer architecture)
- Performance smells and frame budget reference
- Godot-specific patterns (scene tree, signals, autoloads)
- Rust/Bevy-specific patterns (ECS, plugins, system ordering)
- Playtest questionnaire frameworks (GEQ, PENS, GUESS-18, SUS, FFWWDD)
- Telemetry and data analysis methods
- RITE method, session structure, sample size guidelines

### Out of Scope
- Unity-specific patterns (future work)
- Unreal Engine patterns (future work)
- Multiplayer/networking architecture audit
- Shader/rendering pipeline audit
