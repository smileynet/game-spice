# Architecture: Commands & Agents

## Plugin Structure

```
game-spice/
├── .claude-plugin/
│   └── plugin.json          # name: "game" (for /game:* prefix)
├── skills/                   # 12 skills (11 existing + implementation)
│   └── implementation/  # NEW: cook-phase guidance
├── commands/                 # NEW: user-invocable commands
│   ├── walkthrough.md        # /game:walkthrough
│   └── balance-check.md      # /game:balance-check
└── agents/                   # NEW: specialized review agents
    └── game-reviewer.md      # Game-aware code reviewer
```

## Integration Points

| Line Cook Phase | Game-Spice Component | Type |
|----------------|---------------------|------|
| `/line:brainstorm` | 4 planning skills | Skill (passive) |
| `/line:scope` | 6 scoping skills | Skill (passive) |
| `/line:cook` | implementation | Skill (passive) |
| `/line:serve` | game-reviewer | Agent (active) |
| On-demand | /game:walkthrough | Command |
| On-demand | /game:balance-check | Command |

## Command Format

Commands use standard Line Cook command frontmatter:
```yaml
---
description: What the command does
argument-hint: [args]
allowed-tools: [Read, Glob, Grep, Write, AskUserQuestion]
---
```

## Agent Format

Agents follow sous-chef pattern:
```yaml
---
name: game-reviewer
description: When to invoke with examples
tools: [Glob, Grep, Read]
---
```

## Knowledge Reuse

Commands and agents reference existing skill content — they don't duplicate it.
- walkthrough → scenario-walkthrough/template.md
- game-reviewer → architecture-audit/ (scorecard + engine sub-files)
- balance-check → economy-design/balance.md + plan-audit/detailed-audits.md
- implementation → distilled from architecture-audit
