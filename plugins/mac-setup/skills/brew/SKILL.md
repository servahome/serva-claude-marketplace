---
description: Installs all development tools and apps defined in the plugin's Brewfile using Homebrew bundle. Covers CLI tools (ripgrep, bat, eza, fzf), shell extras (powerlevel10k, autosuggestions), Ghostty, VS Code Insiders, and JetBrains Mono fonts.
allowed-tools: Bash, Read
---

Check that Homebrew is installed, then run the bundle:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-brew.sh"
```

## What Gets Installed

| Category | Packages |
|---|---|
| Core CLI | git, gh, jq, fzf, ripgrep, fd, bat, eza, zoxide, thefuck, duti |
| Shell | zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k |
| Dev | node, python, go |
| Apps | Ghostty, VS Code Insiders |
| Fonts | JetBrains Mono, JetBrains Mono Nerd Font |

## If Homebrew Is Not Installed

Tell the user to install Homebrew first:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then re-run `/mac-setup:brew`.

## Notes

- `brew bundle` is idempotent — already-installed packages are skipped
- Cask apps that are already installed (e.g., Ghostty) are also safely skipped
- After installing fonts, restart any open apps to pick them up
