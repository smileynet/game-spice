---
name: game-economy-design
description: Game economy and resource balance planning. Use when designing resource systems, currencies, loot tables, progression curves, reward structures, or planning how players earn and spend in a game. Covers taps and sinks, economy flow mapping, reward planning, balance frameworks, genre economy patterns.
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

## Genre-Specific Economy Patterns

<details><summary>Genre Economy Reference</summary>

**Roguelike (Hades pattern):**
- Separate meta-currency (persistent) from run-currency (per-run)
- Meta-currency buys variety, not power — unlocks new options, not stat boosts
- Run-currency forces interesting in-the-moment choices
- Key: players who unlock everything should still find runs interesting because variety ≠ advantage

**Idle/Incremental:**
- Exponential growth is the genre: production scales ~x1.1 per upgrade, costs scale ~x1.15
- The cost-to-production ratio must gradually widen — progress slows, motivating prestige
- Prestige layers: reset progress for a permanent multiplier, creating a new metagame loop
- Each prestige layer needs its own economy that feeds back into the layer below

**Tower Defense (Plants vs Zombies pattern):**
- Resource generation: passive (time-based), active (player collects), or hybrid (sunflowers)
- Active generation creates micro-decisions that layer onto tower placement macro-decisions
- Economy pacing mirrors wave pacing — scarcity early, abundance mid-wave, spend-down before boss

**RPG (multi-currency):**
- Gold for commerce, XP for progression, materials for crafting — each with separate loops
- Gold sinks prevent inflation: repair costs, consumables, vendor trash buyback
- Material sinks ensure crafting stays relevant: upgrades consume lower-tier materials
- Danger zone: if players can convert between currencies freely, one currency dominates and others lose meaning

**Survival (builder/spender sync):**
- Resources sync with game cycles: gather during day, spend (defend/craft) at night
- Progression-gated resources: tier 2 resources require tier 1 tools to harvest
- Builder/spender rhythm must match — if gathering takes 10 minutes but spending takes 1, pacing breaks

</details>

## Balance Tuning

<details><summary>Balance Heuristics</summary>

**Time to First Value (TTFV):**
- Player should earn AND spend a resource within the first play session
- If a player earns currency but can't afford anything for 3 sessions, the economy feels broken
- TTFV for the first purchase should be 5-15 minutes for most genres

**Session-end progress test:**
- Every play session should end with visible progress toward the next purchase or milestone
- If any session ends with no meaningful advancement, the curve is too flat or rewards are too sparse
- Corollary: if a player can afford everything after one session, rewards are too generous

**Percentage-based sinks:**
- Scale costs with player wealth to prevent inflation naturally
- Repair costs as % of equipment value, not flat fee
- Transaction taxes that grow with economy scale
- This prevents late-game players from hoarding while keeping early-game affordable

**Diminishing returns on generation:**
- First gold mine produces 10/min, second produces 8/min, third produces 6/min
- Encourages diversification over stacking one strategy
- Prevents runaway exponential growth from resource spam

**The value anchor principle:**
- Define one "anchor" purchase that players understand early (a sword costs 100 gold)
- All other prices feel intuitive relative to the anchor (a shield costs 80, a potion costs 20)
- Without an anchor, players can't judge if prices are fair

</details>

## Economy Validation

<details><summary>Design-Phase Validation</summary>

Economy defects found during design are 30x cheaper to fix than those found after players experience them. Validate before building.

**Spreadsheet prototyping:**
- Model your economy in a spreadsheet before writing code
- Project hours/days of gameplay: when does the player hit each milestone?
- Simulate 10 play sessions — does inflation or starvation emerge?
- Column per resource, row per time unit (minutes or sessions)

**Economy flow tracing:**
- Pick one resource and follow it from generation through every spend path
- At each node: is there a meaningful choice? Can the resource dead-end?
- Repeat for each resource — interactions between resources are where bugs hide

**Validation gates (check in order):**
1. Is the core loop fun without any economy? → If no, fix the loop first
2. Does the economy create interesting choices? → If no, simplify or redesign
3. Does content production break the economy? → If yes, rebalance before making more content
4. Do edge cases exploit the economy? → Test min/max strategies, find dominant paths

</details>

## Economy Anti-Patterns

<details><summary>Common Economy Mistakes</summary>

| Anti-Pattern | Symptom | Fix |
|---|---|---|
| **Infinite faucet** | Resources accumulate with nothing to spend on | Add meaningful sinks before adding more taps |
| **Single dominant strategy** | One spend path is always optimal | Rebalance or add situational value to alternatives |
| **Number goes up** | Progression is purely numerical (+5 damage) | Add qualitative choices (fire vs ice, speed vs power) |
| **Meaningless choice** | All options roughly equivalent | Differentiate options with clear trade-offs |
| **Pay wall** | Progress impossible without specific resource | Ensure multiple paths to advancement |
| **Reward inflation** | Early rewards feel worthless quickly | Scale reward meaning, not just quantity |
| **Hyperinflation** | Mid-to-late game resources lose all meaning | Exponential taps need matching exponential sinks |
| **Grind wall** | Exponential costs without exponential rewards | Cost curve and reward curve must grow proportionally |

**"Economy works in isolation but breaks combined":**
- Each resource loop may balance individually, but interactions create exploits
- Map system interactions and test each edge: what happens when a player focuses entirely on one resource?
- Test the player who min-maxes, not just the player who plays "normally"

**Currency addition test:** Before adding a new currency, ask: "Can an existing currency fill this role?" If yes, don't add a new one. Each currency requires new sources + sinks = exponential complexity.

**Dominant strategy (City of Heroes example):** Unlimited same-type enhancements → players stack one stat → diminishing returns fix restored build diversity. If players can stack one thing infinitely, they will.

</details>

## Economy Scaling

<details><summary>Dual → Full Economy Transition</summary>

Most games should start with one currency and add complexity only when proven necessary.

**When to add a second currency:**
- After the first currency has proven it creates interesting choices
- When you need a decision that the first currency can't represent (time vs money, power vs versatility)
- NOT because "RPGs usually have gold and XP" — every currency must earn its place

**Complexity cost per currency:**
- 1 currency: 1 tap/sink pair to balance
- 2 currencies: 2 tap/sink pairs + conversion rate between them = 5 balance points
- 3 currencies: 3 tap/sink pairs + 3 conversion relationships = 9 balance points
- Each new currency roughly doubles total balance complexity

**Planning framework for scaling:**
1. Design the full economy on paper (even if building only one currency for MLP)
2. Define "value anchors" early — what is the baseline worth of each resource?
3. Stub placeholder values for future currencies — this prevents retrofit costs later
4. Expand only after playtesting confirms the current level needs more depth

**Conversion between currencies:**
- Avoid free conversion (makes one currency dominant)
- If conversion exists, make it lossy (spend 100 gold to get 80 gems — the 20% loss IS the balancing mechanism)
- Best approach: currencies serve different purposes with no direct conversion (gold buys items, XP unlocks abilities)

</details>

## See Also

- **game-design-frameworks** — Feedback loops, systems thinking, and progression system types `(see game-design-frameworks → Systems Thinking, Progression Systems)`
- **game-scoping** — Cutting heuristics for economy features `(see game-scoping → Ruthless Cutting Heuristics)`
- **game-playtesting** — Validate economy decisions with real players `(see game-playtesting → Pivot vs Persevere Decision)`
- **game-antipatterns** — Economy-related planning mistakes `(see game-antipatterns → Should I Add This Feature?)`
- **game-scenario-walkthrough** — Narrate how the economy feels during play `(see game-scenario-walkthrough → The 5-Beat Structure)`
- **game-difficulty-design** — Economy difficulty curves and resource scarcity as challenge `(see game-difficulty-design → Challenge Types)`
- **game-content-planning** — Content as economy scope and production cost `(see game-content-planning → Content Scope Estimation)`
- **game-mechanics-palette** — Collection & resource mechanics that feed economy systems `(see game-mechanics-palette → Collection & Resource)`
