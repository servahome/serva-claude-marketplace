---
description: Configures macOS appearance settings — enables dark mode, sets Dock to auto-hide on the left side, and applies accent color. Use when setting up macOS appearance preferences on a new Mac.
allowed-tools: Bash
---

Run the theme setup script:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-theme.sh"
```

The script applies:
- Dark mode via `defaults write NSGlobalDomain AppleInterfaceStyle Dark`
- Dock position: left
- Dock auto-hide: enabled
- Dock tile size: 48px
- Show recent apps in Dock: disabled

After the script runs, tell the user to log out and back in (or restart) for all Dock changes to fully apply. Dark mode takes effect immediately.
