#!/bin/zsh
# Z shell configuration file for "core" aliases
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Note: Some aliases, like ls, are defined in os specific files.
# Works on zsh versions > 4.0.9.
#********************************************************************

alias -g L="|less"
alias -g M="|more"
alias -g G="|grep"
alias -g Ge="|grep -v grep"
alias -g N="&>/dev/null&"
alias -g T="|tail"
alias -g H="|head"
alias -g SL="|sort | less"
alias -g S="|sort"
alias -g C="|wc -l"

alias ll="ls -l --all --human-readable"
alias rm="rm -i"
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv -i"
alias bz="tar --verbose --extract --bzip2 --file"
alias ctar="tar --verbose --create --gzip --file"
alias utar="tar --verbose --extract --gzip --file"
alias ltar="tar --verbose --list --gzip --file"
alias gz=gunzip
alias se="smartextract"
alias ds="du -csh"  # Removed positional parameter which doesn't work in aliases
alias pingg="ping -c 3 www.google.com"
alias dtsp="date +%F"

alias vi="vim"
alias svi="sudo vim"
# bash bulletin man pages!!
# Define help as a function instead of an alias
function help() {
  bash -c "help $1"
}
