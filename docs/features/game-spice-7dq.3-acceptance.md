# Feature Acceptance: ASCII Wireframing and Simulation Knowledge Skills (game-spice-7dq.3)

**Feature:** As an agent facilitating game design, I need reference knowledge for ASCII wireframe conventions and Wizard of Oz simulation best practices so that I present consistent, useful gameplay visualizations.

**Status:** Validated and complete
**Date:** 2026-02-15

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | ascii-wireframing skill provides a TOOLKIT of starter patterns (box drawing, common primitives) — not a fixed rulebook | PASS | "Starter Toolkit" section with box drawing characters and "Common Primitives" table. Framed as "building blocks, not rules" (line 8) and "starter suggestions" (line 42). |
| 2 | ascii-wireframing skill explains that conventions are per-project and evolve during simulation via legend.yaml | PASS | "The legend.yaml Workflow" section with 4-step progression: propose → grow → override → format. Explicit: "Every project develops its own symbol conventions." |
| 3 | ascii-wireframing skill includes genre-specific starter examples (platformer, top-down, menu screens) as inspiration, not mandates | PASS | "Genre-Specific Inspiration" section with 5 examples: side-scroller, top-down RPG, menu/HUD, inventory grid, flow diagram. Framed as "Adapt, don't copy." |
| 4 | simulation-guide skill defines facilitator rules (sidekick not director, decision recording with provenance, coverage-driven pacing) | PASS | "Facilitator Role" section ("You are a sidekick, not a director"), "Decision Recording Protocol" with origin field (user/suggested/inferred), "Coverage-Driven Pacing" with 5-beat coverage goals. |
| 5 | simulation-guide skill includes anti-patterns for AI-assisted creative collaboration (including suggestion rubber-stamping) | PASS | "Anti-Patterns" table with 7 entries. Rubber-stamp guard: "If 3+ consecutive decisions have origin `suggested`, pause and prompt user to drive." Resurfacing rule for inferred decisions. |
| 6 | Both skills follow existing SKILL.md frontmatter + structure conventions | PASS | Both have YAML frontmatter with name + description + trigger phrases, H1 title, tables for structured info, See Also with `(see ...)` cross-references. Matches siblings like game-mechanics-palette. |

## Quality Sign-Off

- Sous-chef code review: APPROVED (1 minor cross-reference fix, 2 nits)
- Maitre acceptance review: APPROVED (all 6 criteria pass)
- Polisher: Applied (1 cross-reference normalization)
- Bidirectional cross-reference added between companion skills

## Tasks Completed

- [x] game-spice-7dq.3.1: Create ascii-wireframing skill
- [x] game-spice-7dq.3.2: Create simulation-guide skill

## Related

- Parent epic: game-spice-7dq (Phase 1: Foundation & Session Lifecycle)
- Unblocks: game-spice-6ua.2 (Interactive ASCII gameplay simulation)
