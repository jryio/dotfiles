#! /bin/bash

# Brian Cain
#
# WHAT'S THIS? A BASH FILE WITH FUNCTIONS?
#
# A simple bash script for setting up
# an Operating System with my dotfiles

function determine_package_manager() {
  which yum > /dev/null && {
    echo "yum"
    export OSPACKMAN="yum"
    return;
  }
  which apt-get > /dev/null && {
    echo "apt-get"
    export OSPACKMAN="aptget"
    return;
  }
  which brew > /dev/null && {
    echo "homebrew"
    export OSPACKMAN="homebrew"
    return;
  }
}

# Adds a symbolic link to files in ~/.dotfiles
# to your home directory.
function symlink_files() {
  ignoredfiles=(LICENSE readme.md install.sh get-omzsh.sh osxdefaults.sh zsh-theme iterm-prefs vim-colors)

  for f in $(ls -d *); do
    if [[ ${ignoredfiles[@]} =~ $f ]]; then
      echo "Skipping $f ..."
    else
      link_file $f
    fi
  done
}

# symlink a file
# arguments: filename
function link_file(){
  echo "linking ~/.$1"
  if ! $(ln -s "$PWD/$1" "$HOME/.$1");  then
    echo "Replace file '~/.$1'?"
    read -p "[Y/n]?: " Q_REPLACE_FILE
    if [[ $Q_REPLACE_FILE != 'n' ]]; then
      replace_file $1
    fi
  fi
}

# replace file
# arguments: filename
function replace_file() {
  echo "replacing ~/.$1"
  rm -rf "$HOME/.$1"
  ln -sf "$PWD/$1" "$HOME/.$1"
}

function setup_git() {
  echo 'Setting up git config...'
  read -p 'Enter Github username: ' GIT_USER
  git config --global user.name "$GIT_USER"
  read -p 'Enter email: ' GIT_EMAIL
  git config --global user.email $GIT_EMAIL
  git config --global core.editor vim
  git config --global color.ui true
  git config --global color.diff auto
  git config --global color.status auto
  git config --global color.branch auto
}

echo -e "\n----------------------------------------------------------------\n"
echo "Setting up Operating System..."

set -e
(
  determine_package_manager

  # general package array
  declare -a packages=('vim' 'git' 'htop' 'wget' 'curl')

  if [[ $OSPACKMAN == "homebrew" ]]; then
    echo "You are running homebrew."
    echo "Using Homebrew to install packages..."
    brew update
    brew install "${packages[@]}"
    echo "Setting OS X System defaults"
    source osxdefaults.sh
  elif [[ "$OSPACKMAN" == "yum" ]]; then
    echo "You are running yum."
    echo "Using yum to install packages...."
    sudo yum update
    sudo yum install "${packages[@]}" zsh
  elif [[ "$OSPACKMAN" == "aptget" ]]; then
    echo "You are running apt-get"
    echo "Using apt-get to install packages...."
    sudo apt-get update
    sudo apt-get install "${packages[@]}" zsh
  else
    echo "Could not determine OS. Exiting..."
    exit 1
  fi

  echo -e "\n----------------------------------------------------------------\n"
  echo "Installing oh-my-zsh"
  source get-omzsh.sh
  echo "Installing dotfiles"
  symlink_files
  VUNDLEDIR=~/.vim/bundle
  if [ ! -d "$VUNDLEDIR" ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Installing powerline"
  else
    echo "Vundle is already installed"
  fi
  echo "Setting up colors..."
  mkdir -p ~/.vim/colors
  cp ~/.dotfiles/vim-colors/* ~/.vim/colors

  echo "Install Plugins for Vundle"
  vim +BundleInstall +qall
  vim +PluginInstall +qall

  echo "Changing shells to ZSH"
  chsh -s /bin/zsh

  echo -e "\n----------------------------------------------------------------\n"
  setup_git

  # clean up env vars
  unset OSPACKMAN

  echo -e "\n----------------------------------------------------------------\n"
  echo "Operating System setup complete."
  echo "Reloading session"
  exec zsh
)
