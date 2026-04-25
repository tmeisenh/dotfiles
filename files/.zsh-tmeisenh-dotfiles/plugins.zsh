#!/bin/zsh
# Z shell plugin configuration
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#********************************************************************

[[ -z "$ANTIDOTE_HOME" ]] && echo "plugins.zsh: ANTIDOTE_HOME not set by distro file" >&2 && return 1

source_if_exists "$ANTIDOTE_HOME/antidote.zsh"
antidote load

bindkey '^[[A' history-substring-search-up      # Up arrow
bindkey '^[[B' history-substring-search-down    # Down arrow
bindkey -s ';;' '^[[F'                          # Double semicolon to accept autosuggestion
