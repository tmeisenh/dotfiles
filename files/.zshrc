# shellcheck shell=bash
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Source /etc/profile
[[ -f /etc/profile ]] && source /etc/profile

# Some environment variables and settings
USER=$(id -un)
export USER
HOSTNAME=$(hostname)
export HOSTNAME
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
# shellcheck disable=SC2034 # ZSH-specific, used by the shell
watch=(notme root)

# Create $user history files
export HISTSIZE=1000000
export SAVEHIST=1000000
export DIRSTACKSIZE=16
export HISTFILE=$HOME/.zsh_history

# Load some cool zsh features
# shellcheck disable=SC2034 # ZSH-specific, used by the shell
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
# shellcheck disable=SC2206 # ZSH-specific array handling
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# set common man paths
# shellcheck disable=SC2206 # ZSH-specific array handling
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

# shellcheck disable=SC2206,SC2128 # ZSH-specific array handling
[[ -d $HOME/bin ]] && path=($HOME/bin $path)
# shellcheck disable=SC2206,SC2128,SC2207 # ZSH-specific array handling
[[ -d $HOME/bin-$(uname | tr "[:upper:]" "[:lower:]") ]] && path=($HOME/bin-$(uname | tr "[:upper:]" "[:lower:]") $path)

# Load custom LS_COLORS
[[ -e $ZSHCONF/ls_colors.sh ]] && {
  # shellcheck disable=SC1091 # Can't follow external file
  source "$ZSHCONF"/ls_colors.sh
}
# shellcheck disable=SC2153 # LS_COLORS is set in ls_colors.sh
export ZLS_COLORS=$LS_COLORS

# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit coredumpsize 0
limit -s

# Load shell options
# shellcheck disable=SC1091 # Can't follow external file
source "$ZSHCONF"/options.zsh

# Load command completions
# shellcheck disable=SC1091 # Can't follow external file
source "$ZSHCONF"/completions.zsh

# Configure keys working (never works by default)
# shellcheck disable=SC1091 # Can't follow external file
source "$ZSHCONF"/keys.zsh

# Configure prompt
# shellcheck disable=SC1091 # Can't follow external file
source "$ZSHCONF"/prompt.zsh

# Load system wide aliases
# shellcheck disable=SC1091 # Can't follow external file
source "$ZSHCONF"/aliases.zsh

# Load common shellfunctions
# shellcheck disable=SC1091 # Can't follow external file
source "$ZSHCONF"/shellfunctions.zsh

## Now, allow for system, host, etc customizations

# Load distro specific settings (darwin, freebsd, linux, etc)
distro_zsh="${ZSHCONF}/$(uname | tr "[:upper:]" "[:lower:]").zsh"
if [[ -s ${distro_zsh} ]]; then
  # shellcheck disable=SC1090 # Can't follow non-constant source
  source "${distro_zsh}"
fi

# Load system specific settings (box1, box2, etc)
host_zsh="${ZSHCONF}/host-$(hostname | tr "[:upper:]" "[:lower:]").zsh"
if [[ -s ${host_zsh} ]]; then
  # shellcheck disable=SC1090 # Can't follow non-constant source
  source "${host_zsh}"
fi

# Load private (not stored in git) settings
[[ -e $ZSHCONF/private.zsh ]] && {
  # shellcheck disable=SC1091 # Can't follow external file
  source "$ZSHCONF"/private.zsh
}

# Load anything specific to a work project
for f in "$ZSHCONF"/projects/*.zsh; do
  # shellcheck disable=SC1090 # Can't follow non-constant source
  source "$f"
done

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
