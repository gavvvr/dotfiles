defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock persistent-apps -array
killall Dock

# Disable shortcut (double-fn by default) for enabling dictation
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int 0
