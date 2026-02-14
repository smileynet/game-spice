# Tracer Bullet Methodology

## 5-Layer Vertical Slice

A tracer bullet proves your game works end-to-end through all layers:

```
┌─────────────────────────────────────┐
│  Layer 1: INPUT                     │
│  Player presses button / clicks     │
├─────────────────────────────────────┤
│  Layer 2: CORE MECHANIC             │
│  Game responds (character jumps,    │
│  card plays, piece moves)           │
├─────────────────────────────────────┤
│  Layer 3: GAME STATE                │
│  World updates (health, position,   │
│  score, inventory)                  │
├─────────────────────────────────────┤
│  Layer 4: FEEDBACK                  │
│  Player sees/hears result (screen   │
│  shake, sound, animation)           │
├─────────────────────────────────────┤
│  Layer 5: OUTPUT / CONSEQUENCE      │
│  Game state creates new situation   │
│  (new challenge, reward, game over) │
└─────────────────────────────────────┘
```

**Rule:** Your first build should touch all 5 layers for ONE action. Don't build Layer 1 for all actions before starting Layer 2.

## Tracer Bullet Examples

| Genre | Tracer Bullet (First Build Target) |
|-------|-----------------------------------|
| Platformer | Player runs and jumps on one platform, falls and respawns |
| Roguelike | Player enters one room, fights one enemy, picks up one item |
| Puzzle | Player manipulates one puzzle element, solves one puzzle |
| Tower Defense | Player places one tower, one enemy walks the path |
| Card Game | Player draws a hand, plays one card, sees its effect |

## What a Tracer Bullet is NOT

- Not a polished demo (programmer art is fine)
- Not feature-complete (one path through the game)
- Not balanced (numbers can be wrong)
- Not content-rich (one level, one enemy type, one item)
