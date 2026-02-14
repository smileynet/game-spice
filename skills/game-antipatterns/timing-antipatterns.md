# Timing Anti-Patterns

## Core Loop Neglect

**What it looks like:** Months of work on menus, save systems, settings, progression, content — but the core gameplay loop was never validated as fun.

**Why it happens:** Infrastructure feels necessary. "We can't test properly without saves." "We need a menu system first." These are procrastination disguised as productivity.

**The damage:** When the core loop finally gets attention, it's not fun. Now there's a mountain of infrastructure built around a broken foundation.

**The fix:**
1. First playable build = core loop only (no menus, no saves, no progression)
2. Validate fun before building anything else
3. Infrastructure comes AFTER the loop is proven

**Priority order:** Core loop → game feel → content → progression → infrastructure → polish

## Second System Effect

**What it looks like:** Developer's second game project is massively over-scoped because "I know what I'm doing now" and "I learned from my mistakes."

**Why it happens:** Success (or lessons from failure) on a first project creates overconfidence. The developer adds all the features they wished their first game had.

**The damage:** Second project is 3-5x the scope of the first. Development takes years. Developer burns out or abandons it.

**The fix:**
- Scope your second project like it's your first
- Apply the 30% rule twice (cut 30%, then cut another 30%)
- Past experience means you'll build faster, not bigger

## Narrative/Mechanics Disconnect

**What it looks like:** The story wants the player to be urgent ("Save the world!") but mechanics reward slow, methodical exploration. Or the narrative says "you're weak" but mechanics make you powerful from the start.

**Why it happens:** Story and mechanics are designed by different people (or at different times) without integration.

**The damage:** Players feel cognitive dissonance. The game's message is incoherent. Neither the story nor the mechanics land with full impact.

**The fix:**
1. Define the core player fantasy before designing either narrative or mechanics
2. Apply the ludonarrative dissonance test from game-design-frameworks
3. When in conflict, mechanics win (players experience what they DO, not what they're TOLD)
