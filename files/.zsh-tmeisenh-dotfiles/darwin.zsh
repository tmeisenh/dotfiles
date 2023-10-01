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

#openssl_bin=/usr/local/opt/openssl/bin # 4/2016 - Homebrew doesn't allow you to link openssl
path=(
  $HOMEBREW_HOME/bin
  $path
)
# homebrew manpath additions
if [ -d $HOMEBREW_HOME/opt/coreutils/libexec/gnuman ]; then
  manpath=(
    /usr/local/opt/coreutils/libexec/gnuman
    $manpath
  )
fi

# Disables homebrew from doing a 'brew update' when you just want to 'brew install' something
export HOMEBREW_NO_AUTO_UPDATE=1

# System  specific environment variables and settings
bindkey "^[[H" beginning-of-line ## home
bindkey "^[[F" end-of-line       ## end

# use vim for less, man, and git
VIM_LESS=$(brew --prefix vim)/share/vim/vim90/macros/less.sh
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

function fix_screensaver() {
  local halfHour=1800
  defaults -currentHost write com.apple.screensaver idleTime ${halfHour}
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
export JAVA_HOME="$HOMEBREW_HOME/opt/openjdk@17"
export PIP_BIN="$HOME/Library/Python/3.11/bin"
path=(
  $JAVA_HOME/bin
  $PIP_BIN
  $path
)

eval "$(rbenv init -)"
[[ -d $HOME/.nvm ]] || mkdir -p $HOME/.nvm

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

export GTAGSLABEL=pygments
export EMACS_USER_DIRECTORY=$HOME/.emacs.d

[[ -f $HOME/.docker/init-zsh.sh ]] && source $HOME/.docker/init-zsh.sh

# end
