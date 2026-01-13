#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#********************************************************************

# UN/SET OPTIONS grouped by action
# man zshoptions for more information

# ----------------------
# Completion Options
# ----------------------
setopt alwaystoend        # Move cursor to end of word after completion
setopt alwayslastprompt   # Return to last prompt position after completion
setopt completealiases    # Complete aliases as commands
setopt completeinword     # Allow completion from middle of word
unsetopt autoparamslash   # Don't add trailing slash to directory completions

# ----------------------
# Completion Menu Behavior
# ----------------------
setopt autolist           # Automatically list choices on ambiguous completion
setopt automenu           # Use menu completion after second tab
setopt nobeep             # No beep on ambiguous completion
unsetopt menu_complete    # Don't insert first match immediately

# ----------------------
# Globbing Options
# ----------------------
setopt extended_glob      # Enable advanced pattern matching
setopt glob_dots          # Don't require leading dot for matching hidden files
setopt glob_complete      # Show completion menu when glob has multiple matches
setopt nullglob           # Delete patterns with no matches instead of error

# ----------------------
# History Options
# ----------------------
setopt append_history          # Append to history file rather than overwrite
setopt extended_history        # Save timestamp and duration in history
setopt bang_hist               # Enable history expansion with !
setopt hist_ignore_dups        # Don't save duplicate commands
setopt hist_ignore_space       # Commands starting with space aren't recorded (useful for secrets)
setopt hist_verify             # Show expanded history command before executing
setopt hist_reduce_blanks      # Remove extra whitespace from history entries
setopt hist_expire_dups_first  # Delete duplicates first when trimming history
setopt share_history           # Share history between sessions

# ----------------------
# Directory Navigation
# ----------------------
setopt pushdtohome        # pushd with no args goes to home directory
setopt autopushd          # Make cd push old directory onto stack
setopt pushdignoredups    # Don't push duplicate directories
setopt pushdminus         # Exchange meaning of + and - for specifying dirs
setopt pushdsilent        # Don't print directory stack after pushd/popd
setopt autocd             # Change directory without typing cd

# ----------------------
# Prompt Options
# ----------------------
setopt prompt_subst       # Enable parameter expansion in prompts

# ----------------------
# Miscellaneous Options
# ----------------------
setopt notify             # Report background job status immediately
setopt autoresume         # Resume existing jobs instead of creating new ones
setopt noclobber          # Don't overwrite files with > (use >! to override)
setopt rcquotes           # Allow '' to represent ' in single quoted strings
setopt login              # Treat shell as a login shell
setopt longlistjobs       # Display PID when suspending processes
setopt printeightbit      # Display eight-bit characters without escaping
setopt nohup              # Don't kill background jobs when shell exits

# ----------------------
# Path and File Options
# ----------------------
setopt pathdirs           # Make path search find directories
setopt markdirs           # Add trailing / to directory names in completion

# ----------------------
# Input Options
# ----------------------
setopt zle                  # Enable ZLE (Zsh Line Editor)
setopt vi                   # Use vi key bindings in ZLE
setopt no_sh_word_split     # Don't split words on unquoted parameter expansions
setopt interactive_comments # Allow comments in interactive shell
#unsetopt correct          # Don't try to correct spelling of commands
#setopt correct_all       # Try to correct spelling of all arguments (disabled)

# ----------------------
# Disabled Options
# ----------------------
unsetopt printexitvalue    # Don't print exit value of commands with non-zero exit status
unsetopt bgnice            # Don't run background jobs at lower priority
unsetopt mailwarning       # Don't warn about mail arrival
unsetopt flow_control      # Disable flow control (^S/^Q)
unsetopt rmstarsilent      # Ask before executing 'rm *' commands

# cdablevars is disabled for performance reasons
unsetopt cdablevars        # Never enable this
