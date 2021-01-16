#!/usr/bin/env bash
#
# Wrapper script to make writing a cd easier using cdrdao
# Version: $Id$
#

#Enable the following line if you have Superdrive
#You might have to add IODVDServices/1 or IODVDServices/2 if you have multiple drives
DEVICE=IODVDServices

#Enable the following line if you have regular/combo drive
#You might have to add oIOCompactDiscService/1 sr IOCompactDiscServices/2 if you have multiple drives
#DEVICE=IOCompactDiscServices

# driver type
DRIVER=generic-mmc

case $# in
0)
   echo 'Usage: burncd toc_file.toc' >&2
   exit 1
   ;;
*)
   CDRDAO="cdrdao write --device $DEVICE --driver $DRIVER  $1"
   echo "$CDRDAO"
   eval $CDRDAO
   ;;
esac
