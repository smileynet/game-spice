# Planning Context: Commands & Agents (v0.4.0)

**Status:** finalized
**Created:** 2026-02-13

## Problem

Game-spice is passive knowledge only — 11 skills that activate during planning. No commands, agents, or implementation-phase guidance. Rich frameworks can't be invoked directly and produce no artifacts.

## Approach

Evolve game-spice from skills-only to full plugin with commands + agents + implementation skill. Rename plugin to "game" for `/game:*` prefix.

## Scope

- Phase 1: Active Game Tools (4-6 sessions)
  - Feature 1.1: Scenario Walkthrough Command (`/game:walkthrough`)
  - Feature 1.2: Game-Aware Code Review Agent (`game-reviewer`)
  - Feature 1.3: Economy Balance Audit Command (`/game:balance-check`)
  - Feature 1.4: Implementation Phase Guidance (`game-implementation` skill)
  - Feature 1.5: Documentation & Release

## Key Decisions

| Date | Phase | Decision | Rationale |
|------|-------|----------|-----------|
| 2026-02-13 | brainstorm | Plugin name → "game" in plugin.json | Shorter `/game:*` prefix for commands |
| 2026-02-13 | brainstorm | Full plugin (commands + agents), not just skills | Need interactive tools and serve-phase review |
| 2026-02-13 | brainstorm | Include implementation skill in MLP | Fills cook-phase gap |
| 2026-02-13 | scope | Sequential feature dependencies | Maintains focus, one capability at a time |
| 2026-02-13 | scope | game-reviewer follows sous-chef format | Consistent review output across agents |
