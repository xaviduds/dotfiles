# #!/bin/bash

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

# bashrc
cat "$DOTFILES_DIR/terminal/bash/bashrc" > "$HOME_DIR/.bashrc"

# gitconfig
cat "$DOTFILES_DIR/terminal/git/gitconfig" > "$HOME_DIR/.gitconfig"

# Starship
cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"
