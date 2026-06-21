---
description: Sets VS Code Insiders as the system-wide default editor for all common file types on macOS using duti. Use when setting up a new Mac or when default editor associations have been reset.
allowed-tools: Bash
---

Run the editor setup script to register VS Code Insiders as the default application for all common developer file types.

First check that prerequisites are met:

```bash
which duti || echo "MISSING"
which code-insiders || echo "MISSING"
```

If `duti` is missing, install it first:
```bash
brew install duti
```

If `code-insiders` is missing, inform the user that VS Code Insiders must be installed from https://code.visualstudio.com/insiders/ before proceeding.

Once prerequisites are met, run:
```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-editor.sh"
```

Report the result. If successful, tell the user that file associations are now active — no restart required.
