#!/bin/bash

# Old way
# sudo pacman -S --needed git base-devel
# git clone https://aur.archlinux.org/yay-bin.git
# cd yay-bin
# makepkg -si
# rm -rf yay-bin

# New way, cooler way. Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Installing yay..."

    # Install dependencies required for building yay
    sudo pacman -S --needed base-devel git

    # Clone the yay repository
    git clone https://aur.archlinux.org/yay.git /tmp/yay

    # Navigate to the yay directory
    cd /tmp/yay

    # Build and install yay
    makepkg -si

    # Clean up the temporary directory
    cd ..
    rm -rf yay

    echo "yay has been successfully installed."
else
    echo "yay is already installed."
fi
