# Planning Context: Game Design Planning Plugin

**Status:** brainstormed
**Epic:** <!-- epic-bead-id (after finalize) -->
**Created:** 2026-02-11

## Problem

Game development planning with line-cook's mise workflow lacks game-specific guidance. Plans end up either too vague or over-scoped because there's no framework for evaluating game ideas, identifying core loops, scoping MLPs around playable vertical slices, or flagging common game planning antipatterns.

## Approach

Create a skills-only Claude plugin extending line-cook with three focused knowledge bases: game-scoping (MLP + tracer bullets), game-design-frameworks (MDA, core loops, systems thinking), and game-antipatterns (scope creep, feature bloat, common mistakes). Skills load on-demand during brainstorm/scope phases to provide game-specific planning guidance.

## Key Decisions

- Skills-only plugin (no commands or agents) — augments existing line-cook workflow
- Three focused skills aligned to planning concerns: scoping, frameworks, antipatterns
- Genre-agnostic approach with broad coverage across action, idle, narrative, strategy, simulation
- Plugin follows godot-meta structure (`.claude-plugin/plugin.json` + `skills/<name>/SKILL.md`)
- Planning focus only — guides WHAT to build and in WHAT ORDER, not HOW to build it

## Artifacts

- Brainstorm: docs/planning/brainstorm-game-design-plugin.md
- Menu plan: docs/planning/menu-plan.yaml
- Architecture: docs/planning/context-game-design-plugin/architecture.md
- Decisions: docs/planning/context-game-design-plugin/decisions.log

## Scope

<!-- Added during /scope phase -->
