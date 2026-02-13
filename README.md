# Game Spice

Game design spice for [Line Cook](https://github.com/smileynet/line-cook) — MLP scoping, core loop frameworks, economy design, difficulty design, content planning, playtesting methodology, scenario walkthroughs, and planning anti-patterns.

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
- Difficulty & challenge redirect (→ game-difficulty-design)
- Systems thinking (feedback loops, emergence, interaction planning)
- Narrative integration levels and ludonarrative dissonance
- Game feel and juice guidelines
- Onboarding patterns
- Progression system types

### game-economy-design

**Activates during:** `/line:brainstorm` (resource/currency design), `/line:scope` (economy feature planning).

Covers:
- Economy complexity decision table (none / single resource / dual currency / full economy)
- MLP economy checklist
- Taps & sinks framework (resource sources and drains)
- Economy flow mapping (node graph analysis)
- Progression curves (linear, exponential, logarithmic, stepped)
- Loot & reward planning (rarity tier design intent)
- Genre-specific economy patterns (roguelike, idle, tower defense, RPG, survival)
- Balance tuning heuristics and economy validation
- Economy anti-patterns and scaling guidance

### game-playtesting

**Activates during:** `/line:scope` (defining playtest plans), plan review (auditing validation methodology).

Covers:
- Playtest type selection (self → friend → stranger → group)
- The 3-question framework (understand? keep going? come back?)
- Playtest planning checklist
- Minimum viable playtest (MVPt)
- Observation vs asking methodology
- Build-test-learn iteration cadence
- Pivot vs persevere decision table

### game-scenario-walkthrough

**Activates during:** `/line:scope` (after core loop defined), `/line:finalize` (validating plan concreteness).

Covers:
- 5-beat walkthrough template (first contact → learning the verb → core loop → rising stakes → session end)
- Input & feedback mapping table
- MLP scenario checklist
- Visual snapshot prompts
- Walkthrough anti-patterns

### game-difficulty-design

**Activates during:** `/line:scope` (difficulty decisions), `/line:brainstorm` (challenge design).

Covers:
- Difficulty approach selection (fixed curve, player-driven, DDA, assist mode)
- Flow state and difficulty curve patterns (sawtooth, sine wave)
- Challenge type taxonomy (kinesthetic, strategic, puzzle, knowledge, social)
- Difficulty modes and accessibility planning (Celeste assist model, Big 5 features)
- Recovery mechanics (instant respawn, checkpoint, run restart, rewind, soft fail)
- Boss design as difficulty punctuation
- Difficulty anti-patterns (fake difficulty taxonomy)

### game-content-planning

**Activates during:** `/line:scope` (content estimation), `/line:brainstorm` (world structure decisions).

Covers:
- World structure decision (linear, hub-and-spoke, open world, Metroidvania, procedural)
- Content scope estimation (production ratios by content type)
- Content-to-mechanic quality test
- Pacing through content (kishōtenketsu, beat-based pacing)
- Environment-as-teacher level design
- Procedural vs handcrafted decision framework
- Content reuse strategies
- Content anti-patterns and development sequencing

### game-antipatterns

**Activates during:** Plan review, scope audits, feature list evaluation.

Covers:
- Top 10 game planning anti-patterns
- Scope anti-patterns (Everything Sounds Fun, Feature/Future/Scope Creep, Premature Content)
- Design anti-patterns (Design in Isolation, Juice Addiction, Kitchen Sink, GDD Tome)
- Timing anti-patterns (Core Loop Neglect, Second System Effect, Narrative/Mechanics Disconnect)
- "Should I Add This Feature?" decision table
- "Is My Plan Over-Scoped?" scoring rubric
- Pre-Planning Review and Post-Planning Audit checklists

## How It Works

Skills load automatically when Line Cook commands detect game project context during `/mise` (brainstorm, scope, finalize). No configuration needed — skill descriptions contain trigger keywords that Claude matches against during planning sessions.

Typical workflow:
1. `/line:brainstorm` — game-design-frameworks + game-economy-design activate for idea and resource analysis
2. `/line:scope` — game-scoping + game-economy-design + game-difficulty-design + game-content-planning activate for MLP definition and scope planning
3. `/line:scope` — game-playtesting + game-scenario-walkthrough activate for playtest planning and experience narration
4. Review plan — game-antipatterns activates for scope audit

## Local Development

```bash
/plugin marketplace add /home/sam/code/game-spice
```

## Requirements

- Claude Code >= 1.0.33
- [Line Cook](https://github.com/smileynet/line-cook) plugin (for mise workflow integration)

## License

MIT
