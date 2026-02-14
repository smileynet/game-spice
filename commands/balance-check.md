---
description: Audit your game's economy balance and difficulty curve to catch design issues before they become code problems
argument-hint: [--report]
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

## Summary

**On-demand economy and difficulty audit.** Scans planning docs and code for economy design, applies validation gates, checks for anti-patterns, scores balance heuristics, and evaluates difficulty curves.

**Arguments:** `$ARGUMENTS` (optional) - Pass `--report` to save the audit to `docs/planning/balance-audit-<date>.md`

**Output:** Structured report with findings, severity ratings, and fix recommendations.

---

## Process

### Step 1: Gather Economy Context

**Load skill knowledge:**

```
Read(file_path="skills/game-economy-design/balance.md")
Read(file_path="skills/game-plan-audit/detailed-audits.md")
Read(file_path="skills/game-difficulty-design/SKILL.md")
```

**Scan for planning documents:**

```
Glob(pattern="docs/planning/**/*.md")
Glob(pattern="docs/planning/**/*.yaml")
Glob(pattern="**/brainstorm*.md", path="docs/")
Glob(pattern="**/menu-plan*.md", path="docs/")
Glob(pattern="**/economy*.md", path="docs/")
Glob(pattern="**/balance*.md", path="docs/")
```

**Scan for bead documents with economy/balance tags:**

```
Grep(pattern="tags:.*\\b(economy|balance)\\b", glob="docs/**/*.md")
Grep(pattern="tags:.*\\b(economy|balance)\\b", glob=".beads/**/*.md")
```

Read any found documents and extract economy-related information. For each resource identified, map using the Value Chains framework:

| Element | Question |
|---------|----------|
| **Source** | Where does the resource come from? |
| **Sink** | Where does it leave the system? |
| **Flow Rate** | How fast does it accumulate? |
| **Lifetime** | How long does a unit last before being spent? |
| **Player Decision** | What choice does the player make with it? |
| **Interconnection** | How does it connect to other resources? |

Extract from planning docs:
- Resource definitions (currencies, items, XP, energy)
- Taps (sources of resources)
- Sinks (ways resources leave the system)
- Progression curves or milestones
- Pricing tables or reward structures

**Scan codebase for economy implementation:**

```
Grep(pattern="currency|resource|gold|coin|reward|loot|price|cost|shop|store|inventory|economy", glob="*.{ts,js,py,gd,cs,rs,go,lua}", -i=true)
```

**If no planning docs or economy code found:**

```
AskUserQuestion(questions=[{
  question: "No economy planning docs or code found. Can you describe your game's economy? What resources does the player earn and spend?",
  header: "Economy",
  options: [
    {label: "Single resource", description: "One currency (coins, XP, energy) with basic earn/spend"},
    {label: "Dual currency", description: "Two resources (e.g., gold + gems, or currency + crafting materials)"},
    {label: "No economy yet", description: "Haven't designed the economy — audit difficulty curve only"},
    {label: "I'll describe it", description: "Let me explain the economy system in detail"}
  ],
  multiSelect: false
}])
```

If "No economy yet" is selected, skip to Step 5 (Difficulty Curve Scoring) and note in the report that the economy audit was skipped.

**Output context summary:**

```
BALANCE AUDIT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Economy context loaded:
  Sources: <list of planning docs and code files found>
  Resources identified: <list of resources>
  Taps found: <count>
  Sinks found: <count>
```

### Step 2: Validation Gates

Apply the 4 validation gates in order. Each gate must pass before proceeding to the next. A gate "fails" if there's a clear design problem; it "warns" if there's insufficient information to evaluate.

**Gate 1: Is the core loop fun without any economy?**

Check if the game design has a core loop defined independently of the economy:
- Search for core loop documentation in planning docs
- Look for gameplay mechanics that work without resource management
- If the core loop IS the economy (e.g., idle game, tycoon), this gate passes automatically

```
GATE 1: Core Loop Independence
  Result: PASS | WARN | FAIL
  Evidence: <what was found>
  Note: <explanation>
```

**Gate 2: Does the economy create interesting choices?**

Evaluate whether spending resources involves real decisions:
- Are there multiple competing spend paths?
- Can the player make a wrong choice (not just a slower one)?
- Does spending feel different from not spending?

```
GATE 2: Meaningful Choices
  Result: PASS | WARN | FAIL
  Evidence: <what was found>
  Note: <explanation>
```

**Gate 3: Does content production break the economy?**

Check if adding more content (levels, enemies, items) would destabilize the economy:
- Does each new content piece introduce a new resource or currency?
- Are rewards scaled to content difficulty?
- Could a player exploit content ordering?

```
GATE 3: Content Resilience
  Result: PASS | WARN | FAIL
  Evidence: <what was found>
  Note: <explanation>
```

**Gate 4: Do edge cases exploit the economy?**

Test min/max strategies and find dominant paths:
- What happens if a player hoards one resource?
- What happens if a player spends immediately?
- Is there a spreadsheet-solvable optimal path?

```
GATE 4: Edge Case Robustness
  Result: PASS | WARN | FAIL
  Evidence: <what was found>
  Note: <explanation>
```

### Step 3: Economy Anti-Pattern Check

Check for each of the 8 economy anti-patterns (from balance.md). For each one found, provide the symptom observed and the recommended fix.

| # | Anti-Pattern | Check Against | Also covers |
|---|---|---|---|
| 1 | **Infinite faucet** | Do all resource sources have matching sinks? Can resources accumulate with nothing to spend on? | Overlaps: "No Sinks" red flag |
| 2 | **Single dominant strategy** | Is one spend path always optimal? Are there situational reasons to choose alternatives? | Overlaps: "Single Optimal Path" red flag |
| 3 | **Number goes up** | Is progression purely numerical (+5 damage)? Are there qualitative choices (fire vs ice, speed vs power)? | |
| 4 | **Meaningless choice** | Are all options roughly equivalent? Do options have clear trade-offs? | Overlaps: "Obvious Spending" red flag |
| 5 | **Pay wall** | Is progress impossible without a specific resource? Are there multiple paths to advancement? | |
| 6 | **Reward inflation** | Do early rewards feel worthless quickly? Does reward meaning scale, not just quantity? | |
| 7 | **Hyperinflation** | Do mid-to-late game resources lose all meaning? Do exponential taps have matching exponential sinks? | Overlaps: "Infinite Accumulation" red flag |
| 8 | **Grind wall** | Are there exponential costs without exponential rewards? Do cost and reward curves grow proportionally? | |

For each anti-pattern, output:

```
[<number>] <Anti-Pattern Name>: <CLEAR | DETECTED | RISK>
    <If DETECTED or RISK: describe the symptom and recommended fix>
```

Also check these additional economy red flags from the Value Chains methodology:

| # | Red Flag | Check Against |
|---|---|---|
| 9 | **Dead-end resources** | Does any resource have nowhere useful to go? No spend path? |
| 10 | **Unconnected systems** | Do resources exist in isolation with no interaction between them? |
| 11 | **Unchecked positive feedback** | Do rich players get richer with no catch-up mechanic? |
| 12 | **Currency without choice** | Is there a currency with only one thing to buy? |
| 13 | **Invisible economy** | Can the player see and understand resource flows? |
| 14 | **Complexity mismatch** | Does economy sophistication match the genre? (e.g., stock market in a platformer) |

For each red flag, output in the same format as above.

**Currency addition test:**
- Count the number of distinct currencies/resources
- For each currency: could an existing currency fill this role?
- If multiple currencies exist, assess whether any can be merged
- Output: `Currency count: <N> — <APPROPRIATE | COULD_MERGE: detail | EXCESSIVE: detail>`

**Cross-system interaction warning:**
- Do individually balanced resource loops create exploits when combined?
- What happens when a player focuses entirely on one resource?
- Output: `Cross-System Interactions: <assessment>`

### Step 4: Balance Heuristics

Apply each heuristic to the economy design. These are softer checks — not pass/fail but scored assessments.

**Time to First Value (TTFV):**
- Can the player earn AND spend a resource within the first play session?
- Is the first purchase achievable in 5-15 minutes?
- Score: `GOOD` (meets targets) | `SLOW` (too long to first purchase) | `FAST` (too generous, no anticipation) | `UNKNOWN` (insufficient data)

**Session-End Progress:**
- Does every play session end with visible progress toward the next purchase/milestone?
- Can a player afford everything after one session? (too generous)
- Can a session end with zero meaningful advancement? (too sparse)
- Score: `GOOD` | `FLAT` (no visible progress) | `GENEROUS` (too fast) | `UNKNOWN`

**Percentage-Based Sinks:**
- Do costs scale with player wealth?
- Are there mechanisms preventing late-game hoarding?
- Score: `PRESENT` | `ABSENT` | `NOT_NEEDED` (single resource / early MLP) | `UNKNOWN`

**Diminishing Returns:**
- Does stacking one strategy yield diminishing returns?
- Are there incentives for diversification?
- Score: `PRESENT` | `ABSENT` | `NOT_NEEDED` | `UNKNOWN`

**Value Anchor:**
- Is there one anchor purchase that makes all other prices intuitive?
- Can the player judge if prices are fair?
- Score: `CLEAR` (anchor defined) | `MISSING` (no reference point) | `UNKNOWN`

### Step 5: Difficulty Curve Scoring

**Check if difficulty design exists:**

```
Glob(pattern="docs/planning/**/difficulty*.md")
Glob(pattern="docs/planning/**/challenge*.md")
```

Also check the economy context gathered in Step 1 for any difficulty-related information (level progression, enemy scaling, etc.).

**If no difficulty design found:**

```
AskUserQuestion(questions=[{
  question: "No difficulty curve documentation found. Should I assess difficulty from what I can infer, or skip this section?",
  header: "Difficulty",
  options: [
    {label: "Infer from context", description: "Assess difficulty based on available planning docs and code"},
    {label: "Skip", description: "Skip difficulty assessment — focus on economy only"}
  ],
  multiSelect: false
}])
```

**If assessing difficulty, evaluate:**

**Curve Shape:**
Identify which pattern the game uses (or should use):
- Staircase / Sawtooth (recommended for most games)
- Ramp / Linear (short experiences, arcade)
- Wave / Sine wave (story-driven)
- Cliff (anti-pattern — sudden unwarned spike)
- Plateau (anti-pattern — stops escalating)

**Difficulty Anti-Patterns:**
Check for each:
1. Fake Difficulty — challenge from bad controls/camera, not game design
2. Number Inflation — enemies just get more HP, no new behaviors
3. Cliff Difficulty — sudden spike with no warning
4. Gotcha Difficulty — must die to learn
5. Grind Gates — progress blocked by repetition, not skill

**Skill Floor/Ceiling:**
Assess the target quadrant:

| | Low Ceiling | High Ceiling |
|---|---|---|
| **Low Floor** | Casual | Accessible depth |
| **High Floor** | Frustrating (avoid) | Hardcore niche |

**Output difficulty assessment:**

```
DIFFICULTY CURVE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Curve shape: <identified pattern>
  Assessment: <appropriate for genre? any anti-patterns?>

Anti-patterns:
  [<number>] <pattern>: CLEAR | DETECTED | RISK
  ...

Skill range:
  Floor: <low/high> — <evidence>
  Ceiling: <low/high> — <evidence>
  Quadrant: <casual/accessible depth/frustrating/hardcore niche>
  Match to audience: <assessment>
```

### Step 6: Output Report

Compile all findings into a structured report.

**Severity ratings:**
- `CRITICAL` — Design will break; fix before building
- `MAJOR` — Significant issue; fix before playtesting
- `MINOR` — Worth noting; can address during iteration
- `INFO` — Observation, no action needed

**Report format:**

```
╔══════════════════════════════════════════════════════════════╗
║  BALANCE AUDIT REPORT                                        ║
╚══════════════════════════════════════════════════════════════╝

Project: <project name>
Date: <date>
Sources: <count> planning docs, <count> code files analyzed

═══════════════════════════════════════════════════════════════
VALIDATION GATES
═══════════════════════════════════════════════════════════════

Gate 1: Core Loop Independence ........... PASS | WARN | FAIL
Gate 2: Meaningful Choices ............... PASS | WARN | FAIL
Gate 3: Content Resilience ............... PASS | WARN | FAIL
Gate 4: Edge Case Robustness ............. PASS | WARN | FAIL

<For each non-PASS gate, include details and recommendation>

═══════════════════════════════════════════════════════════════
ECONOMY ANTI-PATTERNS
═══════════════════════════════════════════════════════════════

[1]  Infinite Faucet ..................... CLEAR | DETECTED | RISK
[2]  Single Dominant Strategy ........... CLEAR | DETECTED | RISK
[3]  Number Goes Up ..................... CLEAR | DETECTED | RISK
[4]  Meaningless Choice ................. CLEAR | DETECTED | RISK
[5]  Pay Wall ........................... CLEAR | DETECTED | RISK
[6]  Reward Inflation ................... CLEAR | DETECTED | RISK
[7]  Hyperinflation ..................... CLEAR | DETECTED | RISK
[8]  Grind Wall ......................... CLEAR | DETECTED | RISK
[9]  Dead-End Resources ................. CLEAR | DETECTED | RISK
[10] Unconnected Systems ................ CLEAR | DETECTED | RISK
[11] Unchecked Positive Feedback ........ CLEAR | DETECTED | RISK
[12] Currency Without Choice ............ CLEAR | DETECTED | RISK
[13] Invisible Economy .................. CLEAR | DETECTED | RISK
[14] Complexity Mismatch ................ CLEAR | DETECTED | RISK

Currency Addition Test: <APPROPRIATE | COULD_MERGE | EXCESSIVE>
Cross-System Interactions: <assessment>

<For each DETECTED or RISK, include symptom and fix>

═══════════════════════════════════════════════════════════════
BALANCE HEURISTICS
═══════════════════════════════════════════════════════════════

Time to First Value ...................... GOOD | SLOW | FAST | UNKNOWN
Session-End Progress ..................... GOOD | FLAT | GENEROUS | UNKNOWN
Percentage-Based Sinks ................... PRESENT | ABSENT | NOT_NEEDED | UNKNOWN
Diminishing Returns ...................... PRESENT | ABSENT | NOT_NEEDED | UNKNOWN
Value Anchor ............................. CLEAR | MISSING | UNKNOWN

<For each non-GOOD/PRESENT/CLEAR, include recommendation>

═══════════════════════════════════════════════════════════════
DIFFICULTY CURVE
═══════════════════════════════════════════════════════════════

<Difficulty assessment from Step 5, or "Skipped — no difficulty design found">

═══════════════════════════════════════════════════════════════
FINDINGS SUMMARY
═══════════════════════════════════════════════════════════════

Critical: <count>
  - <finding with recommendation>

Major: <count>
  - <finding with recommendation>

Minor: <count>
  - <finding with recommendation>

Info: <count>
  - <observation>

═══════════════════════════════════════════════════════════════
RECOMMENDATIONS
═══════════════════════════════════════════════════════════════

Priority fixes (address before building):
  1. <most critical finding and specific action>
  2. <next most critical>
  ...

Iteration notes (address during playtesting):
  - <minor findings that can wait>
```

### Step 7: Save Report (if --report)

If `$ARGUMENTS` contains `--report`:

```bash
date +%Y-%m-%d
```

```
Write(file_path="docs/planning/balance-audit-<date>.md", content=<report in markdown format>)
```

**Markdown report format:**

```markdown
# Balance Audit Report

> Generated by /game:balance-check on <date>

## Sources
- <list of planning docs and code files analyzed>

## Validation Gates
<gate results with details>

## Economy Anti-Patterns
<anti-pattern results with details>

## Balance Heuristics
<heuristic scores with recommendations>

## Difficulty Curve
<difficulty assessment>

## Findings Summary
<prioritized findings>

## Recommendations
<priority fixes and iteration notes>
```

Output save confirmation:

```
Report saved: docs/planning/balance-audit-<date>.md
```

### Step 8: Output Summary

```
╔════════════════════════════════════════════════════╗
║  BALANCE AUDIT COMPLETE                            ║
╚════════════════════════════════════════════════════╝

Gates: <passed>/<total> passed
Anti-Patterns: <detected>/<total> detected
Heuristics: <scored>/<total> scored
Difficulty: <assessed | skipped>

Findings: <critical> critical, <major> major, <minor> minor

<If --report: "Report saved: docs/planning/balance-audit-<date>.md">

Next steps:
  - Address critical findings before building
  - Use findings to guide economy implementation
  - Re-run after changes: /game:balance-check
```
