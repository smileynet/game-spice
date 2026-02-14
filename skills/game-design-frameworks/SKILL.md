---
name: game-design-frameworks
description: Game design analysis frameworks and thinking tools. Use when brainstorming game ideas, analyzing game mechanics, designing player experiences, evaluating engagement loops, or planning game narrative. Covers MDA framework, core loop design, player motivation, systems thinking, narrative integration, progression systems.
---

# Game Design Frameworks

Thinking tools for analyzing and designing game experiences.

## Quick Reference

### Framework Selection Guide

| When you need to... | Use this framework |
|---|---|
| Analyze why a mechanic is/isn't fun | MDA Framework |
| Design what the player does repeatedly | Core Loop Design |
| Understand what motivates players | Player Motivation (SDT) |
| Balance challenge vs skill | Difficulty & Challenge Design |
| Design interconnected systems | Systems Thinking |
| Integrate story with gameplay | Narrative Integration |
| Make actions feel good | Game Feel & Juice |
| Teach the player how to play | Onboarding Patterns |
| Design long-term engagement | Progression Systems |
| Design resource economy | Game Economy Design |
| Plan content scope and level pacing | Content & Level Planning |
| Discover and combine mechanics | Game Mechanics Palette |
| Visualize the player experience | Game Scenario Walkthrough |

### One-Liner Summaries

| Framework | Key Insight |
|-----------|-------------|
| MDA | Design mechanics, but players experience aesthetics |
| Core Loops | If the 30-second loop isn't fun, nothing else matters |
| SDT | Autonomy + competence + relatedness = intrinsic motivation |
| Flow | Too easy = boredom, too hard = frustration, just right = flow |
| Systems Thinking | Interesting games emerge from system interactions |
| Narrative | Story and mechanics should reinforce, not contradict |

## MDA Framework

**Mechanics → Dynamics → Aesthetics**

Designers build mechanics. Players experience aesthetics. Dynamics are what emerge in between.

| Layer | Definition | Example (Chess) |
|-------|-----------|-----------------|
| **Mechanics** | Rules, systems, algorithms | Pieces move in defined patterns |
| **Dynamics** | Behaviors that emerge from play | Opening strategies, sacrifices, tempo |
| **Aesthetics** | Emotional responses in the player | Challenge, discovery, competition |

### The 8 Aesthetics

| Aesthetic | Description | Games Known For It |
|-----------|-------------|-------------------|
| **Sensation** | Sensory pleasure | Journey, Flower |
| **Fantasy** | Make-believe, roleplay | Elder Scrolls, D&D |
| **Narrative** | Drama, story unfolding | Last of Us, Disco Elysium |
| **Challenge** | Obstacle course, mastery | Dark Souls, Celeste |
| **Fellowship** | Social cooperation | It Takes Two, MMOs |
| **Discovery** | Exploration, finding secrets | Outer Wilds, Metroidvanias |
| **Expression** | Self-expression, creativity | Minecraft, Dreams |
| **Submission** | Relaxation, pastime | Animal Crossing, idle games |

### Using MDA for Planning

1. **Pick 1-2 target aesthetics** — your game can't excel at all 8
2. **Design mechanics that produce dynamics leading to those aesthetics**
3. **Test by asking:** "Does this mechanic create moments of [target aesthetic]?"

**Common mistake:** Designing mechanics that feel logical but don't produce the target aesthetic. A "challenge" game needs mechanics that create near-misses and skill growth, not just difficulty.

## Core Loop Design

### Action → Reward → Reinvestment

```
    ┌──────────┐
    │  ACTION  │ ← Player does something
    └────┬─────┘
         │
    ┌────▼─────┐
    │  REWARD  │ ← Game responds positively
    └────┬─────┘
         │
    ┌────▼──────────┐
    │ REINVESTMENT   │ ← Reward enables/motivates next action
    └────┬──────────┘
         │
         └──→ Back to ACTION
```

### Evaluating Loop Strength

| Quality | Strong Loop | Weak Loop |
|---------|------------|-----------|
| Agency | Player chooses actions meaningfully | Optimal path is obvious |
| Feedback | Immediate, clear, satisfying | Delayed, ambiguous |
| Variation | Same loop, different situations | Repetitive sameness |
| Growth | Player skill improves over time | No skill progression |
| Investment | Rewards open new possibilities | Rewards are cosmetic only |

### Nested Loops

Games have loops at multiple timescales:

| Loop Level | Timescale | Example (Hades) |
|------------|-----------|-----------------|
| **Micro** | 1-5 seconds | Dodge, attack, use ability |
| **Core** | 30-60 seconds | Clear room, choose reward, enter next room |
| **Meta** | 5-30 minutes | Complete a run, unlock permanent upgrades |
| **Macro** | Hours+ | Unlock story, build relationships, master weapons |

**Rule:** Get the micro and core loops right first. Meta and macro loops can't save a boring core.

## Difficulty & Challenge → see game-difficulty-design

Flow state, difficulty curves, challenge types, accessibility, recovery mechanics, and boss design are covered in the dedicated difficulty skill. Key concepts:

- **Flow channel** — challenge must match skill; too easy = boredom, too hard = frustration
- **Difficulty curve patterns** — linear, sawtooth, exponential, player-driven, sine wave
- **Challenge types** — kinesthetic, strategic, puzzle, knowledge, social
- **Accessibility** — removing barriers to reach challenge, not eliminating challenge

## Deep Dives

- `(see game-design-frameworks/motivation.md for Player Motivation: SDT, intrinsic vs extrinsic, overjustification effect)`
- `(see game-design-frameworks/systems.md for Systems Thinking: feedback loops, emergence, interaction planning)`
- `(see game-design-frameworks/narrative.md for Narrative Integration: 4 levels, choosing integration level, ludonarrative dissonance)`
- `(see game-design-frameworks/polish.md for Game Feel & Juice: MLP juice checklist, onboarding patterns and guidelines)`
- `(see game-design-frameworks/progression.md for Progression Systems: types, horizontal vs vertical, meta-progression, red flags)`

## See Also

- **game-scoping** — Apply these frameworks to scope decisions `(see game-scoping → MLP Scoping Process)`
- **game-antipatterns** — Common mistakes when applying these frameworks incorrectly `(see game-antipatterns → Kitchen Sink Design)`
- **game-economy-design** — Resource systems, taps & sinks, progression curves `(see game-economy-design)`
- **game-playtesting** — Validate design decisions with real players `(see game-playtesting → The 3-Question Framework)`
- **game-scenario-walkthrough** — Narrate the player experience to test framework application `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-difficulty-design** — Flow state, difficulty curves, challenge types, accessibility, boss design `(see game-difficulty-design → Flow State & Difficulty)`
- **game-content-planning** — Level design, pacing, content scope estimation, procedural vs handcrafted `(see game-content-planning)`
- **game-mechanics-palette** — Browse and combine mechanics from a curated catalog `(see game-mechanics-palette)`
