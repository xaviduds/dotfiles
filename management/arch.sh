#!/bin/sh

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

## install_yay
if ! command -v yay &>/dev/null; then
    echo "yay is not installed. Installing yay..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si
    cd ..
    rm -rf yay
    echo "yay has been successfully installed."
else
    echo "yay is already installed."
fi

## cat_dotfiles
# Ghostty
mkdir -p "$CONFIG_DIR/ghostty"
cat "$DOTFILES_DIR/terminal/ghostty/config" >"$CONFIG_DIR/ghostty/config"

# Set gitconfig
cat "$DOTFILES_DIR/terminal/git/gitconfig" >"$HOME_DIR/.gitconfig"

# Copy Helix configuration
mkdir -p "$CONFIG_DIR/helix/themes"
cat "$DOTFILES_DIR/editor/helix/ignore" >"$HOME_DIR/.ignore"
cat "$DOTFILES_DIR/editor/helix/themes/catppuccin_mocha.toml" >"$CONFIG_DIR/helix/themes/catppuccin_mocha.toml"
cat "$DOTFILES_DIR/editor/helix/config.toml" >"$CONFIG_DIR/helix/config.toml"
cat "$DOTFILES_DIR/editor/helix/languages.toml" >"$CONFIG_DIR/helix/languages.toml"

# Copy Hyprland configuration
mkdir -p "$CONFIG_DIR/hypr"
cat "$DOTFILES_DIR/desktop/hypr/hyprland.conf" >"$CONFIG_DIR/hypr/hyprland.conf"

# Prepare Lince directory
mkdir -p "$CONFIG_DIR/lince"

# # Nushell
mkdir -p "$CONFIG_DIR/nushell"
rm -rf "$CONFIG_DIR/nushell/env.nu"
rm -rf "$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/config.nu" >"$CONFIG_DIR/nushell/config.nu"
cat "$DOTFILES_DIR/terminal/nushell/env.nu" >"$CONFIG_DIR/nushell/env.nu"

# Starship
cat "$DOTFILES_DIR/terminal/starship/starship.toml" >"$CONFIG_DIR/starship.toml"

# Copy Waybar configuration
mkdir -p "$CONFIG_DIR/waybar"
cat "$DOTFILES_DIR/desktop/waybar/config" >"$CONFIG_DIR/waybar/config"
cat "$DOTFILES_DIR/desktop/waybar/style.css" >"$CONFIG_DIR/waybar/style.css"

## configure_daemons
sudo pacman -S openssh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

# Nix
systemctl enable nix-daemon.service

# Wake On Lan (WOL)
SERVICE_FILE="/etc/systemd/system/wol.service"

# Create the WOL service file
cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Enable Wake-on-LAN
After=network.target

[Service]
Type=oneshot
ExecStart=/sbin/ethtool -s enp2s0 wol g

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to recognize the new service
echo "Reloading systemd configuration..."
systemctl daemon-reload

# Enable the WOL service to start at boot
echo "Enabling WOL service..."
systemctl enable wol.service

# Start the service immediately to apply WOL settings now
echo "Starting WOL service..."
systemctl start wol.service

echo "WOL setup complete. Service file created at $SERVICE_FILE"


## Install_Nix
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

## Impermanence
 
DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

rm -rf "$HOME_DIR/Downloads"

## clone_git_repos

HOME_DIR="/home/eduardo"

# List of repositories to check and clone
REPOS="lince-social/lince xaviduds/dotfiles xaviduds/lince"

for REPO in $REPOS; do
    # Extract the owner and repository name
    OWNER=$(dirname "$REPO")
    REPO_NAME=$(basename "$REPO")
    
    # Full path to the owner directory
    OWNER_DIR="$HOME_DIR/$OWNER"
    
    # Full path to the repository directory
    REPO_DIR="$OWNER_DIR/$REPO_NAME"
    
    # Create the owner directory if it doesn't exist
    if [ ! -d "$OWNER_DIR" ]; then
        echo "Creating owner directory: $OWNER_DIR"
        mkdir -p "$OWNER_DIR"
    fi
    
    # Check if the repository directory exists
    if [ ! -d "$REPO_DIR" ]; then
        # If it doesn't exist, clone the repository
        echo "Cloning $REPO into $REPO_DIR..."
        git clone "git@github.com:$REPO.git" "$REPO_DIR"
    else
        # If it exists, notify the user
        echo "$REPO_DIR already exists. Skipping..."
    fi
done


## manage_packages

FILE="/home/eduardo/xaviduds/dotfiles/desktop/packages/archPackages.txt"

# Function to tidy the file (sort and remove duplicates)
tidy_file() {
    if [[ -f "$FILE" ]]; then
        sort -u "$FILE" -o "$FILE"
    fi
}

# Function to display the menu
show_menu() {
    echo "===================================="
    echo " Arch Linux Package Manager Helper  "
    echo "===================================="
    echo "a. Add a package, install all needed"
    echo "r. Remove a package"
    echo "0. Exit"
    echo "===================================="
}

# Function to add a package (or multiple packages)

remove_package() {
    echo "Enter the package name(s) to remove (separated by spaces):"
    read -r package_input

    # Split the input into individual packages
    IFS=' ' read -r -a packages <<< "$package_input"

    for package in "${packages[@]}"; do
        if grep -Fxq "$package" "$FILE"; then
            sed -i "/^$package$/d" "$FILE"
            echo "Package '$package' removed from the list."
            yay -Rs "$package" --noconfirm
        else
            echo "Package '$package' not found in the list."
        fi
    done
    sleep 2
}

# Function to list packages
list_packages() {
    if [[ -f "$FILE" ]]; then
        sorted_packages=$(sort "$FILE" | tr '\n' ' ')
        echo "$sorted_packages"
    else
        echo "No packages found in $FILE."
    fi
}

# Function to install packages
install_packages() {
    if [[ ! -f "$FILE" ]]; then
        echo "Error: $FILE not found!"
        sleep 2
        return
    fi

    echo "Installing packages from $FILE..."
    yay -S --noconfirm --needed - < "$FILE"
    echo "Press enter to continue..."
    read -r
}

add_package() {
    echo "Enter the package name(s) to add (separated by spaces):"
    read -r package_input

    # Split the input into individual packages
    IFS=' ' read -r -a packages <<< "$package_input"

    for package in "${packages[@]}"; do
        if grep -Fxq "$package" "$FILE"; then
            echo "Package '$package' already exists in the list."
        else
            echo "$package" >> "$FILE"
            echo "Package '$package' added to the list."
        fi
    done
    sleep 2
    install_packages
}


# Function to check explicitly installed packages
check_explicit_packages() {
    echo "Checking explicitly installed packages..."
    pacman -Qqe >> "$FILE"  # Append instead of overwrite
}

# Function to delete orphan packages
delete_orphans() {
    echo "Deleting orphan packages..."
    sudo pacman -Rns $(pacman -Qdtq)
}

# Main loop
while true; do
    # Update the package list and remove orphans
    check_explicit_packages
    delete_orphans

    # Tidy the file (sort and remove duplicates)
    tidy_file

    # Clear the screen and show the current packages
    clear
    list_packages
    echo ""

    # Show the menu
    show_menu

    # Get user input
    read -r choice

    case $choice in
        a) add_package ;;
        r) remove_package ;;
        0) exit 0 ;;
        *) echo "Invalid option. Press Enter to continue..." ;;
    esac
done


#!/bin/sh

DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
CONFIG_DIR="/home/eduardo/.config"
HOME_DIR="/home/eduardo"

install_yay() {
    if ! command -v yay &>/dev/null; then
        echo "yay is not installed. Installing yay..."
        sudo pacman -S --needed base-devel git
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay
        makepkg -si
        cd ..
        rm -rf yay
        echo "yay has been successfully installed."
    else
        echo "yay is already installed."
    fi
}

cat_dotfiles() {
    mkdir -p "$CONFIG_DIR/ghostty"
    cat "$DOTFILES_DIR/terminal/ghostty/config" > "$CONFIG_DIR/ghostty/config"
    
    cat "$DOTFILES_DIR/terminal/git/gitconfig" > "$HOME_DIR/.gitconfig"
    
    mkdir -p "$CONFIG_DIR/helix/themes"
    cat "$DOTFILES_DIR/editor/helix/ignore" > "$HOME_DIR/.ignore"
    cat "$DOTFILES_DIR/editor/helix/themes/catppuccin_mocha.toml" > "$CONFIG_DIR/helix/themes/catppuccin_mocha.toml"
    cat "$DOTFILES_DIR/editor/helix/config.toml" > "$CONFIG_DIR/helix/config.toml"
    cat "$DOTFILES_DIR/editor/helix/languages.toml" > "$CONFIG_DIR/helix/languages.toml"
    
    mkdir -p "$CONFIG_DIR/hypr"
    cat "$DOTFILES_DIR/desktop/hypr/hyprland.conf" > "$CONFIG_DIR/hypr/hyprland.conf"
    
    mkdir -p "$CONFIG_DIR/lince"
    
    mkdir -p "$CONFIG_DIR/nushell"
    rm -rf "$CONFIG_DIR/nushell/env.nu"
    rm -rf "$CONFIG_DIR/nushell/config.nu"
    cat "$DOTFILES_DIR/terminal/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
    cat "$DOTFILES_DIR/terminal/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"
    
    cat "$DOTFILES_DIR/terminal/starship/starship.toml" > "$CONFIG_DIR/starship.toml"
    
    mkdir -p "$CONFIG_DIR/waybar"
    cat "$DOTFILES_DIR/desktop/waybar/config" > "$CONFIG_DIR/waybar/config"
    cat "$DOTFILES_DIR/desktop/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"
}

configure_daemons() {
    sudo pacman -S openssh
    sudo systemctl enable sshd.service
    sudo systemctl start sshd.service
    systemctl enable nix-daemon.service
    
    SERVICE_FILE="/etc/systemd/system/wol.service"
    cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Enable Wake-on-LAN
After=network.target

[Service]
Type=oneshot
ExecStart=/sbin/ethtool -s enp2s0 wol g

[Install]
WantedBy=multi-user.target
EOF
    
    systemctl daemon-reload
    systemctl enable wol.service
    systemctl start wol.service
}

install_nix() {
    yay -S nix
    sudo systemctl enable --now nix-daemon.service
    sudo gpasswd -a $USER nix-users
    
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
    nix-channel --update
    
    export NIX_PATH=nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs
    nix_conf="/etc/nix/nix.conf"
    
    if [[ ! -f "$nix_conf" ]]; then
        sudo touch "$nix_conf"
    fi
    
    temp_file=$(mktemp)
    grep -v "max-jobs" "$nix_conf" > "$temp_file"
    echo "max-jobs = auto" >> "$temp_file"
    sudo mv "$temp_file" "$nix_conf"
}

impermanence() {
    rm -rf "$HOME_DIR/Downloads"
}

clone_git_repos() {
    REPOS="lince-social/lince xaviduds/dotfiles xaviduds/lince"
    for REPO in $REPOS; do
        OWNER=$(dirname "$REPO")
        REPO_NAME=$(basename "$REPO")
        OWNER_DIR="$HOME_DIR/$OWNER"
        REPO_DIR="$OWNER_DIR/$REPO_NAME"
        mkdir -p "$OWNER_DIR"
        if [ ! -d "$REPO_DIR" ]; then
            git clone "git@github.com:$REPO.git" "$REPO_DIR"
        fi
    done
}

manage_packages() {
    FILE="$DOTFILES_DIR/desktop/packages/archPackages.txt"
    tidy_file() { sort -u "$FILE" -o "$FILE"; }
    install_packages() { yay -S --noconfirm --needed - < "$FILE"; }
    check_explicit_packages() { pacman -Qqe >> "$FILE"; }
    delete_orphans() { sudo pacman -Rns $(pacman -Qdtq); }
    
    check_explicit_packages
    delete_orphans
    tidy_file
    install_packages
}

main() {
    case "$1" in
        -i) manage_packages ;;
        -s) cat_dotfiles ;;
        *) install_yay && cat_dotfiles && configure_daemons && install_nix && impermanence && clone_git_repos && manage_packages ;;
    esac
}

main "$@"

