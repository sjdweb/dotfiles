#!/usr/bin/env bash

################################################################################
# install
#
# This script symlinks the dotfiles into place in the home directory.
################################################################################

dotfiles_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n[DOTFILES] $fmt\n" "$@"
}

set -e # Terminate script if anything exits with a non-zero value

files="gitconfig gitignore_global gitmessage hushlogin npmrc zshrc vimrc tmux.conf"
CONFIG_DIR=$HOME/.config
DOTFILES_DIR=$HOME/dotfiles
VIM_DIR=$DOTFILES_DIR/vim
NVIM_DIR=$CONFIG_DIR/nvim

dotfiles_echo "Installing dotfiles..."

for file in $files; do
  if [ -f "$HOME/.$file" ]; then
    dotfiles_echo ".$file already present. Backing up..."
    cp "$HOME/.$file" "$HOME/.${file}_backup"
    rm -f "$HOME/.$file"
  fi
  dotfiles_echo "-> Linking $DOTFILES_DIR/$file to $HOME/.$file..."
  ln -nfs "$DOTFILES_DIR/$file" "$HOME/.$file"
done

dotfiles_echo "Setting up Vim and Neovim..."

if [ ! -d "$VIM_DIR" ]; then
  mkdir -p "$VIM_DIR"
fi

if [ ! -d "$NVIM_DIR" ]; then
  mkdir -p "$NVIM_DIR"
fi

dotfiles_echo "-> Linking $DOTFILES_DIR/init.vim to $NVIM_DIR/init.vim..."
ln -nfs "$DOTFILES_DIR"/init.vim "$NVIM_DIR"/init.vim

dotfiles_echo "-> Linking $DOTFILES_DIR/coc-settings.json to $NVIM_DIR/coc-settings.json..."
ln -nfs "$DOTFILES_DIR"/coc-settings.json "$NVIM_DIR"/coc-settings.json

if [[ "$OSTYPE" == "darwin"* ]]; then
  dotfiles_echo "Detected Darwin, adding OS specific links"
  # Sublime Text 3
  if [ -d "$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User" ]; then
    dotfiles_echo "Sublime Text 3 User dir already present. Backing up..."
    mv $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User.bk
  fi
  if [ -d "$HOME/Library/Application\ Support/Sublime\ Text\ 3" ]; then
    rm -f $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User 
    dotfiles_echo "-> Linking $DOTFILES_DIR/sublime/User/ to $HOME/Application Support/Sublime Text 3/Packages/User"
    ln -s $DOTFILES_DIR/sublime/User $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
  fi

  # VSCode
  if [ -d "$HOME/Library/Application\ Support/Code/User" ]; then
    dotfiles_echo "VS Code User dir already present. Backing up..."
    mv $HOME/Library/Application\ Support/Code/User $HOME/Library/Application\ Support/Code/User.bk
  fi
  if [ -d "$HOME/Library/Application\ Support/Code" ]; then
    rm -f $HOME/Library/Application\ Support/Code/User 
    dotfiles_echo "-> Linking $DOTFILES_DIR/vscode/User/ to $HOME/Application Support/Code/User"
    ln -s $DOTFILES_DIR/vscode/User $HOME/Library/Application\ Support/Code/User
  fi
fi


dotfiles_echo "Dotfiles installation complete!"
dotfiles_echo "Complete Brew Bundle installation with 'brew bundle install -v --global'"
