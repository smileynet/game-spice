---
name: game-economy-design
description: Game economy and resource balance planning. Use when designing resource systems, currencies, loot tables, progression curves, reward structures, or planning how players earn and spend in a game. Covers taps and sinks, economy flow mapping, reward planning, balance frameworks.
---

# Game Economy & Balance Planning

Plan resource systems that create meaningful choices. Start simple, add complexity only when needed.

## Quick Reference

### Economy Complexity Decision

| Complexity | What It Is | Best For | MLP Viable? |
|---|---|---|---|
| **None** | No persistent resources | Puzzle, rhythm, pure action | Yes |
| **Single resource** | One currency (coins, XP, energy) | Platformer, casual, arcade | Yes |
| **Dual currency** | Soft + hard currency, or resource + currency | RPG-lite, tower defense, roguelike | Yes (start with one) |
| **Full economy** | Multiple interconnected resources | Sim, strategy, MMO, survival | No — scope to single resource for MLP |

**Decision rule:** Start one level simpler than you think you need. Add complexity after playtesting proves the simple version lacks interesting choices.

### MLP Economy Checklist

- [ ] At least one resource the player earns (tap exists)
- [ ] At least one meaningful way to spend it (sink exists)
- [ ] Spending involves a real choice (not obvious best option)
- [ ] Resource is visible and understandable to the player
- [ ] Economy supports ≥10 minutes of play without breaking (no infinite loops, no dead ends)

## Economy Frameworks

<details><summary>Taps & Sinks Framework</summary>

**Taps** = sources where resources enter the economy. **Sinks** = drains where resources leave.

```
  [TAP]              [SINK]
  Resources    →→→   Resources
  enter              leave
  (earn gold)        (buy items)
```

| If... | Then... | Fix |
|-------|---------|-----|
| Taps > Sinks | Inflation — resources lose meaning | Add sinks (repair costs, consumables, upgrades) |
| Sinks > Taps | Deflation — players feel starved | Add taps or reduce sink costs |
| Taps = Sinks | Equilibrium — but can feel flat | Add variance (jackpots, costly upgrades) |

**MLP rule:** One tap, one sink, one resource. Prove the decision is interesting before adding more.

**Common taps:** Enemy drops, quest rewards, harvesting, time-based generation, exploration pickups.

**Common sinks:** Purchasing items/upgrades, crafting costs, repair/maintenance, consumable use, entry fees.

</details>

<details><summary>Economy Flow Mapping</summary>

Map your economy as a node graph to spot problems:

```
[Earn Gold] → [Gold Pool] → [Buy Sword]
                    ↓
              [Buy Potion] → [Use in Combat] → [Survive] → [Earn More Gold]
```

**What to look for:**
- **Dead ends** — resources with no sink (accumulate forever, lose meaning)
- **Circular flows** — spend to earn to spend (good — this is your economy loop)
- **Disconnected nodes** — resources that don't interact (simplify or connect them)
- **Single path** — only one way to spend (no interesting choice)

**For MLP:** Your economy graph should have 3-5 nodes maximum. If it needs more, you're over-scoping.

</details>

<details><summary>Progression Curves</summary>

How resource costs and rewards scale over time:

| Curve | Pattern | Feel | Best For |
|-------|---------|------|----------|
| **Linear** | Cost increases by fixed amount | Predictable, steady | Casual, puzzle |
| **Exponential** | Cost doubles or triples | Early progress fast, late game grindy | RPG, idle |
| **Logarithmic** | Cost increases slow down | Diminishing returns feel fair | Skill upgrades |
| **Stepped** | Flat periods with sudden jumps | Clear milestones and goals | Tier-based progression |

**"Felt progression" principle:** Players should feel meaningful progress every play session. If a session ends with no visible advancement toward the next purchase/upgrade, the curve is too flat or too steep.

**MLP guidance:** Linear or stepped curves are easiest to balance. Save exponential for post-MLP when you have playtest data.

</details>

<details><summary>Loot & Reward Planning</summary>

**Rarity tiers — design intent, not just drop rates:**

| Tier | Purpose | Player Reaction | Drop Frequency |
|------|---------|-----------------|----------------|
| **Common** | Baseline, always useful | "Good, I need these" | Every encounter |
| **Uncommon** | Meaningful upgrade | "Nice, that's better" | Every few encounters |
| **Rare** | Build-defining choice | "This changes my strategy" | Once per session |
| **Epic/Legendary** | Memorable moment | "I can't believe I got this" | Once per many sessions |

**"First 30 minutes" principle:** Players should see common and uncommon rewards in the first play session. If the first session has no meaningful reward, players won't return for rare ones.

**MLP guidance:** Two tiers (common + uncommon) are enough. Add rare tier only after core loop is proven fun.

</details>

<details><summary>Economy Anti-Patterns</summary>

| Anti-Pattern | Symptom | Fix |
|---|---|---|
| **Infinite faucet** | Resources accumulate with nothing to spend on | Add meaningful sinks before adding more taps |
| **Single dominant strategy** | One spend path is always optimal | Rebalance or add situational value to alternatives |
| **Number goes up** | Progression is purely numerical (+5 damage) | Add qualitative choices (fire vs ice, speed vs power) |
| **Meaningless choice** | All options roughly equivalent | Differentiate options with clear trade-offs |
| **Pay wall** | Progress impossible without specific resource | Ensure multiple paths to advancement |
| **Reward inflation** | Early rewards feel worthless quickly | Scale reward meaning, not just quantity |

</details>

## See Also

- **game-design-frameworks** — Feedback loops, systems thinking, and progression system types `(see game-design-frameworks → Systems Thinking, Progression Systems)`
- **game-scoping** — Cutting heuristics for economy features `(see game-scoping → Ruthless Cutting Heuristics)`
- **game-playtesting** — Validate economy decisions with real players
- **game-antipatterns** — Economy-related planning mistakes and the "Should I Add This Feature?" decision table
- **game-scenario-walkthrough** — Narrate how the economy feels during play
