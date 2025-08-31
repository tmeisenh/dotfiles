#!/bin/bash
CONFIG_FILE="$HOME/.duckdns"

date
if [[ -f $CONFIG_FILE ]]; then
  . "$CONFIG_FILE"
  curl --no-progress-meter --insecure "https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip="
fi
