# #!/bin/bash

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

# Alacritty
rm -rf "$CONFIG_DIR/alacritty"
mkdir -p "$CONFIG_DIR/alacritty"
cat "$DOTFILES_DIR/terminal/alacritty/alacritty.toml" > "$CONFIG_DIR/alacritty/alacritty.toml"

# bashrc
# cat "$DOTFILES_DIR/terminal/bash/bashrc" > "$HOME_DIR/.bashrc"

# Emacs
rm -rf "$CONFIG_DIR/emacs"
mkdir -p "$CONFIG_DIR/emacs"
cat "$DOTFILES_DIR/editor/emacs/init.el" > "$CONFIG_DIR/emacs/init.el"
cat "$DOTFILES_DIR/editor/emacs/config.org" > "$CONFIG_DIR/emacs/config.org"

# Ghostty
rm -rf "$CONFIG_DIR/ghostty"
mkdir $CONFIG_DIR/ghostty
cat "$DOTFILES_DIR/terminal/ghostty/config" > "$CONFIG_DIR/ghostty/config"
# safe_sudo mv "$HOME_DIR/ghostty" "$CONFIG_DIR/ghostty"

# gitconfig
# cat "$DOTFILES_DIR/terminal/git/gitconfig" > "$HOME_DIR/.gitconfig"

# Copy Helix configuration
rm -rf "$CONFIG_DIR/helix"
mkdir -p "$CONFIG_DIR/helix/themes"
# cat "$DOTFILES_DIR/editor/helix/ignore" > "$HOME_DIR/.ignore"
cat "$DOTFILES_DIR/editor/helix/dark.toml" > "$CONFIG_DIR/helix/themes/dark.toml"
cat "$DOTFILES_DIR/editor/helix/config.toml" > "$CONFIG_DIR/helix/config.toml"

# Hyprland
rm -rf "$CONFIG_DIR/hypr"
mkdir -p "$CONFIG_DIR/hypr"
cat "$DOTFILES_DIR/desktop/hypr/hyprland.conf" > "$CONFIG_DIR/hypr/hyprland.conf"

# Lince
mkdir -p "$CONFIG_DIR/lince"

# Neovim
rm -rf "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/nvim"
cat "$DOTFILES_DIR/editor/nvim/init.lua" > "$CONFIG_DIR/nvim/init.lua"
rm -rf "$CONFIG_DIR/nvim/lua"
cp -r "$DOTFILES_DIR/editor/nvim/lua" "$CONFIG_DIR/nvim"

# # Nushell
rm -rf "$CONFIG_DIR/nushell"
mkdir -p "$CONFIG_DIR/nushell"
cat "$DOTFILES_DIR/terminal/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"

# Rofi
rm -rf "$CONFIG_DIR/rofi"
mkdir -p "$CONFIG_DIR/rofi"
cat "$DOTFILES_DIR/terminal/rofi/catppuccin-mocha.rasi" > "$CONFIG_DIR/rofi/catppuccin-mocha.rasi"
cat "$DOTFILES_DIR/terminal/rofi/config.rasi" > "$CONFIG_DIR/rofi/config.rasi"
cat "$DOTFILES_DIR/terminal/rofi/wallSelect.rasi" > "$CONFIG_DIR/rofi/wallSelect.rasi"


# # Starship
# cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"

# Waybar
rm -rf "$CONFIG_DIR/waybar"
mkdir -p "$CONFIG_DIR/waybar"
cat "$DOTFILES_DIR/desktop/waybar/config.json" > "$CONFIG_DIR/waybar/config"
cat "$DOTFILES_DIR/desktop/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"

chown -R "eduardo:users" "$CONFIG_DIR"
