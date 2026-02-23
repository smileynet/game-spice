# Feature Acceptance: Generate Implementation Plan from Simulation (game-spice-6qz.1)

**Feature:** As a game designer, I want to generate a structured Game Design Document and Technical Specification from my simulation sessions so that I have a clear, implementable plan to build from.

**Status:** Validated and complete
**Date:** 2026-02-16

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | /game:build-plan reads all session data (concept, turns, wireframes, decisions, coverage) | PASS | build-plan.md Step 2 (lines 142-180): loads concept.yaml, decisions.log, brainstorm.md, coverage.yaml, legend.yaml, game-state.yaml in parallel, then globs and reads all turn-*.md and wf-*.txt files. Also loads templates and skill references. |
| 2 | Produces gdd.md with: design pillars, concept overview, mechanics, UI wireframes, content requirements, decision log summary | PASS | templates/gdd.md contains all required sections: Design Pillars, Game Overview (concept, audience, platform, core loop), Mechanics (core, supporting, deferred), UI/UX (HUD, wireframes, input), Content Requirements, and Appendix with Decision Log Summary. build-plan.md Steps 3a-3i map simulation data to each section. |
| 3 | Produces tech-spec.md with: architecture overview, implementation phases, task breakdown, technical decisions, risk register | PASS | templates/tech-spec.md contains all required sections: Architecture Overview (engine/framework, module decomposition), Implementation Phases (0-3), Per-Phase Task Breakdown, Technical Decisions (rendering, state, input, audio, save/load), Risk Register. build-plan.md Steps 5a-5e map data to each section. |
| 4 | GDD references specific simulation turns for evidence | PASS | templates/gdd.md Core Mechanics table includes "Explored in" column with `Turn NNN` format. Supporting Mechanics and Areas tables also include turn references. build-plan.md Step 3d explicitly requires cross-referencing with simulation turns. |
| 5 | GDD includes all ASCII wireframes organized by screen/state | PASS | templates/gdd.md UI/UX section includes HUD Layout wireframe with legend, and "Additional Wireframes" subsection organized by `<Screen/State Name>`. build-plan.md Step 3f specifies loading all wireframes from simulation/wireframes/ organized by screen/state. |
| 6 | Uses scoping for MLP phase structure | PASS | build-plan.md Step 2 loads skills/scoping/SKILL.md. Step 5b follows "tracer bullet → core loop → content → polish" progression and references the 3-Feature Rule. Tech spec template phases directly implement MLP structure. |
| 7 | Uses plan-audit for quality review | PASS | build-plan.md Step 2 loads skills/plan-audit/SKILL.md. Step 6 runs Plan Completeness Scorecard (10 checks), Core Loop Validation Tests (4 tests), and GDD Actionability Test (7 checks scored 1-5) directly from the audit skill. |
| 8 | Output files written to .game-design/<session>/output/ | PASS | build-plan.md Step 7 writes to `.game-design/<slug>/output/gdd.md` and `.game-design/<slug>/output/tech-spec.md`. Template headers confirm the target path. |
| 9 | Session state updated to phase: complete | PASS | build-plan.md Step 8 updates state.yaml with `phase: complete`, `flags.plan_ready: true`, and updates sessions.yaml index. |

## Tracer Path Verification

| Step | Supported | Evidence |
|------|-----------|----------|
| Load session with 5+ turns | Yes | Step 1: validates session exists, correct phase, minimum coverage. Step 2: loads all turn files via glob. |
| Generate gdd.md | Yes | Steps 3-4: populates GDD template from simulation data, including Assumptions to Validate section for suggested/inferred decisions. |
| Generate tech-spec.md | Yes | Step 5: populates tech spec from GDD output and simulation data, with phased task breakdown. |
| Verify cross-references | Yes | Step 6: quality review runs Plan Completeness Scorecard, Core Loop Validation, and GDD Actionability tests. |

## Quality Sign-Off

- Maître acceptance review: APPROVED (all 9 criteria pass, 1 issue fixed — added Assumptions to Validate placeholder to GDD template)
- Error scenarios: Comprehensive (no session, phase mismatch, insufficient coverage with user choice, missing concept, empty decisions, missing templates, corrupted state)

## Tasks Completed

- [x] game-spice-6qz.1.1: Create GDD and tech spec templates
- [x] game-spice-6qz.1.2: Create /game:build-plan command

## Related

- Parent epic: game-spice-6qz (Phase 3: Plan Generation & Utilities)
- Depends on: game-spice-6ua.2 (Interactive ASCII gameplay simulation)
