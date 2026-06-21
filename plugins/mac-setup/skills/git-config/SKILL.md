---
description: Applies the plugin's git global config — user identity, VS Code Insiders as editor and merge/diff tool, sane pull/push defaults, and common aliases (st, co, br, lg, undo). Preserves existing name and email if already set.
allowed-tools: Bash, Read
---

Ask the user for their git name and email if not already set, then apply the config:

```bash
bash "$CLAUDE_PLUGIN_ROOT/scripts/setup-git-config.sh"
```

## What Gets Configured

| Setting | Value |
|---|---|
| `user.name` | Prompted (or kept if already set) |
| `user.email` | Prompted (or kept if already set) |
| `core.editor` | `code-insiders --wait` |
| `core.pager` | `bat --style=plain` |
| `init.defaultBranch` | `main` |
| `pull.rebase` | `false` |
| `push.autoSetupRemote` | `true` |
| `fetch.prune` | `true` |
| `merge.tool` | VS Code Insiders |
| `diff.tool` | VS Code Insiders |

**Aliases:** `st` (status), `co` (checkout), `br` (branch), `lg` (oneline graph), `undo` (reset HEAD~1), `unstage`, `last`

## Notes

- Existing `.gitconfig` is backed up to `.gitconfig.bak` before overwriting
- Name and email are preserved if already set globally — no re-prompting
- If `bat` is not installed, the pager falls back to git's default
