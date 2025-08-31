#!/bin/zsh
# shellcheck shell=zsh
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
# FreeBSD-related  setups
# Note: Most of these functions aren't really true functions.
# They're more like "places where I can put things so I can remember
# terse commands"
#********************************************************************

# NOTE: you will want to install ports/ports-mgmt/pkg

# color man pages, whoa...
VIM=/usr/local/share/vim/vim73
export MANPAGER="col -b | ${VIM}/macros/less.sh -c 'set ft=man nomod nolist nofoldenable' -"

# Hash common directories
hash -d log=/var/log
hash -d ports=/usr/ports
hash -d src=/usr/src
hash -d doc=/usr/share/doc
hash -d pdoc=/usr/local/share/doc
hash -d www=/usr/local/www

function list_installed_ports() {
  pkg_info
}

# update_ports_tree
# requires root/sudo access
function update_ports_tree() {
  echo "Updating /usr/ports ..."
  sudo portsnap fetch update
}

# update_src_tree
# requires root/sudo access
function update_src_tree() {
  echo "Updating /usr/src ..."
  sh -c 'sudo svn up /usr/src'
}

# search_ports <ports name to find>
function search_ports() {
  sh -c "cd /usr/ports/; make quicksearch name=\"${1}\""
}

function find_outofdate_ports() {
  sh -c "pkg_version -q -l '<'"
}

#TODO test this
function search_pkgs() {
  sh -c 'pkg search -g "$1"'
}

# finds installed packages which do not have a maintainer
function find_unmaintained_ports() {
  sh -c 'cd /usr/ports; grep -F "`for o in \`pkg_info -qao\` ; \
  do echo "|/usr/ports/${o}|" ; done`" `make -V INDEXFILE` | \
  grep -i \|ports@freebsd.org\| | cut -f 2 -d \| '
}

# FreeBSD won't mount the usbstick if it is not clean.
# depends on /usr/ports/sysutils/e2fsprogs
function clean_ext2fs_usbstick() {
  sudo fsck -t ext2fs /dev/da0s1
}

# mount usbstick to common place
function mount_ext2fs_usbstick() {
  sudo mount -t ext2fs /dev/da0s1 /mnt/usb
}

# unmount usbstick from common place
function unmount_ext2fs_usbstick() {
  sudo umount /mnt/usb
}

#********************************************************************
# environment stuff
#********************************************************************

export JAVA_HOME=/usr/local/openjdk7
export M2_HOME=/usr/local/share/java/maven3
export ANT_HOME=/usr/local/share/java/apache-ant
export GRADLE_HOME=/usr/local/share/java/gradle
export ANDROID_HOME=/home/travis/android-sdk/sdk

path=(
  "$JAVA_HOME/bin"
  "$M2_HOME/bin"
  "$ANT_HOME/bin"
  "$GRADLE_HOME/bin"
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/tools"
  "${path[@]}"
)

# FreeBSD uses a javawrapper.sh in /usr/local/bin to execute java type commands.
# We manually set java and JAVA_HOME in case someone else needs it (maven/ant/gradle)
