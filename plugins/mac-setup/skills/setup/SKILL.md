---
description: Runs the interactive Mac development environment setup wizard. Presents all setup categories with all options enabled by default. Use when setting up a new Mac or re-applying dev environment configuration.
argument-hint: "[category]"
allowed-tools: Bash, Read, Write
---

Present the following interactive setup menu to the user. All categories are enabled by default. The user can type numbers to skip specific ones or press Enter to run all.

## Setup Menu

Display this menu exactly:

```
Mac Dev Setup
─────────────────────────────────
[1] Brew        — install core CLI tools, Ghostty, VS Code Insiders, fonts
[2] Fonts       — JetBrains Mono + Nerd Font
[3] Editor      — VS Code Insiders as default for all file types (duti)
[4] Terminal    — Ghostty config symlinked (Monokai Remastered)
[5] Shell       — oh-my-zsh + powerlevel10k + plugins + zshrc
[6] Git Config  — user identity, aliases, VS Code Insiders as editor/diff tool
[7] Claude Code — settings.json defaults (model, effort, verbose)
[8] Theme       — macOS dark mode + Dock layout

All selected. Enter numbers to skip (e.g. "3 5") or press Enter to run all:
```

Wait for user input. Parse their response:
- Empty input → run all categories
- Numbers → skip those category numbers, run the rest
- "none" or "cancel" → exit without running anything

## Running Categories

For each selected category, announce it then run the corresponding script:

- **Brew**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-brew.sh"`
- **Fonts**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-fonts.sh"`
- **Editor**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-editor.sh"`
- **Terminal**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-terminal.sh"`
- **Shell**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-shell.sh"`
- **Git Config**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-git-config.sh"`
- **Claude Code**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-claude-code.sh"`
- **Theme**: `bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-theme.sh"`

After each script runs, report success or show the error output if it failed. Continue to the next category regardless.

## Recommended Order

Run Brew first (it installs prerequisites like `duti` and fonts). If the user skips Brew, warn that Editor requires `duti` and Fonts requires Homebrew.

## Completion

After all selected categories have run, print a summary:

```
Setup complete!
─────────────────────────────────
✓ Brew         — core tools installed
✓ Fonts        — JetBrains Mono installed
✓ Editor       — VS Code Insiders set as default
✓ Terminal     — Ghostty config symlinked
✓ Shell        — Restart terminal to apply shell changes
✓ Git Config   — user identity and aliases set
✓ Claude Code  — settings.json updated
✓ Theme        — Dark mode enabled, Dock configured
─────────────────────────────────
Restart your terminal for shell changes to take effect.
Run /mac-setup:check anytime to detect configuration drift.
```

Mark any failed categories with ✗ and the error reason.
