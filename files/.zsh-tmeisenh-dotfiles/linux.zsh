#!/bin/zsh
# shellcheck shell=zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# Linux-related zsh aliases and functions
#********************************************************************

alias ls="ls --color -F -T 0 -b -h -H -X"
alias lsd="ls --color -d -T 0 -b -h -H -X *(-/DN)"
alias llsd="ls --color -ld -T 0 -b -h -H -X *(-/DN)"
alias lsa="ls --color -ld -h -H -X -b -T 0 .*"
alias last_mod="ls --color -Flat -h -H -b -X -T 0"
alias xcopy="xclip"
alias pbcopy="xclip"

bindkey "^[OH" beginning-of-line   ## home
bindkey "^[OF" end-of-line         ## end
bindkey "^[OA" up-line-or-search   ## up arrow for back-history-search
bindkey "^[OB" down-line-or-search ## down arrow for fwd-history-search

# color man pages, whoa...
VIM=/usr/share/vim/vim73
#export MANPAGER="col -b | $VIM/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

# Hash common directories
hash -d log=/var/log

function search_apt() {
  apt-cache search "${1}"
}

function clean_ext2fs_usbstick() {
  sudo fsck -t ext2 /dev/sdb1
}

# mount usbstick to common place
function mount_ext2fs_usbstick() {
  sudo mount -t ext2 /dev/sdb1 /mnt/usb
}

# unmount usbstick from common place
function unmount_ext2fs_usbstick() {
  sudo umount /mnt/usb
}

#********************************************************************
# environment stuff
#********************************************************************

export JAVA_HOME=/usr/lib/jvm/java-6-oracle
export IDEA_JDK="$JAVA_HOME"
export M3_HOME=/usr/local/apache-maven
export ANT_HOME=/usr/local/share/java/apache-ant
export GRADLE_HOME=/usr/local/gradle
export ANDROID_HOME=~/android-sdk/sdk

path=(
  "$JAVA_HOME/bin"
  "$M3_HOME/bin"
  "$ANT_HOME/bin"
  "$GRADLE_HOME/bin"
  "$HOME/.rvm/bin"
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/tools"
  "${path[@]}"
)
