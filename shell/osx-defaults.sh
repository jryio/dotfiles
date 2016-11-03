#!/bin/bash
#
# Writing some default system behavior for OS X to make life suck less
# Settings:
#   - Show hidden files in Finder
#   - Open Finder in column view, this is important
#   - Hide the FUCKING Desktop, who even uses that shit?
#   - Move the default Screenshots location to ~/Pictures/
#   - Change iTerm's cursor blinking rate

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles TRUE

# Open Finder in column view
#   Nlsv – List View
#   icnv – Icon View
#   clmv – Column View
#   Flwv – Cover Flow View
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Hide the FUCKING Desktop, who even uses that shit?
defaults write com.apple.finder CreateDesktop FALSE

# Move the default Screenshots location to ~/Pictures/
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Chang iTerm's cursor blinking rate to something faster
defaults write com.googlecode.iterm2 TimeBetweenBlinks -float 0.5

# Restarting services
killall Finder
killall SystemUIServer
