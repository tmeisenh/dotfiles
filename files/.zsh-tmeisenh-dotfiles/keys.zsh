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
bindkey "^[e" expand-cmd-path
# bindkey "^[[A" up-line-or-search   ## up arrow for back-history-search
# bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey " " magic-space            ## do history expansion on space

stty erase "$(tput kbs)" ## I forget why I have this...
stty erase '^?'

# Binding of the keys for command line editing
# Just hit control plus key!
bindkey '^L' clear-screen
bindkey '^R' history-incremental-search-backward
