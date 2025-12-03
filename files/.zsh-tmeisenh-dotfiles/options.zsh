#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# UN/SETOPT OPTIONS grouped by action
# man zshoptions for more information

# Completion Options
setopt alwaystoend      # Move cursor to end of word after completion
setopt alwayslastprompt # Return to last prompt if no match found
setopt completealiases  # Complete aliases as commands
setopt completeinword   # Complete from both ends of a word
unsetopt autoparamslash # Don't add trailing slash to directory parameters

# Ambiguous Completions
setopt autolist       # Show possible completions when ambiguous
setopt automenu       # Use menu completion on second tab press
setopt nobeep        # No beep on ambiguous completion
unsetopt menu_complete # Don't insert first match immediately

# Globbing Options
setopt extended_glob  # Enable advanced pattern matching
setopt glob_dots     # Include hidden files in globbing
setopt glob_complete # Use globbing in completion
setopt nullglob     # Empty patterns expand to nothing instead of themselves

# History Options
setopt append_history     # Append to history file, don't overwrite
setopt extended_history   # Save timestamps in history
setopt bang_hist         # Enable history expansion with !
setopt hist_ignore_dups  # Don't save duplicate commands
setopt share_history     # Share history between sessions
setopt hist_ignore_space # Don't save commands starting with space
setopt hist_reduce_blanks # Remove extra blanks from commands
setopt hist_verify       # Show command with history expansion before running

# PUSHD/POPD
setopt pushdtohome     # pushd with no args goes to ~
setopt autopushd       # cd automatically pushes old directory
setopt pushdignoredups # Don't push duplicates onto directory stack
setopt pushdminus      # Exchange + and - meanings in cd -N
setopt pushdsilent     # Don't print directory stack after pushd/popd
setopt autocd          # Change directory without cd command

# Prompt
setopt prompt_subst    # Enable parameter expansion in prompts

# Miscellaneous
setopt notify              # Report status of background jobs immediately
setopt autoresume          # Resume existing job when name typed as command
setopt noclobber           # Don't overwrite files with > (use >! to override)
setopt rcquotes            # Allow '' to represent ' in single quoted strings
setopt login               # Ensure shell is a login shell
setopt longlistjobs        # Display PID when suspending processes
setopt printeightbit       # Print eight bit characters without escaping
setopt nohup               # Don't kill background jobs when shell exits
setopt pathdirs            # Perform path search even on command names with /
setopt markdirs            # Append / to directory names in completion
setopt zle                 # Use Zsh Line Editor
setopt vi                  # Use vi keybindings
setopt no_sh_word_split    # Don't split words on unquoted parameter expansion
setopt interactive_comments # Allow comments in interactive shell
setopt no_case_glob        # Case insensitive globbing

# Disabled Options
unsetopt printexitvalue  # Don't print exit value of programs with non-zero exit status
unsetopt bgnice          # Don't run background jobs at lower priority
unsetopt mailwarning     # Don't print mail warnings
unsetopt flow_control    # Disable flow control (^S/^Q)
unsetopt rmstarsilent    # Ask before executing 'rm *'
# Never, ever, use cdablevars - performance nightmare on large systems
unsetopt cdablevars      # Don't treat words with leading ~ as variables for cd