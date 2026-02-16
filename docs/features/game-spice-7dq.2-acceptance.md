# Feature Acceptance: Help and Command Reference (game-spice-7dq.2)

**Feature:** As a game designer, I want to see available commands and workflow guidance so that I know how to use the interactive design tools.

**Status:** Validated and complete
**Date:** 2026-02-15

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | /game:help lists all game design commands with descriptions | PASS | COMMANDS section lists all 9 commands across 3 categories (session lifecycle, utilities, complementary). All 5 existing commands verified against frontmatter descriptions. 4 future commands (brainstorm, simulate, build-plan, decisions) documented with planned descriptions. |
| 2 | Shows the workflow progression: start → brainstorm → simulate → build-plan | PASS | WORKFLOW section displays ASCII diagram with 4-step progression. Each step has a short description underneath. Notes that commands chain automatically and /game:status is available at any time. |
| 3 | Each command has a one-line description and usage example | PASS | All 9 commands have one-line descriptions in the COMMANDS section. QUICK START section demonstrates the primary workflow (start, brainstorm, simulate, build-plan, status). Complementary commands have usage examples (walkthrough first-session, balance-check --report). |
| 4 | References existing game-spice commands (walkthrough, balance-check) as complementary tools | PASS | Complementary subsection explicitly labels walkthrough and balance-check as "available now, work outside sessions" with descriptions and usage examples. |

## Tracer Path Verification

| Step | Supported | Evidence |
|------|-----------|----------|
| /game:help | Yes | commands/help.md has valid frontmatter (description, allowed-tools: Read) |
| All commands listed | Yes | 9 commands listed across 3 categories |
| Correct descriptions | Yes | Cross-checked 5 existing commands against their frontmatter description fields |

## Quality Sign-Off

- Sous-chef code review: APPROVED (1 minor auto-fixed: removed hardcoded version; 1 polish: section heading convention)
- Maitre acceptance review: APPROVED after fixes (skill count corrected 12→14, usage examples added for complementary commands)
- Error scenarios: N/A (static display command with no error surface)

## Tasks Completed

- [x] game-spice-7dq.2.1: Create /game:help command

## Related

- Parent epic: game-spice-7dq (Phase 1: Foundation & Session Lifecycle)
