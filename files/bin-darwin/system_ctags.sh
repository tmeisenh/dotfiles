#!/usr/bin/env bash
# updates system ctags file

cd /System/Library/Frameworks || exit

sdks=(
  CoreData.framework
  Security.framework
)

for f in "${sdks[@]}"; do
  (
    cd "$f" || exit
    ctags --languages=objectivec --langmap=objectivec:.h.m --append -f ~/git/global-objc-tags
  )
done

## uikit is elsewhere...
# xcode_path=$(xcode-select -p) # Unused variable
cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework || exit
ctags --languages=objectivec --langmap=objectivec:.h.m --append -f ~/git/global-objc-tags
