#!/usr/bin/env bash

# Compiled from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#   https://gist.github.com/millermedeiros/6615994
#   https://gist.github.com/brandonb927/3195465

CHK="\033[0;32m \xE2\x9c\x94 \033[0m"

sudo -v
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

echo -e "
######################
###     Finder     ###
######################
"
echo -e "Finder: allow text selection in Quick Look $CHK"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo -e "Finder: show hidden files by default $CHK"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo -e "Finder: show all filename extensions $CHK"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo -e "Finder: show status bar $CHK"
defaults write com.apple.finder ShowStatusBar -bool true

echo -e "Display full POSIX path as Finder window title $CHK"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo -e "Show Path bar in Finder $CHK"
defaults write com.apple.finder ShowPathbar -bool true

echo -e "When performing a search, search the current folder by default $CHK"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo -e "Finder: disable window animations and Get Info animations $CHK"
defaults write com.apple.finder DisableAllAnimations -bool true

echo -e "Use list view in all Finder windows by default $CHK"
# Four-letter codes for the other view modes: icnv, clmv, Flwv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo -e "Show the ~/Library folder $CHK"
chflags nohidden ~/Library

echo -e "Avoid creating .DS_Store files on network volumes $CHK"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo -e "
#############################################
###     Dock, Mission Control, Spaces     ###
#############################################
"

echo -e "Don’t group windows by application in Mission Control (i.e. use the old Exposé behavior instead) $CHK"
defaults write com.apple.dock expose-group-by-app -bool false

echo -e "Don’t automatically rearrange Spaces based on most recent use $CHK"
defaults write com.apple.dock mru-spaces -bool false

echo -e "
###########################
###     Screenshots     ###
###########################
"

echo -e "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF) $CHK"
defaults write com.apple.screencapture type -string "png"

echo -e "Disable shadow in screenshots $CHK"
defaults write com.apple.screencapture disable-shadow -bool true

echo -e "
########################################
###     Chrome, Safari, & WebKit     ###
########################################
"

echo -e "Privacy: Don't send search queries to Apple $CHK"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo -e "Hiding Safari's bookmarks bar by default $CHK"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo -e "Hiding Safari's sidebar in Top Sites $CHK"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo -e "Disabling Safari's thumbnail cache for History and Top Sites $CHK"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo -e "Enabling Safari's debug menu $CHK"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo -e "Making Safari's search banners default to Contains instead of Starts With $CHK"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo -e "Removing useless icons from Safari's bookmarks bar $CHK"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo -e "Enabling the Develop menu and the Web Inspector in Safari $CHK"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo -e "Adding a context menu item for showing the Web Inspector in web views $CHK"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo -e "Disabling the annoying backswipe in Chrome $CHK"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

#echo -e "Using the system-native print preview dialog in Chrome $CHK"
#defaults write com.google.Chrome DisablePrintPreview -bool true
#defaults write com.google.Chrome.canary DisablePrintPreview -bool true

echo -e "
#############################
###     Remote Access     ###
#############################
"
sudo systemsetup -f -setremotelogin on
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist

echo -e "
#############################
###     Miscellaneous     ###
#############################
"

echo -e "Expand save panel by default $CHK"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo -e "Show IP address, hostname, OS version when clicking the clock in the login window $CHK"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo -e "Check for software updates daily, not just once per week $CHK"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo -e "Enable full keyboard access for all controls $CHK"
echo -e "(e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo -e "Enable snap-to-grid for icons on the desktop and in other icon views $CHK"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo -e "Disable the warning before emptying the Trash $CHK"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo -e "Automatically quit printer app once the print jobs complete $CHK"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo -e "Set a really fast key repeat $CHK"
defaults write NSGlobalDomain KeyRepeat -int 0

echo -e "Disable press-and-hold for keys in favor of key repeat $CHK"
defaults write -g ApplePressAndHoldEnabled -bool false

echo -e "
#####################
###     Reset     ###
#####################
"

killall Dock
killall Finder

echo -e "Complete.  Restart computer to see any changes not already visible by killing Finder and Dock."
