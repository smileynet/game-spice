# Feature Acceptance: Interactive Game Concept Brainstorm (game-spice-6ua.1)

**Feature:** As a game designer, I want to interactively brainstorm and refine a game concept with the agent so that I have a solid foundation (core loop, aesthetics, mechanics) before simulating gameplay.

**Status:** Validated and complete
**Date:** 2026-02-15

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | /game:brainstorm starts with an open-ended prompt asking the user to describe their game idea freely | PASS | brainstorm.md Step 2: AskUserQuestion with "Describe the game you want to make. What does the player do? What does it feel like?" Line 15 CRITICAL: "This is a conversation, NOT a questionnaire." |
| 2 | Agent extracts structure (genre, core loop, aesthetics, platform, mechanics) from the user's natural description | PASS | brainstorm.md Step 3: extraction table mapping genre, subgenre, core_loop, aesthetics, platform, input_method, mechanics, scope, pitch with "How to extract" strategies and examples. |
| 3 | Agent only asks follow-up questions for things genuinely unclear or missing — no rigid questionnaire | PASS | brainstorm.md Step 4: explicit DO NOT ask list (inferrable fields, sensible defaults, already addressed). "If there are no gaps: Skip this step entirely. Do NOT manufacture questions." Batches gaps into single follow-up. |
| 4 | Produces concept.yaml with structured concept data (genre, core_loop one-sentence, aesthetics, platform, input_method) | PASS | brainstorm.md Step 8a writes .game-design/\<slug\>/concept.yaml. templates/concept.yaml defines schema with all required fields. Fully populated example in command spec. |
| 5 | Produces brainstorm.md with narrative exploration of the concept | PASS | brainstorm.md Step 8b writes .game-design/\<slug\>/brainstorm.md. templates/brainstorm-output.md defines structure: Elevator Pitch, Core Loop (with validation), Aesthetics (MDA mapping), Key Mechanics, Scope, Design Notes, Open Questions, Decision Summary. |
| 6 | Seeds decisions.log with brainstorm-phase decisions, each tagged with origin (user/suggested/inferred) | PASS | brainstorm.md Step 8c: row format `id\|date\|phase\|category\|origin\|decision\|rationale\|alternatives`. Provenance rules in Step 3 define when each origin applies. Provenance balance check triggers if >5 consecutive non-user decisions. |
| 7 | References game-spice skills: mechanics-palette, scoping, design-frameworks | PASS | Step 2: mechanics-palette/exploration-prompts.md for inspiration. Step 5: scoping/SKILL.md for core loop validation. Step 6: design-frameworks/SKILL.md and mechanics-palette/SKILL.md for MDA alignment and enrichment. |
| 8 | Validates concept is a digital/video game (not board game, card game, tabletop RPG) | PASS | brainstorm.md Step 7: AskUserQuestion with "Yes, digital" / "Not digital" options. Skips silently if clearly digital. Notes game-spice assumes digital game if not. |
| 9 | Chains to /game:simulate when user is ready | PASS | brainstorm.md Step 10: AskUserQuestion with "Simulate" as first option, chains via Skill(skill="game:simulate"). Step 9 transitions phase to `simulate` in state.yaml before handoff. |

## Tracer Path Verification

| Step | Supported | Evidence |
|------|-----------|----------|
| /game:brainstorm | Yes | brainstorm.md Step 1-2: load session, open conversation |
| user describes idea | Yes | Step 2: open-ended prompt, "I need inspiration" fallback |
| agent extracts + probes gaps | Yes | Step 3 extraction table + Step 4 selective follow-up |
| verify concept.yaml | Yes | Step 8a: writes structured concept from template |
| verify brainstorm.md | Yes | Step 8b: writes design brief from template |
| verify decisions.log with provenance | Yes | Step 8c: appends rows with origin tags |
| chain to simulate | Yes | Step 10: AskUserQuestion → Skill(skill="game:simulate") |

## Quality Sign-Off

- Sous-chef code review: APPROVED (rework cycle addressed 1 minor + 3 nits, polished)
- Maitre acceptance review: APPROVED (all 9 criteria pass, tracer path complete)
- Error scenarios: Comprehensive (no session, phase mismatch, missing templates, corrupted state, missing decisions.log, resume with existing concept)

## Tasks Completed

- [x] game-spice-6ua.1.1: Create /game:brainstorm command
- [x] game-spice-6ua.1.2: Create brainstorm output template

## Related

- Parent epic: game-spice-6ua (Phase 2: Brainstorm & Simulation)
- Depends on: game-spice-7dq.1 (Start and resume game design sessions)
- Unblocks: game-spice-6ua.2 (Interactive ASCII gameplay simulation)
