#!/bin/bash

while true; do
  osascript -e 'tell application "System Events" to set delay interval of screen saver preferences to 10800 -- Number In Seconds'
  echo "fixing screen saver"
  sleep 600 # ten minutes
done

