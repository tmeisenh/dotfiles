# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# UN/SET OPTIONS grouped by action
# man zshoptions for more information

# Completion Options
setopt alwaystoend
setopt alwayslastprompt
setopt completealiases
setopt completeinword
unsetopt autoparamslash

# Ambigious Completions
setopt autolist
setopt automenu
setopt nobeep
unsetopt menu_complete

# Globbing Options
setopt extended_glob
setopt glob_dots
setopt glob_complete
setopt nullglob

# History Options
setopt append_history
setopt extended_history
setopt inc_append_history
setopt bang_hist
setopt hist_ignore_dups
setopt share_history

# PUSHD/POPD
setopt pushdtohome
setopt autopushd
setopt pushdignoredups
setopt pushdminus
setopt pushdsilent
setopt autocd

#prompt
setopt prompt_subst

# Miscellaneous
setopt notify
setopt autoresume
setopt noclobber
setopt rcquotes
setopt login
setopt longlistjobs
setopt printeightbit
setopt nohup
setopt pathdirs
setopt markdirs
setopt zle
setopt vi
setopt no_sh_word_split
#setopt correct_all

unsetopt printexitvalue
unsetopt bgnice
unsetopt mailwarning
unsetopt flow_control
unsetopt rmstarsilent
# cdablevars will match for cd anything that fits the pattern at any
# point in the absolute path to pwd.  So, if in $HOME, it will match
# on /, /home, and /home/*/.  This is a performance nightmare
# on corporate systems.
unsetopt cdablevars

#unsetopt correct_all
#unsetopt correct
