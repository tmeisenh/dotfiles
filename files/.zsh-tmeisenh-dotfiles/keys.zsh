#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Get the keys working right
# This should work on all *nix systems.
# If not, you can hit control-v and then the key you want to see its binding.
bindkey "^[[2~" yank                 ## insert
bindkey "^[[3~" delete-char          ## delete
bindkey "^[[5~" up-line-or-history   ## PageUp
bindkey "^[[6~" down-line-or-history ## PageDown
bindkey "^[1~" beginning-of-line     ## home
bindkey "^[4~" end-of-line           ## end
bindkey "^[e" expand-cmd-path      ## Alt+e to expand command path
# bindkey "^[[A" up-line-or-search   ## up arrow for back-history-search
# bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey " " magic-space            ## do history expansion on space

# stty erase "$(tput kbs)" # Uses terminal's defined backspace character from terminfo database
stty erase '^?'      # Sets backspace to the standard DEL character (ASCII 127)

# Binding of the keys for command line editing
# Just hit control plus key!
bindkey '^L' clear-screen
bindkey '^R' history-incremental-search-backward

# Use built-in file completion
bindkey '^X\t' expand-or-complete-prefix

# Shift+Tab to go backward in completion menu
bindkey '^[[Z' reverse-menu-complete

# antigen plugins
bindkey '^[[A' history-substring-search-up      # Up arrow
bindkey '^[[B' history-substring-search-down    # Down arrow
# Double semicolon to accept autosuggestion (home row friendly)
bindkey -s ';;' '^[[F'