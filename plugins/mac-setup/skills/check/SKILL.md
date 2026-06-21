---
description: Checks whether the Mac development environment is in sync with the plugin's desired state. Reports what's drifted without making any changes. Use this after a git pull or periodically to detect configuration drift.
allowed-tools: Bash, Read
---

Run the drift detection script and report the results:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/check-drift.sh"
```

Show the full output to the user.

## Interpreting Results

- **✓** — category matches desired state, nothing needed
- **✗** — drifted: current system state differs from the plugin's config
- **-** — skipped: prerequisite not installed (run the relevant setup skill first)

## If Drift Is Found

Tell the user which categories are drifted and suggest the targeted skill to fix each one:

| Drifted category | Fix with |
|---|---|
| Editor | `/mac-setup:editor` |
| Terminal | `/mac-setup:terminal` |
| Shell | `/mac-setup:shell` |
| Claude Code | `/mac-setup:claude-code` |
| Theme | `/mac-setup:theme` |
| Git Config | `/mac-setup:git-config` |
| Brew | `/mac-setup:brew` |

Or run `/mac-setup` to fix all drifted categories interactively.
