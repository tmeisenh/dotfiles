# Dotfiles

25+ year old Unix dotfiles repo. Home-rolled zsh since ~2000, no frameworks.

## Memory MCP
This repo (and dotfiles-private) have been ingested into the memory MCP knowledge graph. Query the memory graph first before reading files. Use it to answer questions about structure, load order, relationships, and "where stuff is" before falling back to filesystem exploration.

**Critical zsh gotcha:** Keybindings must go in keys.zsh, not antigen.zsh. `setopt vi` in options.zsh resets all bindings.

## User Preferences
- Colorblind - don't suggest syntax highlighting
- Home row keyboard ergonomics - avoid Ctrl combos, no arrow key suggestions
- Prefers lightweight, cross-platform, old-school Unix tools over modern replacements (e.g., find over fd, grep over ripgrep)
- No shell frameworks (oh-my-zsh, prezto, etc.)
- Keep FreeBSD scripts in attic as historical artifacts
- Don't add navigation aliases (.., ..., -)
- SSH config is local-only (not in repo) for security

## Brew
- `Brewfile.basic` - core packages needed everywhere
- `Brewfile.home` - additional packages for home machine
- install_homebrew.sh installs basic, prints message about home
