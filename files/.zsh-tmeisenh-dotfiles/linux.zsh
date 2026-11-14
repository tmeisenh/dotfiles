#!/bin/zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# Linux-related zsh aliases and functions
#********************************************************************

alias ls="ls --color=auto -F -T 0 -b -h -H -X"
alias lsd="ls --color=auto -d -T 0 -b -h -H -X *(-/DN)"
alias llsd="ls --color=auto -ld -T 0 -b -h -H -X *(-/DN)"
alias lsa="ls --color=auto -ld -h -H -X -b -T 0 .*"
alias last_mod="ls --color=auto -Flat -h -H -b -X -T 0"
alias xcopy="xclip"
alias pbcopy="xclip"

bindkey "^[OH" beginning-of-line   ## home
bindkey "^[OF" end-of-line         ## end
bindkey "^[OA" up-line-or-search   ## up arrow for back-history-search
bindkey "^[OB" down-line-or-search ## down arrow for fwd-history-search

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

export ANTIDOTE_HOME=~/.antidote
export ANTIDOTE_ZSH=/usr/share/zsh-antidote/antidote.zsh
