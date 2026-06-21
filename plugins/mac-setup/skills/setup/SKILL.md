---
description: Runs the interactive Mac development environment setup wizard. Presents all setup categories (editor, terminal, shell, Claude Code, macOS theme) with all options enabled by default. Use when setting up a new Mac or re-applying dev environment configuration.
argument-hint: "[category]"
allowed-tools: Bash, Read, Write
---

Present the following interactive setup menu to the user. All categories are enabled by default. The user can type numbers to skip specific ones or press Enter to run all.

## Setup Menu

Display this menu exactly:

```
Mac Dev Setup
─────────────────────────────────
[1] Editor     — VS Code Insiders as default for all file types
[2] Terminal   — Ghostty config (Monokai Remastered theme)
[3] Shell      — oh-my-zsh + powerlevel10k + plugins + zshrc
[4] Claude Code — settings.json defaults + editor integration
[5] Theme      — macOS dark mode + Dock layout

All selected. Enter numbers to skip (e.g. "3 5") or press Enter to run all:
```

Wait for user input. Parse their response:
- Empty input → run all categories
- Numbers → skip those category numbers, run the rest
- "none" or "cancel" → exit without running anything

## Running Categories

For each selected category, announce it ("Setting up Editor...") then run the corresponding script:

- **Editor**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-editor.sh"`
- **Terminal**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-terminal.sh"`
- **Shell**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-shell.sh"`
- **Claude Code**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-claude-code.sh"`
- **Theme**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-theme.sh"`

After each script runs, report success or show the error output if it failed. Continue to the next category regardless.

## Completion

After all selected categories have run, print a summary:

```
Setup complete!
─────────────────────────────────
✓ Editor       — VS Code Insiders set as default
✓ Terminal     — Ghostty config applied
✓ Shell        — Restart terminal to apply shell changes
✓ Claude Code  — settings.json updated
✓ Theme        — Dark mode enabled, Dock configured
─────────────────────────────────
Restart your terminal for shell changes to take effect.
```

Mark any failed categories with ✗ and the error reason.
