# Game Spice

Game design spice for [Line Cook](https://github.com/smileynet/line-cook) — MLP scoping, core loop frameworks, and planning anti-patterns.

## Installation

```bash
/plugin marketplace add smileynet/line-cook
/plugin install game-spice@line-cook
```

> Update: `/plugin update game-spice`

## What's Inside

### game-scoping

**Activates during:** `/line:scope`, feature prioritization, MLP planning, vertical slice definition.

Covers:
- MLP vs MVP distinction for games
- Core loop identification and validation
- 3-feature MLP rule
- Tracer bullet methodology (5-layer vertical slice)
- MoSCoW prioritization adapted for games
- Scope management (30% rule, cutting heuristics, creep signals)
- Genre-specific scoping tips
- Before Scoping and Scope Review checklists

### game-design-frameworks

**Activates during:** `/line:brainstorm`, game idea exploration, mechanic analysis.

Covers:
- MDA Framework (Mechanics → Dynamics → Aesthetics)
- Core loop design (Action → Reward → Reinvestment)
- Player motivation (Self-Determination Theory)
- Flow state and difficulty curve patterns
- Systems thinking (feedback loops, emergence)
- Narrative integration levels and ludonarrative dissonance
- Game feel and juice guidelines
- Onboarding patterns
- Progression system types

### game-antipatterns

**Activates during:** Plan review, scope audits, feature list evaluation.

Covers:
- Top 10 game planning anti-patterns
- Scope anti-patterns (Everything Sounds Fun, Feature/Future/Scope Creep, Premature Content)
- Design anti-patterns (Design in Isolation, Juice Addiction, Kitchen Sink, GDD Tome)
- Timing anti-patterns (Core Loop Neglect, Second System Effect, Narrative Disconnect)
- "Should I Add This Feature?" decision table
- "Is My Plan Over-Scoped?" scoring rubric
- Pre-Planning Review and Post-Planning Audit checklists

## How It Works

Skills load automatically when Line Cook commands detect game project context during `/mise` (brainstorm, scope, finalize). No configuration needed — skill descriptions contain trigger keywords that Claude matches against during planning sessions.

Typical workflow:
1. `/line:brainstorm` — game-design-frameworks activates for idea analysis
2. `/line:scope` — game-scoping activates for MLP definition and feature cutting
3. Review plan — game-antipatterns activates for scope audit

## Local Development

```bash
/plugin marketplace add /home/sam/code/game-spice
```

## Requirements

- Claude Code >= 1.0.33
- [Line Cook](https://github.com/smileynet/line-cook) plugin (for mise workflow integration)

## License

MIT
