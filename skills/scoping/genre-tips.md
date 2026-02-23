# Genre-Specific Scoping Tips

## Platformer

**MLP must have:** Run, jump, land on platforms, one hazard type, one level.

**Common over-scope:** Wall jump, double jump, dash, multiple worlds. Pick ONE movement verb beyond run+jump for MLP.

**Tracer bullet:** Character moves left/right, jumps, lands on a platform, falls into a pit, respawns.

**Hidden complexity:** Jump feel (coyote time, jump buffering, variable height) can consume as much time as building 5 levels. Budget for it.

## Roguelike

**MLP must have:** One floor, one enemy type, one item/upgrade, permadeath + restart.

**Common over-scope:** Meta-progression, 10+ enemy types, complex inventory, procedural generation before fun is proven. Handcraft your first 3 rooms.

**Tracer bullet:** Enter room, fight enemy, pick up item, die, restart with nothing.

**Hidden complexity:** Procedural generation that feels good (not random) is a project unto itself. Use handcrafted rooms for MLP.

## Puzzle Game

**MLP must have:** One puzzle mechanic, 5-10 handcrafted puzzles, clear win state per puzzle.

**Common over-scope:** Procedural puzzle generation, hint system, multiple mechanics in MLP.

**Tracer bullet:** Player sees puzzle, manipulates elements, puzzle solves, next puzzle loads.

**Hidden complexity:** Difficulty curves in puzzles require extensive playtesting. Your "easy" puzzle won't be easy for everyone.

## Tower Defense

**MLP must have:** One enemy path, one tower type, waves, win/lose condition.

**Common over-scope:** Tech trees, multiple maps, hero units, special abilities.

**Tracer bullet:** Enemy walks path, player places tower, tower shoots enemy, enemy dies or reaches end.

**Hidden complexity:** Balancing tower cost vs enemy health vs wave difficulty is iterative. Don't try to get numbers right in planning.
