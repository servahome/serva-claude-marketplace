---
description: Configures Claude Code settings on macOS — applies sensible defaults for model selection, editor integration with VS Code Insiders, and shell integration. Use when setting up Claude Code on a new Mac.
allowed-tools: Bash, Write
---

Run the Claude Code setup script:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-claude-code.sh"
```

The script writes sane defaults to `~/.claude/settings.json`:
- `model`: "sonnet"
- `effortLevel`: "high"
- `verbose`: true

If `~/.claude/settings.json` already exists, it merges rather than overwrites — existing keys are preserved and only missing keys are added.

After the script runs, confirm which settings were applied. Remind the user that model and editor can be changed at any time with `/config`.
