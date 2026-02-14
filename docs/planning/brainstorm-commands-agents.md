# Brainstorm: Game-Spice Commands & Agents

> Exploration document from `/line:brainstorm` phase.

**Created:** 2026-02-13
**Status:** Finalized

---

## Problem Statement

### What pain point are we solving?

Game-spice has 11 skills providing ~3800 lines of game design knowledge, but it's entirely passive — skills only activate during planning phases (`/line:mise`). There are no user-invocable commands, no agents, and no implementation-phase guidance. The rich frameworks (scenario walkthroughs, economy balance, architecture patterns) can't be invoked directly and produce no artifacts.

### Who experiences this pain?

Game developers using Claude Code + Line Cook who want to:
- Generate scenario walkthroughs on demand (not just during planning)
- Get game-specific code review during `/line:serve`
- Audit economy balance at any point in development
- Receive game architecture guidance during implementation (`/line:cook`)

### What happens if we don't solve it?

- Game-spice's 3800 lines of knowledge only surface during `/line:mise`
- `/line:serve` reviews miss game-specific issues (physics in render loop, missing delta time)
- `/line:cook` has zero game-specific implementation guidance
- Developers must manually invoke the right framework knowledge instead of using focused commands

---

## Exploration

### Gaps Identified

| Gap | Current State | Proposed Solution |
|-----|---------------|-------------------|
| No interactive tools | All 11 skills are passive | `/game:walkthrough`, `/game:balance-check` commands |
| No game-specific review | Generic sous-chef during serve | `game-reviewer` agent with architecture scorecard |
| No cook-phase guidance | Zero implementation help | `game-implementation` skill |
| No artifact generation | Frameworks don't produce documents | Commands output to `docs/planning/` |

### Approaches Considered

| Approach | Pros | Cons | Decision |
|----------|------|------|----------|
| Skills only (status quo) | Simple, proven | No interactivity, no review | Rejected |
| Commands + agents | Interactive, fills all gaps | More files to maintain | **Chosen** |
| Commands only (no agents) | Simpler integration | Misses serve-phase review | Rejected |

---

## Recommended Direction

Evolve game-spice from "spice" (skills-only) to "full plugin" (skills + commands + agents). MLP adds 2 commands, 1 agent, 1 skill.

### Plugin Naming

Rename plugin.json `name` to `"game"` for `/game:*` command prefix. Repository and description still reference "game-spice."

### MLP Items (v0.4.0)

1. **`/game:walkthrough`** — Interactive 5-beat scenario walkthrough generation
2. **`game-reviewer`** — Game-aware code review agent for `/line:serve`
3. **`/game:balance-check`** — On-demand economy and difficulty audit
4. **`game-implementation`** — Passive cook-phase implementation guidance skill

### Future Items

**v0.5.0:** `/game:mechanic-explore`, `/game:scope-check`, `/game:playtest-plan`, `game-tester` agent
**v0.6.0+:** `/game:gdd-generate`, `/game:core-loop-validate`, `/game:content-estimate`, `game-critic` agent, `/game:difficulty-design`

---

## Key Decisions

- Plugin name in plugin.json changes to "game" for shorter `/game:*` commands
- All 3 MLP items + implementation skill included in v0.4.0
- Commands produce artifacts in `docs/planning/`
- game-reviewer follows sous-chef output format exactly
- game-implementation is prescriptive ("do this") not diagnostic ("check for this")
