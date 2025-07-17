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

files="gitconfig gitignore_global gitmessage hushlogin npmrc zshrc tmux.conf"
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

dotfiles_echo "Setting up LazyVim..."

# Ensure .config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir -p "$CONFIG_DIR"
fi

# Remove old Neovim config if it exists
if [ -d "$NVIM_DIR" ] && [ ! -L "$NVIM_DIR" ]; then
  dotfiles_echo "Backing up existing Neovim config..."
  mv "$NVIM_DIR" "$NVIM_DIR.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Symlink the entire nvim config directory
dotfiles_echo "-> Linking $DOTFILES_DIR/config/nvim to $CONFIG_DIR/nvim..."
ln -nfs "$DOTFILES_DIR/config/nvim" "$CONFIG_DIR/nvim"

dotfiles_echo "Setting up Starship configuration..."
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir -p "$CONFIG_DIR"
fi
dotfiles_echo "-> Linking $DOTFILES_DIR/config/starship.toml to $CONFIG_DIR/starship.toml..."
ln -nfs "$DOTFILES_DIR"/config/starship.toml "$CONFIG_DIR"/starship.toml

dotfiles_echo "Setting up Ghostty configuration..."
if [ ! -d "$CONFIG_DIR/ghostty" ]; then
  mkdir -p "$CONFIG_DIR/ghostty"
fi
dotfiles_echo "-> Linking $DOTFILES_DIR/config/ghostty/config to $CONFIG_DIR/ghostty/config..."
ln -nfs "$DOTFILES_DIR"/config/ghostty/config "$CONFIG_DIR"/ghostty/config

# OS-specific configurations can be added here if needed


dotfiles_echo "Dotfiles installation complete!"
dotfiles_echo "Complete Brew Bundle installation with 'brew bundle install -v --global'"
