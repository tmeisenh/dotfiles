# Z shell configuration file
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

alias ll="ls -lah"
alias rm="rm -i"
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv -i"
alias grep="grep -Hn"
alias bz="tar -xvjf"
alias ctar="tar -vzcf"
alias utar="tar -xvzf"
alias ltar="tar -vztf"
alias gz=gunzip
alias se="smartextract"
alias ds="du -csh $1 "
alias pingg="ping -c 3 www.google.com"
alias dtsp="date +%F"

alias vi="vim"
alias svi="sudo vim"
