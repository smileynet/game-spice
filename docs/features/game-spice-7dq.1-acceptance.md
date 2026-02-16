# Feature Acceptance: Start and Resume Game Design Sessions (game-spice-7dq.1)

**Feature:** As a game designer, I want to start new design sessions and resume existing ones so that my work persists across conversations.

**Status:** Validated and complete
**Date:** 2026-02-15

## Acceptance Criteria Verification

| # | Criterion | Status | Evidence |
|---|-----------|--------|----------|
| 1 | /game:start creates .game-design/\<slug\>/ with state.yaml and sessions.yaml | PASS | start.md Step 4: slugify title, create state.yaml from template, write decisions.log with header, create/update sessions.yaml index. Handles slug collision with numeric suffix. |
| 2 | /game:start lists existing sessions and allows resume via AskUserQuestion | PASS | start.md Step 2: builds AskUserQuestion with "New session" + up to 3 recent sessions sorted by updated date. Routes to new (Step 3) or resume (Step 5) flow. |
| 3 | Resuming loads state.yaml and presents a context summary (phase, turn count, coverage, last decisions) | PASS | start.md Step 5a-5b: loads state.yaml, presents summary with title, phase, dates, simulation progress (turn_count, beats), decision count, flags. Loads concept.yaml if present. Updates timestamps and chains to active phase. |
| 4 | /game:status shows current session state, phase, coverage scores, and decision count | PASS | status.md Step 3-6: loads state.yaml, parses decisions.log (count + last 3), optionally loads concept.yaml. Dashboard shows phase, per-beat coverage scores (5 beats individually), decisions with by_origin breakdown, flags. Three output variants: with concept, early brainstorm, completed. |
| 5 | State files are human-readable YAML and Markdown | PASS | session-state.yaml: 49 lines with inline comments for every field. sessions-index.yaml: commented entry examples. concept.yaml: heavily commented with MDA framework values and mechanic entry examples. decisions.log: pipe-delimited with clear header row. |

## Tracer Path Verification

| Step | Supported | Evidence |
|------|-----------|----------|
| /game:start | Yes | start.md Step 1-4: full new session creation flow |
| create session | Yes | start.md Step 4d-4e: writes state.yaml, decisions.log, sessions.yaml |
| /game:status shows it | Yes | status.md reads sessions.yaml, finds session, loads state, displays dashboard |
| resume | Yes | start.md Step 2 (pick session) + Step 5 (load and present summary) |
| verify | Yes | status.md displays all state data; start.md resume summary shows phase, progress, decisions, flags |

## Quality Sign-Off

- Sous-chef code review: APPROVED (3 nits, 2 auto-fixed by polisher)
- Maitre acceptance review: APPROVED (all 5 criteria pass, tracer path fully supported)
- Error scenarios: Comprehensive (missing templates, corrupted state, slug collisions, empty index, missing files, unknown slugs)

## Tasks Completed

- [x] game-spice-7dq.1.1: Create state schema templates
- [x] game-spice-7dq.1.2: Create /game:start command
- [x] game-spice-7dq.1.3: Create /game:status command

## Related

- Parent epic: game-spice-7dq (Phase 1: Foundation & Session Lifecycle)
- Unblocks: game-spice-6ua.1 (Interactive game concept brainstorm)
