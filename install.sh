#!/bin/bash

#----------------------------------------------------------------------------------------
# Well documented, terminal centric web developer's dot files.
# Debian/ubuntu based distros installer.
# @author Martin Toma
#
# @version 6.0
# @updated Sat Nov  7 22:38:01 CET 2015
# @created Fri Nov 15 13:13:22 CET 2013
#----------------------------------------------------------------------------------------

# Dont continue on error
set -e

# Existing files won't be replaced
REPLACE_FILES=false

#-----------------------------------------------------
# Source Paths
#-----------------------------------------------------
NEOVIM_DIR="nvim"
SHELL_DIR="shell"
ZSH_THEME_DIR="zsh-theme"
GIT_DIR="git"
TMUX_DIR="tmux"

THEME_FILE="honukai.zsh-theme"
#-----------------------------------------------------
# Destintation Paths
#-----------------------------------------------------
NEOVIM_CONFIG="$HOME/.config/nvim"
OH_MY_ZSH_CONFIG="$HOME/.oh-my-zsh"

#-----------------------------------------------------
# Functions and variables
#-----------------------------------------------------
CURRENT_PATH=$(pwd)

command_exists() {
  type "$1" &>/dev/null
}

install_oh_my_zsh() {
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  ln -sf "$CURRENT_PATH/$SHELL_DIR/$THEME_FILE" "$OH_MY_ZSH_CONFIG/themes/$THEME_FILE"
  echo "    Change your default shell to zsh"
  sudo chsh
}

install_plug_nvim() {
  curl -fLo "NEOVIM_CONFIG/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_nvim_folder() {
  mkdir -p "$NEOVIM_CONFIG/autoload"
  install_plug_nvim
  ln -sf "$CURRENT_PATH/$NEOVIM_DIR/spell/dictionary.utf-8.add" "$NEOVIM_CONFIG/dictionary.utf-8.add"
  ln -sf "$CURRENT_PATH/$NEOVIM_DIR/init.vim" "$NEOVIM_CONFIG/init.vim"
  ln -sf "$CURRENT_PATH/$NEOVIM_DIR/autoload/utils.vim" "$NEOVIM_CONFIG/autoload/utils.vim"
}

symlink_multiple() {
  source_dir="$1"
  files="$2"

  for file in $files; do
    echo -n "[ $file ]"
    if [ ! -f "$HOME/.$file" ]; then
      echo "    Creating $file!"
      ln -sf "$CURRENT_PATH/$source_dir/$file" "$HOME/.$file"
    elif $REPLACE_FILES; then
      echo "    Deleting old $file!"
      rm -f "$HOME/.$file"
      ln -sf "$CURRENT_PATH/$source_dir/$file" "$HOME/.$file"
    else
      echo "    Keeing existing $file!"
    fi
  done
}

#-----------------------------------------------------
# Basic requirements check
#-----------------------------------------------------

if ! command_exists curl; then
  briew install curl
fi


#-----------------------------------------------------
# Setting OS X defaults
#-----------------------------------------------------
source "$CURRENT_PATH/$SHELL_DIR/osx-defaults.sh"

#-----------------------------------------------------
# ZSH installation
#-----------------------------------------------------
ZSH_FILES=("zshrc" "zlogin")

symlink_multiple $SHELL_DIR $ZSH_FILES

echo -n "[ oh-my-zsh ]"

if command_exists zsh; then
  if [ ! -d $OH_MY_ZSH_CONFIG ]; then
    echo "    Installing Oh my zsh"
    install_oh_my_zsh
  fi
else
  echo "    Installing ZSH."
  brew install zsh
  install_oh_my_zsh
fi

#-----------------------------------------------------
# Git (config, ignore)
#-----------------------------------------------------
GIT_FILES=("gitconfig" "gitignore")

symlink_multiple $GIT_DIR $GIT_FILES


#-----------------------------------------------------
# Neovim, dictionary, ultisnips
#-----------------------------------------------------
echo -n "[ Neovim ]"

if ! command_exists nvim; then
  echo "    Installing Neovim!"
  brew install neovim
fi

echo -n "[ Neovim config ]"

if [ ! -d "$HOME/.config/nvim" ]; then
  echo "    Creating nvim folder!"
  mkdir "$HOME/.config/nvim"
  install_nvim_folder
elif $REPLACE_FILES; then
  echo "    Deleting old nvim folder!"
  rm -rf "$HOME/.config/nvim"
  install_nvim_folder
else
  echo "    Keeping existing nvim folder!"
fi

#-----------------------------------------------------
# Installing tmux
#-----------------------------------------------------
TMUX_FILES=("tmux.conf")

symlink_multiple $TMUX_DIR $TMUX_FILES

#-----------------------------------------------------
# Installing Ag
#-----------------------------------------------------
echo -n "[ Ag ]"

if command_exists ag; then
  if [ ! -f "$HOME/.agignore"]; then
    echo "   Creating agignore!"
    ln -sf "$CURRENT_PATH/other/agignore" "$HOME/.agignore"
  else
    echo "   Keeping existing agignore!"
  fi
else
  echo "   Installing Ag!"
  brew install the_silver_searcher
  echo "   Creating agignore!"
  ln -sf "$CURRENT_PATH/other/agignore" "$HOME/.agignore"
fi

#-----------------------------------------------------
# Installing linters
#-----------------------------------------------------
echo -n "[ Eslint ]"

if command_exists eslint; then
  ln -sf "$CURRENT_PATH/linters/eslintrc" "$HOME/.eslintrc"
else
  if command_exists npm; then
    npm install -g eslint
    ln -sf "$CURRENT_PATH/linters/eslintrc" "$HOME/dev/.eslintrc"
  else
    echo "   Install node and npm, then rerun script again!"
    exit
  fi
fi

