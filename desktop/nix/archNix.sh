#!/usr/bin/env bash

yay -S nix
sudo systemctl enable nix-daemon.service
sudo gpasswd -a $USER nix-users

# Check if the file is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Assign the file to a variable
file="$1"

# Check if the file exists
if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' not found!"
  exit 1
fi

# Create a temporary file
temp_file=$(mktemp)

# Process the file
grep -v "max-jobs" "$file" > "$temp_file" # Remove lines containing 'max-jobs'
echo "max-jobs = auto" >> "$temp_file"      # Append 'max-jobs=auto'

# Replace the original file with the modified file
mv "$temp_file" "$file"

echo "File updated successfully!"

nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

