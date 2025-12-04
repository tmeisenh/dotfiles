#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# ----------------------
# COMPLETION SYSTEM SETUP
# ----------------------

# Remove existing comp cache
#rm -rf $HOME/.zcompdump

# Add zsh-completions to fpath
fpath=(
  /usr/local/share/zsh-completions
  $fpath
)

# load compinit!
autoload -U compinit && compinit

# Use built-in completion system
# No need for custom completion widgets

# ----------------------
# COMPLETION STYLE SETTINGS
# ----------------------

# Pretty menu!
zstyle ':completion:*' menu select=1

# Case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Completion options
zstyle ':completion:*' completer _complete _prefix _expand _approximate _correct
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:::::' completer _complete _correct
zstyle ':completion:*:processes' command 'ps -au $USER'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'

# Set list colors for completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# Correction
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' max-errors 2 numeric
zstyle ':completion:*:correct:*' original true

# ----------------------
# COMPLETION FORMAT AND DISPLAY SETTINGS
# ----------------------

# Format settings for completion messages
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:descriptions' format "%d"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%d--No matches for: %d'

# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# Completion caching
zstyle ':completion:*' use-cache 1 cache-path $ZSHCACHEDIR

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Include non-hidden directories in globbed file completions
# for certain commands
zstyle ':completion::complete:*' tag-order 'globbed-files directories'

# Use menuselection for pid completion
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# Tag-order 'globbed-files directories' all-files
zstyle ':completion::complete:*:tar:directories' file-patterns '*~.*(-/)'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'

# With commands like rm, it's annoying if you keep getting offered the same
# file multiple times. This fixes it. Also good for cp, et cetera..
zstyle ':completion:*:(rm|cp):*' ignore-line yes


# ----------------------
# COMMAND-SPECIFIC COMPLETIONS
# ----------------------

# Modern command completions
compdef _aliases {,un}alias       # Complete with aliases
compdef _dirs {c,push,pop}d       # Complete with directories
compdef _command exec             # Complete with commands
compdef _command {where,which}    # Complete with commands
compdef _setopt {,un}setopt       # Complete with shell options
compdef _parameters -g "*export*" {,un}setenv  # Complete with environment variables
compdef _parameters -g "*export*" printenv     # Complete with environment variables
compdef _bindkey bindkey          # Complete with keybindings
compdef _jobs fg                  # Complete with jobs
compdef _kill kill                # Complete with processes
compdef _users chown              # Complete with users
compdef _command sudo             # Complete with commands

# Use the built-in man page completion
compdef _man man

compdef _gnu_generic feh df

# Filter filename completions based on context
compdef '_files -g "*.{Z,gz,tgz}"' zcat gunzip
compdef '_files -g "*.{tar.Z,tar.gz,tgz,tar.bz2}"' tar smartextract se
compdef '_files -g "*.{zip,ZIP}"' unzip smartextract se
compdef _directories cd
