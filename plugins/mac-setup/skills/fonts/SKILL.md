---
description: Installs JetBrains Mono and JetBrains Mono Nerd Font via Homebrew. JetBrains Mono is used in the Ghostty config; the Nerd Font variant adds icon glyphs for tools like eza, powerlevel10k, and Starship.
allowed-tools: Bash, Read
---

Install fonts via Homebrew cask:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-fonts.sh"
```

## Fonts Installed

| Font | Use |
|---|---|
| JetBrains Mono | Terminal (Ghostty config), VS Code Insiders |
| JetBrains Mono Nerd Font | Adds icon glyphs for eza, powerlevel10k, etc. |

## After Installation

Restart any open apps to load the new fonts:
- **Ghostty** — quit and reopen
- **VS Code Insiders** — `cmd+shift+p` → Reload Window, or quit and reopen

## Notes

- Already-installed fonts are safely skipped
- Fonts live in `~/Library/Fonts/` — no admin password required
