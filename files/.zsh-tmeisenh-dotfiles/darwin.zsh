#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
# Works on zsh versions > 4.0.9.
#
# Apple Mac OS X related zsh aliases, functions, and settings.
#********************************************************************

## setup homebrew
chip=$(uname -p)
if [[ $chip == "arm" ]]; then
  export HOMEBREW_HOME="/opt/homebrew"
else
  export HOMEBREW_HOME="/usr/local"
fi

# GPG terminal pinentry support
export GPG_TTY=$(tty)

#openssl_bin=/usr/local/opt/openssl/bin # 4/2016 - Homebrew doesn't allow you to link openssl

path=(
  "$HOMEBREW_HOME/bin"
  "$HOME/.codeium/windsurf/bin"
  "$path[@]"
)
# homebrew manpath additions
if [ -d "$HOMEBREW_HOME/opt/coreutils/libexec/gnuman" ]; then
  manpath=(
    "$HOMEBREW_HOME/opt/coreutils/libexec/gnuman"
    "$manpath[@]"
  )
fi

# Disables homebrew from doing a 'brew update' when you just want to 'brew install' something
export HOMEBREW_NO_AUTO_UPDATE=1

# System  specific environment variables and settings
bindkey "^[[H" beginning-of-line ## home
bindkey "^[[F" end-of-line       ## end

# use vim for less, man, and git
VIM_LESS=$(ls -d $(brew --prefix vim)/share/vim/vim*/macros/less.sh 2>/dev/null | tail -1)
alias less=${VIM_LESS}

export MANPAGER="col -b | ${VIM_LESS} -c 'set ft=man nomod nolist nofoldenable' -"
export GIT_PAGER='less'
export GIT_EDITOR='vim'

alias ctags-objc="ctags --languages=objectivec --langmap=objectivec:.h.m"
# Use gnu-ls if available otherwise use the (freebsd) version
gls &>/dev/null 2>&1 && alias ls="gls --color -F -T 0 -b -h -X -H" || alias ls="ls -F -T -b -h -C -G"

# xcode alias and completion
alias xcode="open -a Xcode"
compctl -g '*.(xcworkspace|xcodeproj)' + -g '*(-/)' xcode

# opens any workspace in the current working directory
function openws() {
  find . -type d -name "*.xcworkspace" -exec open {} \;
}

function clean_derived_data() {
  rm -rf ~/Library/Developer/Xcode/DerivedData
}

# Hash common directories
hash -d log=/var/log

# Usage: diskeject drive_number
# Description: kills a process
function diskeject() {
  echo -n "unmounting drive $1..."
  drutil tray eject -drive $1
}

function prevent_sleep() {
  sudo pmset -a disablesleep 1
}

function remove_dstore() {
  find . -maxdepth 1 -type f -name ".DS_Store" -exec rm -vf {} \;
}

function launchd_mylist() {
  launchctl list | grep indexoutofbounds
}

## adds java
export JAVA_HOME="$HOMEBREW_HOME/opt/openjdk@21"
PIP_BIN=$(ls -d "$HOME/Library/Python/3."*/bin 2>/dev/null | tail -1)
path=(
  "$JAVA_HOME/bin"
  ${PIP_BIN:+"$PIP_BIN"}
  "$path[@]"
)

# Lazy-load rbenv - only initialize when ruby commands are first used
rbenv() {
  unfunction rbenv ruby gem bundle irb
  eval "$(command rbenv init -)"
  rbenv "$@"
}
ruby() { rbenv; command ruby "$@" }
gem() { rbenv; command gem "$@" }
bundle() { rbenv; command bundle "$@" }
irb() { rbenv; command irb "$@" }
export NVM_DIR="$HOME/.nvm"
[[ -d "$NVM_DIR" ]] || mkdir -p "$NVM_DIR"

# Lazy-load nvm - only initialize when node commands are first used
_init_nvm() {
  unfunction nvm node npm npx _init_nvm 2>/dev/null
  source_if_exists "$(brew --prefix nvm)/nvm.sh"
}
nvm() { _init_nvm; nvm "$@" }
node() { _init_nvm; node "$@" }
npm() { _init_nvm; npm "$@" }
npx() { _init_nvm; npx "$@" }

export GTAGSLABEL=pygments
export EMACS_USER_DIRECTORY=$HOME/.emacs.d

source_if_exists "$HOME/.docker/init-zsh.sh"

# direnv - auto-load .envrc files per directory
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# end
