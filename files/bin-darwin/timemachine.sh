#!/bin/bash
#
# Need to add /bin/bash to System Preferences > Security & Privacy > Privacy > Full Disk Access
# $ open /bin
# then drag bash into the list of allowed applications
# uses https://github.com/tmeisenh/linux-timemachine (my fork)
# To have the script run automatically by launchd, install in ~/Library/LaunchAgents

###
# NOTE: When doing `du -csh` on non-nas the output is incorrect.  The command run ssh'd into the nas reports the correct size.
###

export PATH=/usr/local/bin:/usr/bin:/bin
MYHOME="/Users/travis"
command="${MYHOME}/git/linux-timemachine/timemachine"
rsync_loc="nasreader:/volume1/backups"
rsync_args="--progress --no-perms --no-owner --no-group"

if [ ! -f "${command}" ]; then
  echo "${command} is not installed"
  exit 1
fi

echo "Starting at $(date)"
$command "--debug" "${MYHOME}/Documents" "${rsync_loc}/Documents" -- "${rsync_args}"
#$command "${MYHOME}/Music" "${rsync_loc}/Music" -- "${rsync_args}"
ret="$?"

if [ $ret -ne 0 ]; then
  echo "Did you enable Full disk access?"
  echo "Finished at $(date)"
  echo "--------------------------------------------------------------------------------"
  exit $ret
fi

echo "Finished at $(date)"
echo "--------------------------------------------------------------------------------"
exit 0
