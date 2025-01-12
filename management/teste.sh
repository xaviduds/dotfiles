#!/bin/bash

rm -rf ~/.config/waybar/
mkdir ~/.config/waybar/

cat /home/eduardo/xaviduds/dotfiles/desktop/waybar/config.json > /home/eduardo/.config/waybar/config
cat /home/eduardo/xaviduds/dotfiles/desktop/waybar/style.css > /home/eduardo/.config/waybar/style.css
