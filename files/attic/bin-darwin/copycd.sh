#!/usr/bin/env bash

# Wrapper script to make diskimages of audio/data/vcd using cdrdao
# Version: $Id$

#Enable the following line if you have Superdrive
#You might have to add IODVDServices/1 or IODVDServices/2 if you have multiple drives
DEVICE=IODVDServices

#Enable the following line if you have regular/combo drive
#You might have to add IOCompactDiscServices/1 or IOCompactDiscServices/2 if you have multiple drives
#DEVICE=IOCompactDiscServices

DRIVER=generic-mmc

case $# in
0)
  echo 'Usage: copycd filename' >&2
  exit 1
  ;;
*)
  #extract the bsd disk number/name and volumename from the disktool listing
  disk=$(disktool -l | grep Volumes | grep cddafs | cut -d"," -f1 | cut -d"(" -f2 | tr -d "'")
  volume=$(disktool -l | grep Volumes | grep cddafs | cut -d"," -f4 | cut -d"(" -f2 | cut -d"'" -f2)
  echo "Unmounting disk:'$disk' volume:'$volume'"
  disktool -u "$disk"
  echo "Creating disk image"
  CDRDAO="cdrdao read-cd --device $DEVICE --driver $DRIVER --read-raw --with-cddb --datafile $1.bin $1.toc"
  echo "$CDRDAO"
  if true; then
    (eval "$CDRDAO" &&
      echo "Created the disk image '$1.bin' and table of contents file '$1.toc'") ||
      echo "FAILED to create the disk image '$1.bin' and table of contents file '$1.toc'"
  fi
  ;;
esac
