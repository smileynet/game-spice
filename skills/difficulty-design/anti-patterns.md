# Difficulty Anti-Patterns

## Fake Difficulty Taxonomy

"Fake difficulty" = challenge that doesn't come from interesting gameplay decisions.

| Type | Example | Why It's Unfair | Fix |
|------|---------|----------------|-----|
| **Enemy spam** | 50 enemies where 5 would do | Overwhelms without teaching | Fewer, smarter enemies |
| **Unclear feedback** | Player doesn't know what killed them | Can't learn from failure | Clear death cause indicators |
| **Unfair camera** | Can't see threats before they hit | Failure isn't player's fault | Camera shows relevant threats |
| **Input lag** | Controls feel sluggish or unresponsive | Skill expression blocked | Responsive, tight controls |
| **Hidden information** | Required knowledge never provided | Memorization, not skill | Teach before testing |
| **RNG deaths** | Unavoidable random damage | No player agency | Ensure every death is avoidable |

**The fairness test:** After each death, ask: "Could the player have succeeded with better play?" If yes → fair. If no → fake difficulty.

## Other Difficulty Anti-Patterns

**Developer blind spot:**
- You are too good at your own game — always playtest with fresh eyes
- Your "easy" section is someone else's wall
- Watch three people play before concluding difficulty is "about right"
- `(see playtesting)`

**Number inflation:**
- Prefer relatable HP ranges (20-80 HP) over meaningless scaling (15→9999)
- If enemies have 10,000 HP and you deal 500 damage, the numbers convey nothing
- Smaller numbers → easier to balance, easier for players to understand
- If you need 4+ digits, your scaling formula needs work

**Difficulty as content padding:**
- Making sections artificially hard to extend playtime
- "Grind wall" that requires repetition, not skill improvement
- Spike difficulty to slow progress, then sell the solution (mobile dark pattern)

**Punishing experimentation:**
- If trying new strategies is too risky, players stick to one safe approach
- Good difficulty rewards adaptation; bad difficulty punishes it
- Reduce cost of experimentation: lower stakes, faster recovery, practice modes
