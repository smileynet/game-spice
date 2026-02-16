# Feature Acceptance: Browse and Search Design Decisions (game-spice-6qz.2)

**Feature:** As a game designer, I want to browse and search past design decisions so that I can review rationale, avoid rehashing, and understand how the design evolved.

**Status:** Validated and complete
**Date:** 2026-02-16

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | /game:decisions lists all decisions from the active session's decisions.log | PASS | commands/decisions.md Steps 1-2: discovers active session via Glob/Read of sessions.yaml, reads decisions.log and parses pipe-delimited format. Step 3 line 113: when no argument provided, all data rows used. Step 4: presents full table. |
| 2 | Supports filtering by category (genre, mechanics, ui-ux, etc.) via argument | PASS | commands/decisions.md Step 3 (lines 86-94): classifies argument against known phase/origin values; anything else treated as category filter. Case-insensitive matching. No-match path shows available categories. |
| 3 | Supports filtering by phase (brainstorm, simulate) via argument | PASS | commands/decisions.md Step 3 (lines 88-90): phase values explicitly enumerated (brainstorm, simulate, build-plan). Same filtering mechanism as category. |
| 4 | Shows decision id, date, category, decision text, and rationale | PASS | commands/decisions.md Step 4 (lines 135-140): table includes ID, Date, Category, Origin, Decision, and Rationale columns. Exceeds criterion by also showing Origin with provenance markers ([suggested], [inferred]). |
| 5 | If no session is active, prompts to start one | PASS | commands/decisions.md Step 1: two distinct paths — sessions.yaml missing (lines 25-36) and empty sessions list (lines 44-55) — both display "NO ACTIVE SESSION" banner and direct to /game:start. |

## Tracer Path Verification

| Step | Supported | Evidence |
|------|-----------|----------|
| /game:decisions (no args) | Yes | Steps 1-2 load session and all decisions; Step 4 presents full table |
| Verify all decisions displayed | Yes | Step 3 line 113: no argument means all rows used |
| /game:decisions mechanics | Yes | Step 3: "mechanics" is not a phase or origin, so treated as category filter |
| Verify filtered results | Yes | Step 4 shows "Filtered by:" and "Showing X of Y decisions" headers |

## Error Scenarios

| Scenario | Handling |
|----------|----------|
| No sessions.yaml | "NO ACTIVE SESSION" + /game:start prompt, stop |
| Empty sessions list | "NO ACTIVE SESSION" + /game:start prompt, stop |
| decisions.log missing | "MISSING LOG" banner with re-run and directory check options |
| No data rows (header only) | "NO DECISIONS" + /game:brainstorm prompt, stop |
| Filter matches nothing | "NO MATCHES" with available categories/phases/origins listed |
| Malformed rows | Skip and display valid rows, append warning count |

## Quality Sign-Off

- Maître acceptance review: APPROVED — all 5 criteria pass, 6 error paths verified, tracer path fully supported
- Follows established project patterns (matches /game:status command structure)
- Provenance visibility exceeds requirements: origin column, [suggested]/[inferred] markers, >50% AI-proposed advisory

## Tasks Completed

- [x] game-spice-6qz.2.1: Create /game:decisions command

## Related

- Parent epic: game-spice-6qz (Phase 3: Plan Generation & Utilities)
- Sibling feature: game-spice-6qz.1 (Generate implementation plan from simulation)
