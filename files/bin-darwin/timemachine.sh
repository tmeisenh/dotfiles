#!/bin/bash
#
# Need to add /bin/bash to System Preferences > Security & Privacy > Privacy > Full Disk Access
# $ open /bin
# then drag bash into the list of allowed applications
# uses https://github.com/tmeisenh/linux-timemachine (my fork)
# To have the script run automatically by launchd, install in ~/Library/LaunchAgents

export PATH=/usr/local/bin:/usr/bin:/bin
LHOME="/Users/travis"
command="$LHOME/git/linux-timemachine/timemachine"
rsync_dir="/Volumes/stuff/rsync-timemachine-backup"

if [ ! -f "$command" ]; then
  echo "$command is not installed"
  exit 1
fi

echo "$command is installed"
$command $LHOME "$rsync_dir/home" -- --exclude-from="$LHOME/.timemachine.exclude.txt" --progress
ret="$?"

if [ $ret -ne 0 ]; then
  echo "Did you enable Full disk access?"
  echo "--------------------------------------------------------------------------------"
  exit $ret
fi

echo "--------------------------------------------------------------------------------"
exit 0
