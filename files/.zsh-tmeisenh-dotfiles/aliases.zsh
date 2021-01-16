# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Note: Some aliases are specifically FreeBSD or "non linux"
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

# set ls based on core-utils else assume bsd versions
gls &>/dev/null 2>&1 && alias ls="gls --color -F -T 0 -b -h -X -H" || alias ls="ls -F -T -b -h -C -G"

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
alias cl="clear"
alias cls=cl
alias sl=ls
alias ";ls"=ls
alias ds="du -csh $1 "
alias pingg="ping -c 3 www.google.com"
alias dtsp="date +%F"

alias vi="vim"
alias svi="sudo vim"
