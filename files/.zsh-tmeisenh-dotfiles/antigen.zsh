#!/bin/zsh
# Z shell antigen configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Antigen configuration for zsh-users plugins
#********************************************************************

# Source antigen
source "$HOME/git/antigen/antigen.zsh"

# Load bundles from external repos
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Tell Antigen that you're done
antigen apply

# Key bindings for history-substring-search
# Note: conflcts with keys.zsh
bindkey '^[[A' history-substring-search-up      # Up arrow
bindkey '^[[B' history-substring-search-down    # Down arrow
