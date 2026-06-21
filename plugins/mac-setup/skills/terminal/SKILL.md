---
description: Applies the Ghostty terminal configuration on macOS. Copies the bundled config (Monokai Remastered theme) to the Ghostty app support directory. Use when setting up Ghostty on a new Mac.
allowed-tools: Bash, Write
---

Run the Ghostty setup script:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-terminal.sh"
```

The script copies the bundled config to `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`.

If Ghostty is not installed, inform the user it can be downloaded from https://ghostty.org and that the config will be applied once it is installed.

After the script runs, tell the user to restart Ghostty for the config to take effect.
