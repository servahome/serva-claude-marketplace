# mac-setup

Interactive Mac development environment setup for Claude Code.

## What it sets up

| Category | Details |
|---|---|
| **Brew** | Core CLI tools, Ghostty, VS Code Insiders, JetBrains Mono via Homebrew |
| **Fonts** | JetBrains Mono + Nerd Font variant |
| **Editor** | VS Code Insiders as default for 35+ file types via `duti` |
| **Terminal** | Ghostty config symlinked (Monokai Remastered theme) |
| **Shell** | oh-my-zsh + powerlevel10k + plugins + zshrc |
| **Git Config** | user identity, aliases, VS Code Insiders as editor/diff/merge tool |
| **Claude Code** | settings.json defaults (model: sonnet, effortLevel: high, verbose: true) |
| **Theme** | macOS dark mode + Dock on left, auto-hide |

## Usage

```
/mac-setup
```

Presents an interactive checklist — all categories enabled by default. Enter numbers to skip specific ones.

### Individual skills

```
/mac-setup:brew        — install Homebrew packages
/mac-setup:fonts       — install JetBrains Mono fonts
/mac-setup:editor      — set VS Code Insiders as default editor (duti)
/mac-setup:terminal    — apply Ghostty config (symlinked for live updates)
/mac-setup:shell       — oh-my-zsh + powerlevel10k + zshrc
/mac-setup:git-config  — git identity, aliases, editor/diff/merge tool
/mac-setup:claude-code — Claude Code settings.json defaults
/mac-setup:theme       — dark mode + Dock layout
/mac-setup:check       — drift detection: report what's out of sync
```

### Drift detection

After a `git pull` on this repo, run:

```
/mac-setup:check
```

This compares the current system state against the plugin's desired state and reports what's drifted — without making any changes.

Because Ghostty config is symlinked to this repo, `git pull` updates it immediately with no re-run needed.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh) (for `/mac-setup:brew`, `/mac-setup:fonts`)
- `duti` — `brew install duti` (for `/mac-setup:editor`)
- [VS Code Insiders](https://code.visualstudio.com/insiders/)
- [Ghostty](https://ghostty.org) (for `/mac-setup:terminal`)

Running `/mac-setup:brew` installs most prerequisites automatically.

## Installation

Clone this repo and add the plugin path to your Claude Code `settings.json`:

```bash
git clone https://github.com/servahome/serva-claude-marketplace.git ~/serva-claude-marketplace
```

Then in `~/.claude/settings.json`, add:

```json
{
  "enabledPlugins": {
    "mac-setup@local": "~/serva-claude-marketplace/plugins/mac-setup"
  }
}
```

Or install via the Claude Code plugin marketplace (when available).
