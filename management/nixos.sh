#!/bin/bash

# Neovim
rm -rf /home/eduardo/.config/nvim/*
cp -r /home/eduardo/xaviduds/dotfiles/editor/nvim/* /home/eduardo/.config/nvim

# # Nushell
rm -rf /home/eduardo/.config/nushell/env.nu
rm -rf /home/eduardo/.config/nushell/config.nu
cp -r /home/eduardo/xaviduds/dotfiles/terminal/nushell/* /home/eduardo/.config/nushell
