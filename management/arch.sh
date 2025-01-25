#!/bin/sh

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

bash "$DOTFILES_DIR/desktop/packages/yay.sh"
bash "$DOTFILES_DIR/management/symlinkArch.sh"
bash "$DOTFILES_DIR/terminal/ssh/archSsh.sh"
bash "$DOTFILES_DIR/desktop/services/arch.sh"
bash "$DOTFILES_DIR/desktop/nix/archNix.sh"
bash "$DOTFILES_DIR/desktop/impermanence/arch.sh"
bash "$DOTFILES_DIR/management/gitCloning.sh"
bash "$DOTFILES_DIR/desktop/packages/archPackagesManagement.sh"
# bash "$DOTFILES_DIR/"
# bash "$DOTFILES_DIR/"
# bash "$DOTFILES_DIR/"


