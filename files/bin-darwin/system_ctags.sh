#!/usr/bin/env bash
# updates system ctags file

cd /System/Library/Frameworks

sdks=(
  CoreData.framework
  Security.framework
)

for f in "${sdks[@]}"; do
  cd $f
  ctags --languages=objectivec --langmap=objectivec:.h.m --append -f ~/git/global-objc-tags
  cd ..
done

## uikit is elsewhere...
xcode_path=$(xcode-select -p)
cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework
ctags --languages=objectivec --langmap=objectivec:.h.m --append -f ~/git/global-objc-tags
