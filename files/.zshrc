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
export HOSTNAME=$(/bin/hostname)
export LC_ALL=en_US.utf-8
export LANG=$LC_ALL
export EDITOR='vi'
export PAGER='less'
export ZLS_COLORS=$LS_COLORS
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
HISTSIZE=10000
SAVEHIST=65536
DIRSTACKSIZE=16
HISTFILE=$HOME/.zsh_history

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

# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit coredumpsize 0
limit -s

# Load various envrionment settings
source $ZSHCONF/environment.zsh

# Load shell options
source $ZSHCONF/options.zsh

# Load command completions
source $ZSHCONF/completions.zsh

# Configure keys working (never works by default)
source $ZSHCONF/keys.zsh

# Configure prompt to my specifications
source $ZSHCONF/prompt.zsh

# Load system wide aliases
source $ZSHCONF/aliases.zsh

# Load common shellfunctions
source $ZSHCONF/shellfunctions.zsh

## Now, allow for system, host, etc customizations

# Load distro specific settings (darwin, freebsd, linux, etc)
if [[ -s "${ZSHCONF}/$(uname | tr "[:upper:]" "[:lower:]").zsh" ]]; then
  source "${ZSHCONF}/$(uname | tr "[:upper:]" "[:lower:]").zsh"
fi

# Load system specific settings (box1, box2, etc)
if [[ -s "${ZSHCONF}/$(hostname | tr "[:upper:]" "[:lower:]").zsh" ]]; then
  source "${ZSHCONF}/$(hostname | tr "[:upper:]" "[:lower:]").zsh"
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
