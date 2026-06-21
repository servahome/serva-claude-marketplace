# Serva Claude Marketplace

Claude Code plugins for the Serva homelab ecosystem.

## Plugins

| Plugin | Description |
|---|---|
| [mac-setup](plugins/mac-setup/) | Interactive Mac development environment setup — editor, terminal, shell, git, Claude Code, macOS theme |

## Installing a Plugin

Clone this repo:

```bash
git clone https://github.com/servahome/serva-claude-marketplace.git ~/serva-claude-marketplace
```

Then add the plugin to `~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "mac-setup@local": "~/serva-claude-marketplace/plugins/mac-setup"
  }
}
```

After adding, reload Claude Code and invoke with `/mac-setup`.

## Keeping Up to Date

```bash
cd ~/serva-claude-marketplace
git pull
```

Ghostty config is symlinked — it updates immediately on pull. Re-run individual skills for other changes (e.g. `/mac-setup:shell` to re-apply zshrc).
