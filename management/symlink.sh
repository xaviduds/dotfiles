#!/bin/bash

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

# Ensure script exits on any error
# set -e


safe_sudo() {
    sudo "$@"
}

# Copy Alacritty configuration
mkdir -p "$CONFIG_DIR/alacritty"
cat "$DOTFILES_DIR/terminal/alacritty/alacritty.toml" > "$CONFIG_DIR/alacritty/alacritty.toml"

# Set bashrc
cat "$DOTFILES_DIR/terminal/bash/bashrc" > "$HOME_DIR/.bashrc"

# Copy Emacs configuration
mkdir -p "$CONFIG_DIR/emacs"
cat "$DOTFILES_DIR/editor/emacs/init.el" > "$CONFIG_DIR/emacs/init.el"
cat "$DOTFILES_DIR/editor/emacs/config.org" > "$CONFIG_DIR/emacs/config.org"

# Set gitconfig
cat "$DOTFILES_DIR/terminal/git/gitconfig" > "$HOME_DIR/.gitconfig"

# Copy Helix configuration
mkdir -p "$CONFIG_DIR/helix/themes"
cat "$DOTFILES_DIR/editor/helix/ignore" > "$HOME_DIR/.ignore"
cat "$DOTFILES_DIR/editor/helix/dark.toml" > "$CONFIG_DIR/helix/themes/dark.toml"
cat "$DOTFILES_DIR/editor/helix/config.toml" > "$CONFIG_DIR/helix/config.toml"

# Copy Hyprland configuration
mkdir -p "$CONFIG_DIR/hypr"
cat "$DOTFILES_DIR/desktop/hypr/hyprland.conf" > "$CONFIG_DIR/hypr/hyprland.conf"

# Prepare Lince directory
mkdir -p "$CONFIG_DIR/lince"

# Handle Neovim configuration
rm -rf "$CONFIG_DIR/nvim"
rm -rf "$HOME_DIR/nvim"
cp -r "$DOTFILES_DIR/editor/nvim/" "$HOME_DIR/nvim"
safe_sudo mv "$HOME_DIR/nvim" "$CONFIG_DIR/nvim"

# Nushell
mkdir -p "$CONFIG_DIR/nushell"
cat "$DOTFILES_DIR/terminal/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"

# Starship
cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"

# Copy Waybar configuration
mkdir -p "$CONFIG_DIR/waybar"
cat "$DOTFILES_DIR/desktop/waybar/waybar.json" > "$CONFIG_DIR/waybar/config"
cat "$DOTFILES_DIR/desktop/waybar/waybar.css" > "$CONFIG_DIR/waybar/style.css"

# Change ownership if necessary (for permissions)
safe_sudo chown -R "eduardo:users" "$CONFIG_DIR"

echo "Activated Rice + Dark..."
