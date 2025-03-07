#!/bin/sh

sudo pacman -Sc
sudo pacman -R $(pacman -Qtdq)
nix-collect-garbage
