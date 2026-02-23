# Scope Anti-Patterns

## Everything Sounds Fun

**What it looks like:** Brainstorming produces 30 great ideas. Every feature sounds exciting. The plan includes all of them because "they're all important."

**Why it happens:** Creative enthusiasm. In brainstorming, ideas feel weightless — there's no sense of the implementation cost. Every feature sounds like "just a day or two."

**The damage:** Project never reaches playable state. Developer burns out building systems nobody tests. Features interact in unplanned ways.

**The fix:**
1. Brainstorm freely (ideas are cheap)
2. Apply the 3-feature MLP rule ruthlessly
3. Keep a "parking lot" document for deferred ideas
4. Revisit the parking lot only AFTER MLP is fun and playable

## Feature Creep vs Future Creep vs Scope Creep

These are different problems with different fixes:

| Type | Definition | Example | Fix |
|------|-----------|---------|-----|
| **Feature Creep** | Adding new features mid-build | "Let's also add a crafting system" | Feature freeze after planning |
| **Future Creep** | Building for hypothetical future | "We'll need multiplayer someday, so architect for it now" | Build for today, refactor when needed |
| **Scope Creep** | Existing features growing in scope | "The inventory was 10 slots, now it needs sorting, filtering, categories..." | Define acceptance criteria upfront |

**Feature Creep signals:**
- "While we're building combat, we should also..."
- "Other [genre] games all have..."
- "This would only take a day to add"
- New beads/issues created mid-sprint that aren't bugs

**Future Creep signals:**
- "We should design the architecture to support..."
- "If we ever want to add multiplayer..."
- "Let's make this configurable in case..."
- Abstraction layers for systems with one implementation

**Scope Creep signals:**
- Acceptance criteria changing after work begins
- "Oh, we also need [edge case] handled"
- Feature taking 3x estimated time
- "It's almost done, just need to add..."

## Premature Content

**What it looks like:** Building 20 levels, 15 enemy types, and a full story before confirming the core loop is fun.

**Why it happens:** Content creation feels productive. It's concrete and visible progress. It's also easier than the hard problem of "is this fun?"

**The damage:** Content is built around mechanics that change during iteration. Levels designed for a jump height that gets retuned. Enemy behaviors designed for a combat system that gets reworked. All that content needs rebuilding.

**The fix:**
1. Prove fun with 1 handcrafted level and 1-2 enemy types
2. Playtest the core loop extensively
3. Only after mechanics stabilize, begin content production
4. Build content tools before building content

**Test:** If you have more content than your playtesters have tested, you've built too much.
