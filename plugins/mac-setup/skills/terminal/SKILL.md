---
description: Symlinks the Ghostty terminal config into the Ghostty app support directory (Monokai Remastered theme, JetBrains Mono). Symlink means git pull on the plugin repo updates Ghostty config automatically with no re-run needed.
allowed-tools: Bash, Write
---

Run the Ghostty setup script:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-terminal.sh"
```

The script creates a symlink from `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` to the plugin's `configs/ghostty.conf`. If the file already exists it is backed up to `config.ghostty.bak` first.

After the symlink is created, future `git pull` updates to the plugin repo automatically update Ghostty config — no re-run of this skill needed.

If Ghostty is not installed, inform the user it can be downloaded from https://ghostty.org and that the config will be applied once it is installed.

After the script runs, tell the user to restart Ghostty for the config to take effect.
