# Epic Acceptance: Phase 2 — Brainstorm & Simulation (game-spice-6ua)

**Epic:** The brainstorm command for concept refinement and the simulation command — the core interactive innovation.

**Status:** Validated and complete
**Date:** 2026-02-15

## Features Plated

| # | Feature | Tasks | Status |
|---|---------|-------|--------|
| 1 | game-spice-6ua.1: Interactive game concept brainstorm | 2 (brainstorm command, brainstorm output template) | PASS |
| 2 | game-spice-6ua.2: Interactive ASCII gameplay simulation | 3 (simulation turn template, simulate command, coverage tracking schema) | PASS |

## User Journey Validation

| Journey | Status | Evidence |
|---------|--------|----------|
| Full lifecycle: /game:start → /game:brainstorm → /game:simulate → build-plan handoff | PASS | start.md chains to brainstorm via Skill(). brainstorm.md Step 10 chains to simulate. simulate.md Step 9 chains to build-plan. Phase guards ensure correct ordering. |
| Brainstorm resume: session exists with concept.yaml → skip to gap probing | PASS | brainstorm.md lines 69-90: loads existing concept, displays RESUMING BRAINSTORM, skips to Step 4. |
| Simulation resume: session exists with turn files → load last 3 turns → continue | PASS | simulate.md lines 205-224: loads last 3 turns for context, displays SIMULATION RESUME banner, proceeds to next beat selection. |
| Status inspection mid-flow: /game:status reads state, decisions, coverage consistently | PASS | status.md reads state.yaml, decisions.log, coverage data using same schemas that brainstorm and simulate write. |
| Brainstorm-to-simulate data contract: concept.yaml + decisions.log + state.yaml flow | PASS | Brainstorm writes concept.yaml (Step 8a), seeds decisions.log (Step 8c), sets phase to simulate (Step 9). Simulate reads all three in Step 1. Header format identical. |

## Cross-Feature Integration

| Integration Point | Status | Evidence |
|-------------------|--------|----------|
| Data format consistency (state.yaml, concept.yaml, decisions.log, coverage.yaml) | PASS | All commands use templates as single source of truth. Schema fields are consistent across producers and consumers. |
| Phase transitions (brainstorm → simulate → build-plan) | PASS | Each transition updates both state.yaml and sessions.yaml before handoff. Phase guards in receiving commands validate correct phase. |
| Decision provenance tracking (user/suggested/inferred) | PASS | Three origins defined identically in brainstorm, simulate, and simulation-guide skill. Rubber-stamp guards active in both commands (5 consecutive in brainstorm, 3 in simulate). |
| Coverage-driven pacing (5-Beat Structure) | PASS | Coverage.yaml schema defines beats/systems with confidence thresholds. Simulate updates confidence per turn with deterministic formula (+0.2/turn, +0.1/user, +0.05/suggested). Natural convergence ~15 turns. |
| Template references resolve | PASS | All 6 templates referenced by commands exist: concept.yaml, brainstorm-output.md, simulation-turn.md, coverage.yaml, session-state.yaml, sessions-index.yaml. |
| Skill references resolve | PASS | All 7 skills referenced by commands exist: mechanics-palette, scoping, design-frameworks, ascii-wireframing, simulation-guide, scenario-walkthrough. |

## Quality Sign-Off

| Review | Verdict | Notes |
|--------|---------|-------|
| Sous-chef (per feature) | APPROVED x2 | Minor issues fixed inline by polisher |
| Maitre (per feature) | APPROVED x2 | All acceptance criteria verified |
| Critic (epic E2E) | PASS | Two minor issues noted (see below) |

## Known Exceptions

1. **Decision ID format inconsistency** — Brainstorm uses plain sequential integers (`1`, `2`, `3`); simulate uses prefixed format (`sim-NNN`). The decisions.log is append-only and IDs are only used for human reference, so this does not break any consumer. Can be standardized in a future polish pass.

2. **Phase column semantics in decisions.log** — Brainstorm sets the `phase` column to `brainstorm` (workflow phase); simulate sets it to beat names like `"Beat 1: First Contact"`. Both are valid but represent different granularity. No current consumer filters or groups by this column. Can be documented or split in a future pass.

3. **build-plan command forward reference** — simulate.md chains to `/game:build-plan` which does not yet exist. Intentional: defines the interface for Phase 3 to implement. Same pattern used in Phase 1.

## Feature Acceptance Reports

- [game-spice-6ua.1-acceptance.md](game-spice-6ua.1-acceptance.md) — Interactive game concept brainstorm
- [game-spice-6ua.2-acceptance.md](game-spice-6ua.2-acceptance.md) — Interactive ASCII gameplay simulation

## Unblocks

- game-spice-6qz: Phase 3 — Plan Generation & Utilities
