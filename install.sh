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
REPLACE_FILES=true

#-----------------------------------------------------
# Functions and variables
#-----------------------------------------------------
current_path=$(pwd)

command_exists() {
  type "$1" &>/dev/null
}

install_oh_my_zsh() {
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  ln -sf $current_path/shell/martinus.zsh-theme ~/.oh-my-zsh/themes/martinus.zsh-theme
  echo "    Change your default shell to zsh"
  sudo chsh
}

install_plug_nvim() {
  curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_nvim_folder() {
  mkdir -p ~/.config/nvim/autoload
  install_plug_nvim
  ln -sf $current_path/neovim/spell/dictionary.utf-8.add ~/.config/nvim/dictionary.utf-8.add
  ln -sf $current_path/neovim/init.vim ~/.config/nvim/init.vim
  ln -sf $current_path/neovim/autoload/utils.vim ~/.config/nvim/autoload/utils.vim
}

#-----------------------------------------------------
# Basic requirements check
#-----------------------------------------------------

if ! command_exists curl; then
  briew install curl
fi

#-----------------------------------------------------
# ZSH installation
#-----------------------------------------------------
echo -n "[ zshrc ]"

if [ ! -f ~/.zshrc ]; then
  echo "    Creating zshrc!"
  ln -sf $current_path/shell/zshrc ~/.zshrc
elif $REPLACE_FILES; then
  echo "    Deleting old zshrc!"
  rm ~/.zshrc
  ln -sf $current_path/shell/zshrc ~/.zshrc
else
  echo "    Keeping existing zshrc!"
fi

echo -n "[ oh-my-zsh ]"

if command_exists zsh; then
  if [ ! -d ~/.oh-my-zsh ]; then
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
echo -n "[ gitconfig ]"

if [ ! -f ~/.gitconfig ]; then
  echo "    Creating gitconfig!"
  ln -sf $current_path/git/gitconfig ~/.gitconfig
elif $REPLACE_FILES; then
  echo "    Deleting old gitconfig!"
  rm ~/.gitconfig
  ln -sf $current_path/git/gitconfig ~/.gitconfig
else
  echo "    Keeping existing gitconfig!"
fi

echo -n "[ gitignore ]"

if [ ! -f ~/.gitignore ]; then
  echo "    Creating gitignore!"
  ln -sf $current_path/git/gitignore ~/.gitignore
elif $REPLACE_FILES; then
  echo "    Deleting old gitignore!"
  rm ~/.gitignore
  ln -sf $current_path/git/gitignore ~/.gitignore
else
  echo "    Keeping existing gitignore!"
fi

#-----------------------------------------------------
# Neovim, dictionary, ultisnips
#-----------------------------------------------------
echo -n "[ Neovim ]"

if ! command_exists nvim; then
  echo "    Installing Neovim!"
  brew install neovim
fi

echo -n "[ Neovim config ]"

if [ ! -d ~/.config/nvim ]; then
  echo "    Creating nvim folder!"
  mkdir ~/.config/nvim
  install_nvim_folder
elif $REPLACE_FILES; then
  echo "    Deleting old nvim folder!"
  rm -rf ~/.config/nvim
  install_nvim_folder
else
  echo "    Keeping existing nvim folder!"
fi

#-----------------------------------------------------
# Installing tmux
#-----------------------------------------------------
echo -n "[ tmux.conf ]"

if ! command_exists tmux; then
  brew install tmux
fi

if [ ! -f ~/.tmux.conf ]; then
  echo "    Creating tmux.conf!"
  ln -sf $current_path/tmux/tmux.conf ~/.tmux.conf
elif $REPLACE_FILES; then
  echo "    Deleting old tmux.conf!"
  rm ~/.tmux.conf
  ln -sf $current_path/tmux/tmux.conf ~/.tmux.conf
else
  echo "    Keeping existing tmux.conf!"
fi

#-----------------------------------------------------
# Installing Ag
#-----------------------------------------------------
echo -n "[ Ag ]"

if command_exists ag; then
  if [ ! -f ~/.agignore ]; then
    echo "   Creating agignore!"
    ln -sf $current_path/other/agignore ~/.agignore
  else
    echo "   Keeping existing agignore!"
  fi
else
  echo "   Installing Ag!"
  brew install the_silver_searcher
  echo "   Creating agignore!"
  ln -sf $current_path/other/agignore ~/.agignore
fi

#-----------------------------------------------------
# Installing linters
#-----------------------------------------------------
echo -n "[ Eslint ]"

if command_exists eslint; then
  ln -sf $current_path/linters/eslintrc ~/.eslintrc
else
  if command_exists npm; then
    npm install -g eslint
    ln -sf $current_path/linters/eslintrc ~/dev/.eslintrc
  else
    echo "   Install node and npm, then rerun script again!"
    exit
  fi
fi

