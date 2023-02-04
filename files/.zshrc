# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Source /etc/profile
[[ -f /etc/profile ]] && source /etc/profile

# Some environment variables and settings
export USER=$(id -un)
export HOSTNAME=$(hostname)
export LC_ALL=en_US.utf-8
export LANG=$LC_ALL
export EDITOR='vi' # For shell things I prefer vi/vim.
export PAGER='less'
export ZSHCACHEDIR=$HOME/.zsh-cache
export ZSHCONF=$HOME/.zsh-tmeisenh-dotfiles
bindkey -v #vi key bindings

# Set term if not set
#if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
#    $TERM="vt100"
#    if [ "`uname`" = "Linux" ]; then
#        $TERM="linux"
#    fi
#fi

# Set Logs and History
watch=(notme root)

# Create $user history files
export HISTSIZE=1000000
export SAVEHIST=1000000
export DIRSTACKSIZE=16
export HISTFILE=$HOME/.zsh_history

# Load some cool zsh features
typeset -U path cdpath manpath fpath
autoload -U zed
autoload zmv
autoload zcalc
autoload zargs
autoload colors && colors
autoload history-search-end
autoload zkbd
zmodload -i zsh/complist
autoload -U predict-on &&
  zle -N predict-on &&
  zle -N predict-off

# set common paths
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# set common man paths
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

[[ -d $HOME/bin ]] && path=($HOME/bin $path)
[[ -d $HOME/bin-$(uname | tr "[:upper:]" "[:lower:]") ]] && path=($HOME/bin-$(uname | tr "[:upper:]" "[:lower:]") $path)

# Load custom LS_COLORS
[[ -e $ZSHCONF/ls_colors.sh ]] && source $ZSHCONF/ls_colors.sh
export ZLS_COLORS=$LS_COLORS

# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit coredumpsize 0
limit -s

# Load shell options
source $ZSHCONF/options.zsh

# Load command completions
source $ZSHCONF/completions.zsh

# Configure keys working (never works by default)
source $ZSHCONF/keys.zsh

# Configure prompt
source $ZSHCONF/prompt.zsh

# Load system wide aliases
source $ZSHCONF/aliases.zsh

# Load common shellfunctions
source $ZSHCONF/shellfunctions.zsh

## Now, allow for system, host, etc customizations

# Load distro specific settings (darwin, freebsd, linux, etc)
distro_zsh="${ZSHCONF}/$(uname | tr "[:upper:]" "[:lower:]").zsh"
if [[ -s ${distro_zsh} ]]; then
  source ${distro_zsh}
fi

# Load system specific settings (box1, box2, etc)
host_zsh="${ZSHCONF}/"host"-$(hostname | tr "[:upper:]" "[:lower:]").zsh"
if [[ -s ${host_zsh} ]]; then
  source ${host_zsh}
fi

# Load private (not stored in git) settings
[[ -e $ZSHCONF/private.zsh ]] && source $ZSHCONF/private.zsh

# Load anything specific to a work project
for f in $ZSHCONF/projects/*; do source $f; done

# Umask settings
# -rw-r--r--
umask 022

# -rw-rw-r--
# umask 2

# -rw-------
#umask 007

# If root set unmask to 077 to allow new files to remain private
if [ "$(id -u)" = "0" ]; then
  umask 077
fi

# End

source /Users/travis/.docker/init-zsh.sh || true # Added by Docker Desktop
