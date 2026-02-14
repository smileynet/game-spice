# Playtesting Methodology

## Minimum Viable Playtest (MVPt)

The smallest build that can answer "is this fun?"

**Requirements:**
- Core loop completes one full cycle (action → reward → reinvestment)
- Player can fail and try again
- Programmer art is fine — polish is irrelevant
- No menus, saves, or settings needed
- Runs for at least 5 minutes without crashing

**Timeline test:** If you can't produce an MVPt within one week of starting development, your scope is too large `(see game-scoping → MLP Scoping Process)`.

**What an MVPt is NOT:**
- Not a demo (it's an experiment)
- Not polished (ugly is fine)
- Not feature-complete (one path only)
- Not for showing off (it's for learning)

## Observation vs Asking

**What players DO is more reliable than what they SAY.**

| Observe | Don't Ask |
|---------|-----------|
| Where they get stuck | "Was it confusing?" |
| What they skip or ignore | "Did you notice the tutorial?" |
| When they lean forward (engaged) | "Was it fun?" |
| When they check their phone (bored) | "Were you bored?" |
| What they try to do that isn't possible | "What features do you want?" |

**Observation checklist during playtest:**
- [ ] Where did they hesitate or pause? (confusion signal)
- [ ] What did they try that didn't work? (expectation mismatch)
- [ ] When did they smile or react? (delight signal)
- [ ] When did they disengage? (boredom/frustration signal)
- [ ] Did they complete the core loop without prompting?

**After the playtest, ask open-ended questions:**
- "What were you trying to do when [observed moment]?"
- "Walk me through what you were thinking during [specific section]"
- "What would you do next if you kept playing?"

**Never ask:** "Was it fun?" "Did you like it?" "What should I change?" — these produce polite lies, not useful data.

## Iteration Cadence

**Build → Test → Learn cycle:**

```
┌──────────┐     ┌──────────┐     ┌──────────┐
│  BUILD   │────→│   TEST   │────→│  LEARN   │
│ (1-3 days)│    │ (1 session)│   │ (same day)│
└──────────┘     └──────────┘     └────┬─────┘
     ↑                                  │
     └──────────────────────────────────┘
```

**Cadence targets:**
- **MLP phase:** Test every 3-5 days minimum
- **Fun polish phase:** Test after every significant change
- **Content phase:** Test each content batch before making more

**Red flags for cadence:**
- More than 2 weeks since last playtest → testing too rarely
- Testing every day → not enough change between tests to learn
- Only testing when "it's ready" → it's never ready, test anyway

## Pivot vs Persevere Decision

After playtest results, decide what to do:

| Signal | Diagnosis | Action |
|--------|-----------|--------|
| Core mechanic isn't fun after 3+ tests | Core loop failure | **Pivot** — change the core mechanic |
| Fun in short bursts, boring over time | Pacing/variety problem | **Iterate** — add variation, adjust pacing |
| Fun when explained, confusing without help | Onboarding problem | **Iterate** — improve teaching, UI, feedback |
| Different testers have wildly different experiences | Inconsistency problem | **Iterate** — identify and fix variance sources |
| Tester engaged but frustrated by specific part | Difficulty/balance problem | **Iterate** — adjust that specific area |
| "I don't get why I'm doing this" | Motivation problem | **Iterate** — clarify goals, add feedback |

**Pivot criteria (define BEFORE testing):**
- "If 3 out of 5 testers don't complete the core loop, we change [specific thing]"
- "If average play session is under 3 minutes, we rethink [specific mechanic]"
- "If no tester voluntarily starts a second round, the loop isn't hooking"

**When in doubt:** More testing, not more building. One more playtest costs an hour. One more feature costs a week.
