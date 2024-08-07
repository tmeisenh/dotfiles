#!/bin/bash
CONFIG_FILE="$HOME/.duckdns"

if [[ -f $CONFIG_FILE ]]; then
  . $CONFIG_FILE
  echo url="https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip=" |
    curl -k -K -
fi
