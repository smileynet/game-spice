# Playtest Sessions & Data

## RITE Method (Rapid Iterative Testing and Evaluation)

From Microsoft (Medlock et al., developed for game usability testing). The key insight: fix problems immediately after each participant, verify the fix with the next participant.

**Process:**
1. Test with participant 1 → identify critical problems
2. Fix those problems immediately (same day)
3. Test with participant 2 using the updated build → verify fixes, find new problems
4. Repeat until no changes needed
5. Run 3-6 verification participants on the stable build

**Rules:**
- Decision makers must observe directly — no secondhand reports
- Fix only "critical" and "serious" issues between participants (don't chase minor polish)
- Stop iterating when a participant encounters no new critical issues

**Typical result:** 3-4 iteration participants + 6 verification participants = robust usability. More efficient than testing 10 people then fixing everything at once.

**When to use RITE vs batch testing:**

| Method | Best For | Efficiency |
|--------|----------|-----------|
| **RITE** | Usability, onboarding, UI flows | High — fixes compound across participants |
| **Batch (5-8 at once)** | Core loop fun, difficulty, retention | Better — need pattern across multiple players |

## Session Structure

### Four Phases

**1. Briefing (2-5 minutes)**
- Explain what you're testing (not how to play)
- "Play however feels natural. There are no wrong answers."
- Ask them to think aloud if comfortable
- Get consent for recording/notes

**2. Play Session (15-60 minutes)**
- **Observe silently** — don't help, don't hint, don't react
- Take timestamped notes on behavior, not interpretation
- Note: hesitations, confusion, delight, frustration, repeated actions
- Only intervene if the player is stuck for 2+ minutes on a non-test-relevant blocker

**3. Debrief (10-15 minutes)**
- **Questionnaire FIRST** — written responses before discussion (prevents interviewer influence)
- Then open-ended interview following up on observed moments
- "I noticed you paused at [moment] — what were you thinking?"
- Use FFWWDD questions for structured qualitative feedback

**4. Post-Session (15-30 minutes, team only)**
- Review notes while memory is fresh
- Compare observations across team members
- Identify top 3 issues to address
- Decide: fix now (RITE) or collect more data (batch)

## FFWWDD Framework

Six essential open-ended questions — **F**rustrating, **F**avorite, **W**anted, **W**and, **D**oing, **D**escribe. Ask in this exact order during debrief. Overlap between answers reveals true priorities: when the same theme appears in 3+ answers from one player, it's their top concern. When it appears across 3+ players, it's a pattern worth acting on.

`(see plan-audit/questionnaires.md → FFWWDD Deep Dive for full question list, ordering rationale, and analysis tips)`

## Sample Size Guidelines

| Method | Minimum | Ideal | Rationale |
|--------|---------|-------|-----------|
| **Usability testing** | 5 per round | 8-12 | 5 testers find ~80% of major usability issues |
| **RITE method** | 1-3 per iteration | 5-10 total | Iterate between participants |
| **Core loop validation** | 5 | 8-10 | Need pattern consistency across players |
| **Surveys/questionnaires** | 20-30 | 50-100+ | Statistical significance needs larger N |
| **Heatmaps/telemetry** | 30-50 | 100+ | Spatial patterns need volume |

**Counting rule:** 3 out of 5 testers independently encounter the same issue → pattern worth fixing. 1 out of 5 → note it, wait for more data.

**Diminishing returns:** Going from 5 to 10 testers adds ~15% more issue discovery. Going from 0 to 5 adds ~80%. Don't wait for "enough" testers — test with who you have.

## Data-Driven Decisions

Combine observation with structured data for stronger conclusions.

**Qualitative** (observation, interviews, FFWWDD) answers "what's happening and why."
**Quantitative** (telemetry, questionnaire scores) answers "how much and how often."

Best results combine both: telemetry shows WHERE players struggle, observation shows WHY.

For detailed frameworks and templates:
- `(see plan-audit/questionnaires.md for validated instruments: GEQ, PENS, GUESS-18, SUS, FFWWDD)`
- `(see plan-audit/telemetry.md for data collection tiers, analysis methods, and evidence chains)`
