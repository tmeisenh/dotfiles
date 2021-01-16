# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# Remove existing comp cache
#rm -rf $HOME/.zcompdump

# Add zsh-completions to fpath
fpath=(
  /usr/local/share/zsh-completions
  $fpath
)

# load compinit!
autoload -U compinit && compinit

# set command completions
zle -C complete complete-word complete-files

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
zstyle ':completion:*:descriptions' format '%d completing %d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns adm bin daemon halt lp named shutdown sync mysql nobody postfix root quest unknown clamav appowner appserver mailman qtss windowserver xgridagent xgridcontroller guest amavisd eppc jabber securityagent tokend sshd www cyrusimap indexoutofbounds.com
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Add known hosts to ssh/scp/sftp
local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts


# Correction
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:correct:*' max-errors 2 numeric
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# Completion caching
zstyle ':completion:*' use-cache 1
zstyle ':completion::complete:*' use-cache 1 cache-path $ZSHCACHEDIR

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Include non-hidden directories in globbed file completions
# for certain commands
zstyle ':completion::complete:*' '\'

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
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

# Describe each match group.
zstyle ':completion:*:descriptions' format "%d"

# Messages/warnings format
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%d--No matches for: %d'

# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

bindkey '^X\t' complete

complete-files () { compadd - * }

compctl -a {,un}alias             # -a is for alias
compctl -/ {c,push,pop}d
compctl -c exec                   # -c is commands, shell functs, alias
compctl -c man
compctl -c {where,which}
compctl -o {,un}setopt            # -o is names of shell functions
compctl -E {,un}setenv            # -E is environment variables
compctl -E printenv
compctl -b bindkey                # -b is keybinding names
compctl -j fg
compctl -j kill                   # -j is job names
compctl -u chown
compctl -c which
compctl -c sudo

# completion for "man" by Gossamer <gossamer@tertius.net.au>
compctl -f -x 'S[1][2][3][4][5][6][7][8][9]' -k '(1 2 3 4 5 6 7 8 9)' \
    - 'R[[1-9nlo]|[1-9](|[a-z]),^*]' -K 'match-man' \
    - 's[-M],c[-1,-M]' -g '*(-/)' \
          - 's[-P],c[-1,-P]' -c \
        - 's[-S],s[-1,-S]' -k '( )' \
    - 's[-]' -k '(a d f h k t M P)' \
    - 'p[1,-1]' -c + -K 'match-man' \
    -- man

compdef _gnu_generic feh df

# Tab host completion for programs
compctl -k hostnames ping sftp host ssh

# Talk completion
function whoson { reply=(`users`); }
compctl -K whoson talk ytalk

# Filter filename completions based on context
#function listclass () { reply=(`${(ls *.class)%.class}`); }
#function listclass () { reply=(${$(ls *.class)%.class}); }
#compctl -K listclass java
compctl -g '*.(Z|gz|tgz)' + -g '*' zcat gunzip
compctl -g '*.(tar.Z|tar.gz|tgz|tar.bz2)' + -g '*' tar smartextract se
compctl -g '*.(zip|ZIP)' + -g '*' unzip smartextract se
compctl -g '*(-/) .*(-/)' cd
