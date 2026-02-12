---
name: game-design-frameworks
description: Game design analysis frameworks and thinking tools. Use when brainstorming game ideas, analyzing game mechanics, designing player experiences, evaluating engagement loops, or planning game narrative. Covers MDA framework, core loop design, player motivation, flow state, systems thinking, narrative integration, difficulty curves.
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
| Balance challenge vs skill | Flow State & Difficulty |
| Design interconnected systems | Systems Thinking |
| Integrate story with gameplay | Narrative Integration |
| Make actions feel good | Game Feel & Juice |
| Teach the player how to play | Onboarding Patterns |
| Design long-term engagement | Progression Systems |

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

## Player Motivation

### Self-Determination Theory (SDT)

Three innate psychological needs that drive intrinsic motivation:

| Need | Definition | Game Design Application |
|------|-----------|----------------------|
| **Competence** | Feeling effective and mastering challenges | Clear skill progression, appropriate difficulty, meaningful feedback |
| **Autonomy** | Feeling in control of your choices | Multiple valid strategies, player-driven pacing, meaningful choices |
| **Relatedness** | Feeling connected to others | Co-op, competition, shared experiences, NPCs that feel real |

### Intrinsic vs Extrinsic Motivation

| Type | Driven By | Game Example | Durability |
|------|-----------|-------------|------------|
| **Intrinsic** | Activity is inherently enjoyable | Playing because combat feels great | Long-lasting |
| **Extrinsic** | External reward for activity | Playing to fill a progress bar | Fades when reward stops |

### The Overjustification Effect

Adding extrinsic rewards to an intrinsically fun activity can **reduce** motivation.

**Warning signs in game design:**
- Players grind unfun content for rewards instead of enjoying gameplay
- Removing daily login rewards causes player drop-off (they weren't playing for fun)
- Players optimize the fun out of your game to maximize reward efficiency

**Guideline:** Extrinsic rewards should amplify intrinsic fun, not replace it. If players wouldn't do the activity without the reward, the activity needs redesign.

## Flow State & Difficulty

### The Flow Channel

```
Anxiety    ╱
          ╱
         ╱  FLOW
        ╱  CHANNEL
       ╱
      ╱
Boredom
     Skill →
```

Players are in flow when challenge matches skill. As skill grows, challenge must grow too.

### Difficulty Curve Patterns

| Pattern | Shape | Best For |
|---------|-------|----------|
| **Linear** | Steady climb | Puzzle games, tutorials |
| **Sawtooth** | Hard spike → breather → harder spike | Action games, roguelikes |
| **Exponential** | Slow start, steep late game | Strategy, RPGs |
| **Player-driven** | Player chooses difficulty | Open world, sandbox |

<details><summary>Difficulty Design Guidelines</summary>

**Sawtooth pattern (most versatile):**
- Each "tooth" introduces one new challenge element
- Breather sections let players consolidate skills
- Boss encounters test mastery of recent skills
- Each peak is slightly higher than the last

**Common mistakes:**
- Difficulty spike with no new skill to learn (frustrating)
- Long plateaus with no challenge growth (boring)
- Multiple new mechanics introduced simultaneously (overwhelming)
- Difficulty that requires content knowledge, not skill (unfair)

</details>

## Systems Thinking

### Feedback Loops in Games

| Type | Effect | Example |
|------|--------|---------|
| **Positive (reinforcing)** | Rich get richer, snowball effect | Winning team gets more resources → wins more |
| **Negative (balancing)** | Rubber-banding, catch-up mechanics | Losing player gets better items → catches up |

**Design guideline:** Positive feedback loops create decisive, dramatic moments. Negative feedback loops create tension and comebacks. Most games need both.

### Planning for Emergence

Emergence = simple rules creating complex behavior players didn't expect.

**How to design for emergence:**
1. Create systems that interact (fire + wind, physics + inventory)
2. Give players tools, not solutions
3. Don't hard-code outcomes — let systems resolve naturally
4. Playtest and observe what players discover

**Warning:** Emergence is unpredictable. Budget testing time for discovering (and deciding whether to keep) unintended interactions.

<details><summary>Systems Interaction Planning</summary>

**Approach:** Map systems as nodes, interactions as edges.

```
[Combat] ←→ [Physics]
   ↕            ↕
[Inventory] ←→ [Environment]
```

For each edge, ask:
- What happens when these systems interact?
- Can the player exploit this interaction?
- Is the exploitation fun or game-breaking?
- Does this interaction create interesting choices?

**Rule of thumb:** 3-4 interconnected systems create enough emergence for an MLP. More systems = exponentially more interactions to test.

</details>

## Narrative Integration

### 4 Integration Levels

| Level | Description | Example |
|-------|-------------|---------|
| **Separated** | Story and gameplay don't interact | Cutscene → gameplay → cutscene |
| **Contextual** | Story gives meaning to gameplay | "You're fighting to save your sister" |
| **Integrated** | Gameplay mechanics serve the story | Losing health = character getting weaker narratively |
| **Emergent** | Gameplay creates unique stories | Dwarf Fortress, RimWorld, Hades |

**For MLP:** Aim for Contextual at minimum. Integrated if your game is narrative-driven. Emergent only if systems support it naturally.

### Ludonarrative Dissonance Test

**Ask:** "Does what the player DOES match what the story SAYS?"

| Dissonance | Mechanic | Narrative | Problem |
|-----------|----------|-----------|---------|
| Ludonarrative | Kill hundreds of enemies | "I'm not a violent person" | Actions contradict character |
| Tonal | Goofy physics | Serious story | Mood clashes |
| Pacing | Urgent main quest | 100 side quests available | Urgency undercut by freedom |

**Guideline:** If you can't resolve dissonance, lean into it (comedy) or restructure the narrative to match the mechanics.

## Game Feel & Juice

### MLP Juice Checklist

Minimum feedback to make core actions feel good:

- [ ] **Screen shake** on impactful actions (hit, explosion, landing)
- [ ] **Hit pause** (1-3 frames freeze on contact)
- [ ] **Sound effect** for every player action
- [ ] **Visual feedback** for state changes (damage flash, pickup glow)
- [ ] **Particle effects** on key moments (death, collection, ability use)

### The Juice-Is-Not-A-Substitute Rule

Juice makes a fun game feel amazing. Juice does NOT make an unfun game fun.

**Test:** Is your game fun with all juice/polish removed? If no, fix the mechanics first.

**Priority order:**
1. Fun mechanics (no juice needed to validate)
2. Functional feedback (player understands what happened)
3. Juice (makes good mechanics feel great)

## Onboarding Patterns

| Pattern | Description | Best For |
|---------|-------------|----------|
| **Learn-by-doing** | Drop player in, introduce mechanics naturally | Action games, platformers |
| **Gated complexity** | Lock advanced mechanics until basics mastered | RPGs, strategy games |
| **Guided tutorial** | Explicit instructions with practice | Complex systems, sims |

<details><summary>Onboarding Design Guidelines</summary>

**Learn-by-doing (preferred for MLP):**
- First room/level teaches ONE mechanic
- Safe environment to experiment
- Fail state is gentle (quick restart, not game over)
- No text walls — show, don't tell

**Common mistakes:**
- Teaching every mechanic in the tutorial before fun starts
- Unskippable tutorials for returning players
- Text-heavy explanations of things players could discover
- Tutorial that's not representative of actual gameplay

</details>

## Progression Systems

| Type | Mechanism | Risk |
|------|-----------|------|
| **Skill-based** | Player gets better at the game | Can hit ceiling without external help |
| **Character-based** | Stats/abilities increase over time | Can mask boring core loop |
| **Content-based** | New levels, areas, enemies unlock | Expensive to produce, consumed quickly |
| **Narrative-based** | Story unfolds with progress | Can feel like carrot-on-stick |
| **Social-based** | Rankings, sharing, competition | Requires player base |

**For MLP:** Skill-based progression is free (no content cost) and validates core loop strength. If your game isn't fun without character/content progression, the core loop needs work.

<details><summary>Progression Design Guidelines</summary>

**Layering progression:**
- Start with skill-based (core loop mastery)
- Add character-based (new tools, not just bigger numbers)
- Layer content-based (new contexts for core loop)
- Weave narrative (motivation to continue)

**Red flags:**
- Players need progression to tolerate gameplay → fix the gameplay
- Progression makes the game easier instead of different → adjust curve
- All progression is numeric (+5 damage) → add qualitative variety

</details>

## See Also

- **game-scoping** — Apply these frameworks to scope decisions (MLP, tracer bullets, feature cutting)
- **game-antipatterns** — Common mistakes when applying these frameworks incorrectly
