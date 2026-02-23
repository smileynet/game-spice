# Data Collection, Analytics & Analysis Methods

Practical telemetry, analytics, and analysis approaches for indie game development.

## Essential Telemetry Events

### By Category

**Session:**
- Session duration (start/end timestamps)
- Session frequency (time between sessions)
- Sessions-to-churn (how many sessions before a player stops)
- Time between sessions (engagement decay signal)

**Progression:**
- Completion rate per section/level
- Time-to-complete per section
- Drop-off points (where players quit mid-session)
- Funnel conversion between stages

**Difficulty:**
- Death/failure locations (→ heatmaps)
- Retry counts per section
- Health/resource state at checkpoints
- Time spent on each attempt

**Economy:**
- Earning rate over time
- Spending patterns (what, when, how much)
- Stockpiling behavior (resources held without spending)
- Sink-to-source ratio (is economy inflating?)

**Feature Usage:**
- Discovery rate (what % of players find each feature)
- Usage frequency (how often each feature is used)
- Adoption timing (when in a session do players start using it)
- Ability/weapon/item distribution (what players choose)

**Player Paths:**
- Navigation heatmaps (where players go)
- Action sequences (what players do in order)
- Menu navigation paths (where they get lost in UI)

## Analytics Tiers for Indies

| Tier | Method | Cost | Setup Time | Best For |
|------|--------|------|-----------|----------|
| **0** | Manual observation + notes | Free | None | First playtests, qualitative insights |
| **1** | Local CSV logging | Free | 1-2 hours | Solo dev, small builds, privacy-friendly |
| **2** | Free SDK (GameAnalytics, Unity Analytics) | Free | Half day | Published games, retention tracking |
| **3** | Custom backend | Server costs | Days-weeks | Specific analysis needs, full control |

### Tier 0: Manual Observation

No code needed. Watch players, take timestamped notes.

Format: `[MM:SS] [Event] [Detail]`
Example: `[02:15] DEATH first enemy, didn't notice health bar`

### Tier 1: Local CSV Logging

Log events to file. Analyze in spreadsheet or script.

Minimum fields: `timestamp, event_type, event_data, session_id`

Good enough for: death locations, completion times, feature usage, economy tracking.

### Tier 2: Free Analytics SDKs

GameAnalytics, Unity Analytics, or similar. Provides dashboards, retention curves, funnels.

Good enough for: D1/D7/D30 retention, session length trends, A/B comparison between builds.

### Tier 3: Custom Backend

Full control over data, custom queries, complex analysis.

Only needed when: free tools can't answer your specific question, or data privacy requires it.

**Recommendation:** Start at Tier 0. Move to Tier 1 when you have 5+ playtesters. Move to Tier 2 when the game is publicly available. Tier 3 is rarely needed for indie games.

## Analysis Methods

### Quantitative

**Funnel Analysis:**
1. Map progression stages (tutorial → level 1 → level 2 → ...)
2. Calculate conversion rate between each step
3. Identify largest drops (>20% loss between steps = problem)
4. Focus fixes on the biggest drop first

**Retention Curves:**
- D1 (day 1): Did they come back the next day? Steep early drop = onboarding problem
- D7 (day 7): Still playing after a week? Drop here = content exhaustion
- D30 (day 30): Long-term? Drop here = lack of depth/progression

**Difficulty Spike Detection:**
1. Plot failure rate by section/level
2. Calculate standard deviation
3. Outliers (>2σ above mean) = difficulty spikes
4. Compare spike locations to intended difficulty curve

**Before/After Comparison:**
1. Define the metric you expect to change
2. Measure with current build (baseline)
3. Make the change
4. Measure with fresh testers (not the same people)
5. Compare — did the metric move in the expected direction?
6. Check for regression in other metrics

### Qualitative

**Affinity Mapping:**
1. Write each observation on a sticky note (physical or digital)
2. Group similar notes into clusters
3. Name each cluster (the theme)
4. Prioritize clusters by frequency and severity

**Thematic Coding:**
1. Read through all open-ended responses
2. Apply labels to recurring ideas (e.g., "confused by controls", "wanted more enemies")
3. Group labels into themes
4. Count frequency — themes mentioned by 3+ testers are patterns

**Sentiment Tracking Across Builds:**
Track the same questions across builds. Plot trends. Are scores going up, down, or flat?

## Prioritization Matrix

Fix order based on severity:

| Priority | Category | Example |
|----------|----------|---------|
| **P0** | Breaks core loop | Players can't complete the main action |
| **P1** | Causes quitting | Frustration point where players stop playing |
| **P2** | Causes confusion | Players don't understand what to do |
| **P3** | Reduces enjoyment | Fun but could be more fun |
| **P4** | Missed delight | Opportunity to surprise/delight |

**Counting rule:** 3+ of 5 testers encounter the same issue independently → pattern worth fixing. 1 of 5 → note it, wait for more data.

## Evidence Chain

Every design change should follow an evidence chain:

```
Observation → Diagnosis → Hypothesis → Design Change → Verification
```

**Template:** "Telemetry showed [data]. Observation revealed [cause]. Hypothesis: [change] will [outcome]. After change: [measured result]."

**Example:** "Telemetry showed 60% death rate at the bridge section (vs 15% average). Observation revealed players didn't see the hazard indicator. Hypothesis: making the indicator pulse red will reduce deaths to <30%. After change: death rate dropped to 22%."

**Without the chain:** You're guessing. Changes may fix the symptom but miss the cause, or fix nothing at all.
