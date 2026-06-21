---
description: Sets up the zsh shell environment on macOS — installs oh-my-zsh, powerlevel10k, and required plugins (zsh-autosuggestions, zsh-syntax-highlighting), then applies the zshrc template. Use when configuring the shell on a new Mac.
allowed-tools: Bash, Write
---

Run the shell setup script:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-shell.sh"
```

The script:
1. Installs oh-my-zsh if not already present
2. Installs powerlevel10k theme via Homebrew
3. Installs zsh-autosuggestions and zsh-syntax-highlighting plugins
4. Backs up any existing `~/.zshrc` to `~/.zshrc.bak`
5. Applies the bundled zshrc template

Warn the user that their existing `~/.zshrc` will be backed up (not deleted). After the script runs, tell them to restart their terminal or run `source ~/.zshrc` to apply changes.

If the user already has oh-my-zsh installed, the script skips that step automatically.
