#!/bin/zsh
# Z shell plugin configuration
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#********************************************************************

source_if_exists "$ANTIDOTE_ZSH"
antidote load

bindkey '^[[A' history-substring-search-up      # Up arrow
bindkey '^[[B' history-substring-search-down    # Down arrow
bindkey ';;' autosuggest-accept                 # Double semicolon to accept autosuggestion
