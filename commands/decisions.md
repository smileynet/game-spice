---
description: Browse and search design decisions from the active session
argument-hint: [category|phase|origin]
allowed-tools: Read, Glob, Grep
---

## Summary

**Decision browsing — browse and filter design decisions with provenance visibility.** Read-only inspection of the active session's decisions.log.

**Arguments:** `$ARGUMENTS` (optional) - Filter by category (e.g., `genre`, `mechanics`), phase (e.g., `brainstorm`, `simulate`), or origin (e.g., `user`, `suggested`, `inferred`)

**Output:** Formatted decision table with provenance markers and summary statistics.

---

## Process

### Step 1: Find Active Session

```
Glob(pattern=".game-design/sessions.yaml")
```

**If `.game-design/sessions.yaml` does not exist:**

```
NO ACTIVE SESSION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

No game design sessions found.

Get started: /game:start
```

**Stop here.**

**If `.game-design/sessions.yaml` exists:**

```
Read(file_path=".game-design/sessions.yaml")
```

Check if the `sessions` list has entries. If the list is empty:

```
NO ACTIVE SESSION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session index exists but contains no sessions.

Get started: /game:start
```

**Stop here.**

Select the most recently updated session (sort by `updated` descending, pick the first).

### Step 2: Load Decisions Log

```
Read(file_path=".game-design/<slug>/decisions.log")
```

Parse the pipe-delimited file. The header row is: `id|date|phase|category|origin|decision|rationale|alternatives`

Each data row contains those 8 fields separated by `|`.

**If the file does not exist or contains only the header row (no data rows):**

```
NO DECISIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" has no design decisions logged yet.

Decisions are recorded during brainstorm and simulation phases.

Get started: /game:brainstorm
```

**Stop here.**

### Step 3: Apply Filter

**If `$ARGUMENTS` is provided and non-empty:**

Determine which field the argument matches by checking against known values:

- **Phase values:** `brainstorm`, `simulate`, `build-plan`
- **Origin values:** `user`, `suggested`, `inferred`
- **Category:** anything else (e.g., `genre`, `mechanics`, `core_loop`, `scope`, `ui-ux`, `progression`, `feedback`, `content`)

Filter the parsed rows to only include rows where the matching field equals the argument (case-insensitive).

**If the filter matches no rows:**

```
NO MATCHES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

No decisions found matching "<argument>".

Available categories: <comma-separated list of unique categories in the log>
Available phases: <comma-separated list of unique phases in the log>
Available origins: user, suggested, inferred

Usage: /game:decisions <category|phase|origin>
```

**Stop here.**

**If no argument is provided:** Use all data rows (no filtering).

### Step 4: Present Decision Table

Display the decisions in a formatted table. Mark provenance visually:

- `user` origin decisions: shown as-is (no marker)
- `suggested` origin decisions: decision text prefixed with `[suggested]`
- `inferred` origin decisions: decision text prefixed with `[inferred]`

**Output format:**

```
DECISIONS<if filtered: " — <argument>">
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: <title>
<If filtered: "Filtered by: <argument>">
<If filtered: "Showing <filtered_count> of <total_count> decisions">

───────────────────────────────────────────

  ID   │ Date       │ Category    │ Origin    │ Decision                        │ Rationale
  ─────┼────────────┼─────────────┼───────────┼─────────────────────────────────┼──────────────────────────
  <id> │ <date>     │ <category>  │ <origin>  │ <decision text>                 │ <rationale>
  <id> │ <date>     │ <category>  │ <origin>  │ [suggested] <decision text>     │ <rationale>
  <id> │ <date>     │ <category>  │ <origin>  │ [inferred] <decision text>      │ <rationale>
  ...

───────────────────────────────────────────
```

### Step 5: Summary Statistics

Calculate and display summary stats from the **full** decisions.log (not the filtered subset):

```
───────────────────────────────────────────
SUMMARY
───────────────────────────────────────────

Total decisions: <total_count>

By category:
  <category>: <count>
  <category>: <count>
  ...

By origin:
  user: <user_count>
  suggested: <suggested_count>
  inferred: <inferred_count>

By phase:
  <phase>: <count>
  ...
```

### Step 6: Provenance Advisory

Calculate the percentage of decisions that are NOT `user` origin:

```
ai_proposed_pct = (suggested_count + inferred_count) / total_count * 100
```

**If `ai_proposed_pct` > 50:**

```
───────────────────────────────────────────
⚠ PROVENANCE NOTE
───────────────────────────────────────────

<ai_proposed_pct>% of decisions were AI-proposed (<suggested_count> suggested +
<inferred_count> inferred out of <total_count> total).

Consider reviewing these during playtesting to confirm they
match your design intent.

Filter AI decisions: /game:decisions suggested
                     /game:decisions inferred
```

**If `ai_proposed_pct` <= 50:** Omit this section.

## Error Handling

**If sessions.yaml exists but the selected session's decisions.log is missing:**

```
MISSING LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session "<title>" has no decisions.log file.

The file may have been deleted or the session was not properly initialized.

Options:
  - Re-run brainstorm: /game:brainstorm
  - Check session directory: .game-design/<slug>/
```

**If decisions.log has malformed rows:**

Skip malformed rows (rows that don't have exactly 8 pipe-delimited fields) and display the valid rows. Append a warning at the end:

```
⚠ <count> malformed row(s) skipped in decisions.log
```

## Example Usage

```
/game:decisions              # Show all decisions for the active session
/game:decisions mechanics    # Filter by category: mechanics
/game:decisions brainstorm   # Filter by phase: brainstorm
/game:decisions suggested    # Filter by origin: suggested
/game:decisions inferred     # Show only AI-inferred decisions
```
