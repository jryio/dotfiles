#!/bin/bash

# =============================================================================
# TODO LIST

# @TODO: Change this to use mathias' macos overrides
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# =============================================================================

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

# Hide the desktop, never to be used again
defaults write com.apple.finder CreateDesktop FALSE

# Move the default Screenshots location to ~/Dropbox/media/screenshots
defaults write com.apple.screencapture location ~/Dropbox/media/screenshots

# Restarting services
killall Finder
killall SystemUIServer
