#!/bin/sh

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

# Set bashrc
cat "$DOTFILES_DIR/terminal/bash/bashrc" > "$HOME_DIR/.bashrc"

# Copy Emacs configuration
mkdir -p "$CONFIG_DIR/emacs"
cat "$DOTFILES_DIR/editor/emacs/init.el" > "$CONFIG_DIR/emacs/init.el"
cat "$DOTFILES_DIR/editor/emacs/config.org" > "$CONFIG_DIR/emacs/config.org"

# Ghostty
mkdir -p "$CONFIG_DIR/ghostty"
cat "$DOTFILES_DIR/terminal/ghostty/config" > "$CONFIG_DIR/ghostty/config"

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
mkdir -p "$CONFIG_DIR/nvim"
rm -rf "$CONFIG_DIR/nvim/*"
cat "$DOTFILES_DIR/editor/nvim/init.lua" > "$CONFIG_DIR/nvim/init.lua"
cp -r "$DOTFILES_DIR/editor/nvim/lua" "$CONFIG_DIR/nvim/lua"

# # Nushell
mkdir -p "$CONFIG_DIR/nushell"
rm -rf "$CONFIG_DIR/nushell/env.nu"
rm -rf "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"

# Rofi
mkdir -p "$CONFIG_DIR/rofi"
cp -r "$DOTFILES_DIR/terminal/rofi" "$CONFIG_DIR/rofi"

# Starship
cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"

# Copy Waybar configuration
mkdir -p "$CONFIG_DIR/waybar"
cat "$DOTFILES_DIR/desktop/waybar/config" > "$CONFIG_DIR/waybar/config"
cat "$DOTFILES_DIR/desktop/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"
