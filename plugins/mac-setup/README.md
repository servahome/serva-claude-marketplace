# mac-setup

Interactive Mac development environment setup for Claude Code.

## What it sets up

| Category | Details |
|---|---|
| **Editor** | VS Code Insiders as default for 35+ file types via `duti` |
| **Terminal** | Ghostty config (Monokai Remastered theme) |
| **Shell** | oh-my-zsh + powerlevel10k + plugins + zshrc |
| **Claude Code** | settings.json defaults (model, editor integration) |
| **Theme** | macOS dark mode + Dock on left, auto-hide |

## Usage

```
/mac-setup
```

Presents an interactive checklist — all categories enabled by default. Enter numbers to skip specific ones.

Individual categories can also be run directly:

```
/mac-setup:editor
/mac-setup:terminal
/mac-setup:shell
/mac-setup:claude-code
/mac-setup:theme
```

## Prerequisites

- macOS
- [Homebrew](https://brew.sh)
- [VS Code Insiders](https://code.visualstudio.com/insiders/)
- [Ghostty](https://ghostty.org) (for terminal setup)

## Installation

```bash
cc --plugin-dir /path/to/plugins/mac-setup
```
