#!/usr/bin/env bash

if [[ ! -d $HOME/Library/KeyBindings ]]; then
  mkdir $HOME/Library/KeyBindings
fi

if [[ ! -e DefaultKeyBinding.dict ]]; then
  echo "{
  /* Remap Home / End keys to be correct */
  \"\UF729\" = \"moveToBeginningOfLine:\"; /* Home */
  \"\UF72B\" = \"moveToEndOfLine:\"; /* End */
  \"$\UF729\" = \"moveToBeginningOfLineAndModifySelection:\"; /* Shift + Home */
  \"$\UF72B\" = \"moveToEndOfLineAndModifySelection:\"; /* Shift + End */
  \"^\UF729\" = \"moveToBeginningOfDocument:\"; /* Ctrl + Home */
  \"^\UF72B\" = \"moveToEndOfDocument:\"; /* Ctrl + End */
  \"$^\UF729\" = \"moveToBeginningOfDocumentAndModifySelection:\"; /* Shift + Ctrl + Home */
  \"$^\UF72B\" = \"moveToEndOfDocumentAndModifySelection:\"; /* Shift + Ctrl + End */
}" >$HOME/Library/KeyBindings/DefaultKeyBinding.dict
fi
echo "You must reboot for the changes to take."
echo "You may need to manually set home/end keybindings in osx Terminal home: slash033[H and end: slash033[F"
