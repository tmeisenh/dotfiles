#!/usr/bin/env bash
#
# Apple Script wrapped in a bash script (for ease of use)
# that sets the sound output to the headphones.
# Note: Will require you to authorize the terminal to "control"
# the mac.
#
# Author: Travis B. Meisenheimer

osascript <<EOF
tell application "System Preferences" to activate
tell application "System Preferences"
	reveal anchor "output" of pane id "com.apple.preference.sound"
end tell
tell application "System Events" to tell process "System Preferences"
	tell table 1 of scroll area 1 of tab group 1 of window 1
		select (row 1 where value of text field 1 is "Headphones")
	end tell
end tell
quit application "System Preferences"
EOF
