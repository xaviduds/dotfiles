#!/bin/sh

THIS_REPO="/home/eduardo/xaviduds/dotfiles"
DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles/packages"
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
    cat "$DOTFILES_DIR/ghostty/config" > "$CONFIG_DIR/ghostty/config"
    
    cat "$DOTFILES_DIR/git/gitconfig" > "$HOME_DIR/.gitconfig"
    
    mkdir -p "$CONFIG_DIR/helix/themes"
    cat "$DOTFILES_DIR/helix/ignore" > "$HOME_DIR/.ignore"
    cat "$DOTFILES_DIR/helix/themes/catppuccin_mocha.toml" > "$CONFIG_DIR/helix/themes/catppuccin_mocha.toml"
    cat "$DOTFILES_DIR/helix/config.toml" > "$CONFIG_DIR/helix/config.toml"
    cat "$DOTFILES_DIR/helix/languages.toml" > "$CONFIG_DIR/helix/languages.toml"
    
    mkdir -p "$CONFIG_DIR/hypr"
    cat "$DOTFILES_DIR/hypr/hyprland.conf" > "$CONFIG_DIR/hypr/hyprland.conf"
    
    mkdir -p "$CONFIG_DIR/lince"
    
    mkdir -p "$CONFIG_DIR/nushell"
    rm -rf "$CONFIG_DIR/nushell/env.nu"
    rm -rf "$CONFIG_DIR/nushell/config.nu"
    cat "$DOTFILES_DIR/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
    cat "$DOTFILES_DIR/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"
    
    cat "$DOTFILES_DIR/starship/starship.toml" > "$CONFIG_DIR/starship.toml"
    
    mkdir -p "$CONFIG_DIR/waybar"
    cat "$DOTFILES_DIR/waybar/config" > "$CONFIG_DIR/waybar/config"
    cat "$DOTFILES_DIR/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"
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
    FILE="$THIS_REPO/distros/arch/packages"
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
