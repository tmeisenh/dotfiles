#!/usr/bin/env bash

dir=$HOME/Library/KeyBindings
if [[ ! -d $dir ]]; then
  mkdir dir
fi

if [[ ! -e $dir/DefaultKeyBinding.dict ]]; then
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
}" >$dir/DefaultKeyBinding.dict
fi

echo "You must reboot for the changes to take."
echo "You will need to manually configure home/end keybindings in osx Terminal: home <ctrl>a and end: <ctrl>e"
echo "This works out to \001 and \005 for their values."
