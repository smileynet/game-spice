# Feature Acceptance: Interactive ASCII Gameplay Simulation (game-spice-6ua.2)

**Feature:** As a game designer, I want to simulate gameplay moments with ASCII wireframes and narrative descriptions so that I can experience, test, and refine my game design before writing any code.

**Status:** Validated and complete
**Date:** 2026-02-15

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | /game:simulate presents an ASCII wireframe + narrative text describing a gameplay moment | PASS | simulate.md Step 4: generates wireframes per ascii-wireframing skill with inline legends. Step 5: presents "What the Player Sees" (wireframe) and "What Is Happening" (narrative) together via AskUserQuestion. |
| 2 | Each turn asks the user questions about how the game should behave via AskUserQuestion | PASS | simulate.md Step 4c: formulates 2-4 specific concrete questions with categories (mechanic, feedback, progression, scope, content). Step 5: explicit AskUserQuestion calls with structured options. "Wait for each response before proceeding." |
| 3 | User responses are recorded as decisions in decisions.log with category, rationale, and alternatives | PASS | simulate.md Step 6: full decision recording protocol. Step 6a: fields (id, date, phase, category, origin, decision, rationale, alternatives). Step 6e: pipe-delimited format and Write call. Provenance tracking (6b), rubber-stamp guard (6c), inferred resurfacing (6d). |
| 4 | Each turn is saved as a standalone file in simulation/turns/turn-NNN.md | PASS | simulate.md Step 7a: Write to `.game-design/<slug>/simulation/turns/turn-<NNN>.md` with zero-padded 3-digit numbering. templates/simulation-turn.md provides the template. |
| 5 | ASCII wireframes are saved separately in simulation/wireframes/wf-NNN-description.txt | PASS | simulate.md Step 7b: Write to `.game-design/<slug>/simulation/wireframes/wf-<NNN>-<description>.txt` with kebab-case description. |
| 6 | Coverage tracker (coverage.yaml) tracks 5-Beat areas: uncovered/partial/covered | PASS | templates/coverage.yaml: `beats:` section with all 5 beats, each with status/confidence/turns. Confidence thresholds map to status: <0.3=uncovered, 0.3-0.69=partial, >=0.7=covered. Also includes `systems:` for cross-cutting coverage and `transition:` criteria. |
| 7 | Agent prioritizes presenting moments from uncovered areas, then partial areas | PASS | simulate.md Step 3: "1. Find the first beat with status `uncovered` — start there. 2. If all beats are at least `partial`, find the first `partial` beat. 3. If all beats are `covered`, simulation is complete." |
| 8 | Simulated game state (game-state.yaml) tracks player position, abilities, world state | PASS | simulate.md Step 2: initial game-state.yaml with turn, beat, player, world, elements. Step 7d: updates player state (abilities, inventory, position), world state (areas, NPCs), and elements each turn. |
| 9 | After 15+ turns or all beats covered, agent suggests transitioning to /game:build-plan | PASS | simulate.md Step 8: "all beats covered" triggers AskUserQuestion with "End simulation" option. Step 9: transitions to build-plan phase. Coverage confidence math naturally converges around 15 turns (3 turns/beat at +0.2 base). Diminishing returns detection provides additional trigger. |
| 10 | Session can be interrupted and resumed — state persists between conversations | PASS | simulate.md Step 2: explicit fresh start vs continuation handling. Resume loads last 3 turns, displays SIMULATION RESUME banner. All state persisted to files after every turn in Step 7. |

## Tracer Path Verification

| Step | Supported | Evidence |
|------|-----------|----------|
| Load concept | Yes | Step 1: load state.yaml, concept.yaml, decisions.log, simulation files |
| Present Beat 1 wireframe | Yes | Steps 2-5: initialize, select first_contact, generate wireframe, present |
| User responds | Yes | Step 5: AskUserQuestion with structured options, wait for response |
| Record turn + decision + coverage | Yes | Steps 6-7: record decisions, write turn file, update coverage.yaml |
| Present Beat 2 | Yes | Step 8: multi-turn flow loops back to Step 3 |
| Verify multi-turn | Yes | Step 8: Continue/Explore/End options; coverage-driven pacing |

## Quality Sign-Off

- Sous-chef code review: APPROVED (2 minor issues fixed inline, polished)
- Maitre acceptance review: APPROVED (all 10 criteria pass, tracer path complete)
- Error scenarios: Comprehensive (no session, phase mismatch, concept incomplete, corrupted state, missing decisions.log, missing templates)

## Tasks Completed

- [x] game-spice-6ua.2.1: Create simulation turn template
- [x] game-spice-6ua.2.2: Create /game:simulate command — core loop
- [x] game-spice-6ua.2.3: Create coverage tracking schema

## Related

- Parent epic: game-spice-6ua (Phase 2: Brainstorm & Simulation)
- Depends on: game-spice-6ua.1 (Interactive game concept brainstorm), game-spice-7dq.3 (ASCII wireframing and simulation knowledge skills)
- Unblocks: game-spice-6qz.1 (Generate implementation plan from simulation)
