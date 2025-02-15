#!/bin/sh

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

# Alacritty
mkdir -p "$CONFIG_DIR/alacritty"
rm -rf "$CONFIG_DIR/alacritty/alacritty.toml"
cat "$DOTFILES_DIR/terminal/alacritty/alacritty.toml" > "$CONFIG_DIR/alacritty/alacritty.toml"

# Set bashrc
cat "$DOTFILES_DIR/terminal/bash/bashrc" > "$HOME_DIR/.bashrc"

# Ghostty
mkdir -p "$CONFIG_DIR/ghostty"
cat "$DOTFILES_DIR/terminal/ghostty/config" > "$CONFIG_DIR/ghostty/config"

# Set gitconfig
cat "$DOTFILES_DIR/terminal/git/gitconfig" > "$HOME_DIR/.gitconfig"

# Copy Helix configuration
mkdir -p "$CONFIG_DIR/helix/themes"
cat "$DOTFILES_DIR/editor/helix/ignore" > "$HOME_DIR/.ignore"
cat "$DOTFILES_DIR/editor/helix/themes/catppuccin_mocha.toml" > "$CONFIG_DIR/helix/themes/catppuccin_mocha.toml"
cat "$DOTFILES_DIR/editor/helix/config.toml" > "$CONFIG_DIR/helix/config.toml"
cat "$DOTFILES_DIR/editor/helix/languages.toml" > "$CONFIG_DIR/helix/languages.toml"

# Copy Hyprland configuration
mkdir -p "$CONFIG_DIR/hypr"
cat "$DOTFILES_DIR/desktop/hypr/hyprland.conf" > "$CONFIG_DIR/hypr/hyprland.conf"

# Prepare Lince directory
mkdir -p "$CONFIG_DIR/lince"

# # Nushell
mkdir -p "$CONFIG_DIR/nushell"
rm -rf "$CONFIG_DIR/nushell/env.nu"
rm -rf "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"

# Rofi
mkdir -p "$CONFIG_DIR/rofi"
rm -rf "$CONFIG_DIR/rofi/config.rasi"
rm -rf "$CONFIG_DIR/rofi/catppuccin-mocha.rasi"
cat "$DOTFILES_DIR/terminal/rofi/config.rasi" > "$CONFIG_DIR/rofi/config.rasi"
cat "$DOTFILES_DIR/terminal/rofi/catppuccin-mocha.rasi" > "$CONFIG_DIR/rofi/catppuccin-mocha.rasi"

# Starship
cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"

# Copy Waybar configuration
mkdir -p "$CONFIG_DIR/waybar"
cat "$DOTFILES_DIR/desktop/waybar/config" > "$CONFIG_DIR/waybar/config"
cat "$DOTFILES_DIR/desktop/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"
