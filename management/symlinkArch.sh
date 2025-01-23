#!/bin/sh

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

# Copy Alacritty configuration
mkdir -p "$CONFIG_DIR/alacritty"
cat "$DOTFILES_DIR/terminal/alacritty/alacritty.toml" > "$CONFIG_DIR/alacritty/alacritty.toml"

# Set bashrc
cat "$DOTFILES_DIR/terminal/bash/bashrc" > "$HOME_DIR/.bashrc"

# Copy Emacs configuration
mkdir -p "$CONFIG_DIR/emacs"
cat "$DOTFILES_DIR/editor/emacs/init.el" > "$CONFIG_DIR/emacs/init.el"
cat "$DOTFILES_DIR/editor/emacs/config.org" > "$CONFIG_DIR/emacs/config.org"

# Ghostty
mkdir -p "$CONFIG_DIR/ghostty"
cp -r "$DOTFILES_DIR/terminal/ghostty/*" "$CONFIG_DIR/ghostty"

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

# Neovim
mkdir -p /home/eduardo/.config/nvim
rm -rf /home/eduardo/.config/nvim/*
cp -r /home/eduardo/xaviduds/dotfiles/editor/nvim/* /home/eduardo/.config/nvim

# # Nushell
mkdir -p /home/eduardo/.config/nushell
rm -rf /home/eduardo/.config/nushell/env.nu
rm -rf /home/eduardo/.config/nushell/config.nu
cp -r /home/eduardo/xaviduds/dotfiles/terminal/nushell/* /home/eduardo/.config/nushell

# Rofi
mkdir -p "$CONFIG_DIR/rofi"
cp -r "$DOTFILES_DIR/terminal/rofi" "$CONFIG_DIR/rofi"


# Starship
cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"

# Copy Waybar configuration
mkdir -p "$CONFIG_DIR/waybar"
cat "$DOTFILES_DIR/desktop/waybar/config" > "$CONFIG_DIR/waybar/config"
cat "$DOTFILES_DIR/desktop/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"
