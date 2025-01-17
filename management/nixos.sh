#!/bin/bash

# safe_sudo() {
#     sudo "$@"
# }

# Alacritty
rm -rf /home/eduardo/.config/alacritty
mkdir -p /home/eduardo/.config/alacritty
cat /home/eduardo/xaviduds/dotfiles/terminal/alacritty/alacritty.toml > /home/eduardo/.config/alacritty/alacritty.toml

# bashrc
# cat /home/eduardo/xaviduds/dotfiles/terminal/bash/bashrc > /home/eduardo/.bashrc

# Emacs
rm -rf /home/eduardo/.config/emacs
mkdir -p /home/eduardo/.config/emacs
cat /home/eduardo/xaviduds/dotfiles/editor/emacs/init.el > /home/eduardo/.config/emacs/init.el
cat /home/eduardo/xaviduds/dotfiles/editor/emacs/config.org > /home/eduardo/.config/emacs/config.org


# Ghostty
rm -rf /home/eduardo/.config/ghostty
mkdir  /home/eduardo/.config/ghostty
cat /home/eduardo/xaviduds/dotfiles/terminal/ghostty/config > /home/eduardo/.config/ghostty/config

# gitconfig
# cat /home/eduardo/xaviduds/dotfiles/terminal/git/gitconfig > /home/eduardo/.gitconfig

# Copy Helix configuration
rm -rf /home/eduardo/.config/helix
mkdir -p /home/eduardo/.config/helix/themes
# cat /home/eduardo/xaviduds/dotfiles/editor/helix/ignore > /home/eduardo/.ignore
cat /home/eduardo/xaviduds/dotfiles/editor/helix/dark.toml > /home/eduardo/.config/helix/themes/dark.toml
cat /home/eduardo/xaviduds/dotfiles/editor/helix/config.toml > /home/eduardo/.config/helix/config.toml

# Hyprland
# rm -rf /home/eduardo/.config/hypr
# mkdir -p /home/eduardo/.config/hypr
# cat /home/eduardo/xaviduds/dotfiles/desktop/hypr/hyprland.conf > /home/eduardo/.config/hypr/hyprland.conf

# Lince
mkdir -p /home/eduardo/.config/lince

# Neovim
rm -rf /home/eduardo/.config/nvim/*
cp -r /home/eduardo/xaviduds/dotfiles/editor/nvim/* /home/eduardo/.config/nvim

# # Nushell
# rm -rf /home/eduardo/.config/nushell
# mkdir -p /home/eduardo/.config/nushell
# cat /home/eduardo/xaviduds/dotfiles/terminal/nushell/config.nu > /home/eduardo/.config/nushell/config.nu
# cat /home/eduardo/xaviduds/dotfiles/terminal/nushell/env.nu > /home/eduardo/.config/nushell/env.nu

# Rofi
rm -rf /home/eduardo/.config/rofi
mkdir -p /home/eduardo/.config/rofi
cat /home/eduardo/xaviduds/dotfiles/terminal/rofi/catppuccin-mocha.rasi > /home/eduardo/.config/rofi/catppuccin-mocha.rasi
cat /home/eduardo/xaviduds/dotfiles/terminal/rofi/config.rasi > /home/eduardo/.config/rofi/config.rasi
cat /home/eduardo/xaviduds/dotfiles/terminal/rofi/wallSelect.rasi > /home/eduardo/.config/rofi/wallSelect.rasi

# # Starship
# cat /home/eduardo/xaviduds/dotfiles/terminal/starship/starship.toml > /home/eduardo/.config/starship.toml

# Waybar
rm -rf /home/eduardo/.config/waybar
mkdir -p /home/eduardo/.config/waybar
cat /home/eduardo/xaviduds/dotfiles/desktop/waybar/config > /home/eduardo/.config/waybar/config
cat /home/eduardo/xaviduds/dotfiles/desktop/waybar/style.css > /home/eduardo/.config/waybar/style.css

# chown -R eduardo:users /home/eduardo/.config
