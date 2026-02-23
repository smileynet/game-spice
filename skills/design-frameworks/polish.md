# Game Feel, Juice & Onboarding

## MLP Juice Checklist

Minimum feedback to make core actions feel good:

- [ ] **Screen shake** on impactful actions (hit, explosion, landing)
- [ ] **Hit pause** (1-3 frames freeze on contact)
- [ ] **Sound effect** for every player action
- [ ] **Visual feedback** for state changes (damage flash, pickup glow)
- [ ] **Particle effects** on key moments (death, collection, ability use)

## The Juice-Is-Not-A-Substitute Rule

Juice makes a fun game feel amazing. Juice does NOT make an unfun game fun.

**Test:** Is your game fun with all juice/polish removed? If no, fix the mechanics first.

**Priority order:**
1. Fun mechanics (no juice needed to validate)
2. Functional feedback (player understands what happened)
3. Juice (makes good mechanics feel great)

## Onboarding Patterns

| Pattern | Description | Best For |
|---------|-------------|----------|
| **Learn-by-doing** | Drop player in, introduce mechanics naturally | Action games, platformers |
| **Gated complexity** | Lock advanced mechanics until basics mastered | RPGs, strategy games |
| **Guided tutorial** | Explicit instructions with practice | Complex systems, sims |

### Onboarding Design Guidelines

**Learn-by-doing (preferred for MLP):**
- First room/level teaches ONE mechanic
- Safe environment to experiment
- Fail state is gentle (quick restart, not game over)
- No text walls — show, don't tell

**Common mistakes:**
- Teaching every mechanic in the tutorial before fun starts
- Unskippable tutorials for returning players
- Text-heavy explanations of things players could discover
- Tutorial that's not representative of actual gameplay
