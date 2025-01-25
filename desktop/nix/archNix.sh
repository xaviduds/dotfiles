#!/usr/bin/env bash

# Install Nix
yay -S nix
sudo systemctl enable --now nix-daemon.service
sudo gpasswd -a $USER nix-users

# Add the nixpkgs channel
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Set the NIX_PATH environment variable
export NIX_PATH=nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs

# Hardcoded path to the Nix configuration file
nix_conf="/etc/nix/nix.conf"

# Ensure the file exists
if [[ ! -f "$nix_conf" ]]; then
  echo "Creating $nix_conf..."
  sudo touch "$nix_conf"
fi

# Create a temporary file
temp_file=$(mktemp)

# Process the file
grep -v "max-jobs" "$nix_conf" > "$temp_file" # Remove lines containing 'max-jobs'
echo "max-jobs = auto" >> "$temp_file"        # Append 'max-jobs=auto'

# Replace the original file with the modified file
sudo mv "$temp_file" "$nix_conf"

echo "Nix configuration file updated successfully: $nix_conf"

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
