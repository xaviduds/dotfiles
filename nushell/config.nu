$env.BUN_INSTALL = $"($env.HOME)/.bun"
$env.RUSTLINGS_INSTALL = $"($env.HOME)/.cargo"
$env.PATH = ($env.PATH | append $"($env.BUN_INSTALL)/bin" | append $"($env.RUSTLINGS_INSTALL)/bin")
$env.config.show_banner = false
$env.EDITOR = "helix"
$env.VISUAL = "helix"
source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu

# General
alias e = exit
alias h = helix
alias y = yazi
def z [] { clear; ls -a | sort-by type }

# Git
alias s = git status
alias p = git push
alias gs = git switch
alias gf = git fetch
alias gp = git pull

# Nix-shells
alias ns = nix-shell
alias hl = helix ~/lince-social/dev

# Rust
alias r = cargo run

# Arch
alias i = yay -S --needed --noconfirm
alias sa = bash ~/xaviduds/dotfiles/lince/os.sh -s
alias ia = bash ~/xaviduds/dotfiles/lince/os.sh -i

# def manage_packages [] {
#     pacman -Qqe >>"/home/eduardo/xaviduds/dotfiles/lince/packages"
#     sudo pacman -Rns $(pacman -Qdtq)
#     sort -u "/home/eduardo/xaviduds/dotfiles/packages" -o "/home/eduardo/xaviduds/dotfiles/packages"
#     yay -S --noconfirm --needed - <"/home/eduardo/xaviduds/dotfiles/packages"
# }
#
# clean arch:
# sudo pacman -Sc
# sudo pacman -R $(pacman -Qtdq)
# nix-collect-garbage

# def install_yay [] {
#   sudo pacman -S --needed git base-devel
# git clone https://aur.archlinux.org/yay-bin.git
# cd yay-bin
# makepkg -si
# }
# sudo usermod -aG docker $USER
#
#

# #!/bin/sh

# DOTFILES_DIR="/home/eduardo/xaviduds/dotfiles"
# # CONFIG_DIR="/home/eduardo/.config"
# # HOME_DIR="/home/eduardo"

# #     mkdir -p "$CONFIG_DIR/ghostty"
# #     cat "$DOTFILES_DIR/ghostty/config" > "$CONFIG_DIR/ghostty/config"
    
# #     cat "$DOTFILES_DIR/git/.gitconfig" > "$HOME_DIR/.gitconfig"
    
# #     mkdir -p "$CONFIG_DIR/helix/themes"
# #     cat "$DOTFILES_DIR/helix/.ignore" > "$HOME_DIR/.ignore"
# #     cat "$DOTFILES_DIR/helix/themes/catppuccin_mocha.toml" > "$CONFIG_DIR/helix/themes/catppuccin_mocha.toml"
# #     cat "$DOTFILES_DIR/helix/config.toml" > "$CONFIG_DIR/helix/config.toml"
# #     cat "$DOTFILES_DIR/helix/languages.toml" > "$CONFIG_DIR/helix/languages.toml"
    
# #     mkdir -p "$CONFIG_DIR/hypr"
# #     cat "$DOTFILES_DIR/hypr/hyprland.conf" > "$CONFIG_DIR/hypr/hyprland.conf"
    
# #     mkdir -p "$CONFIG_DIR/lince"
    
# #     mkdir -p "$CONFIG_DIR/nushell"
# #     rm -rf "$CONFIG_DIR/nushell/env.nu"
# #     rm -rf "$CONFIG_DIR/nushell/config.nu"
# #     cat "$DOTFILES_DIR/nushell/config.nu" > "$CONFIG_DIR/nushell/config.nu"
# #     cat "$DOTFILES_DIR/nushell/env.nu" > "$CONFIG_DIR/nushell/env.nu"
    
# #     cat "$DOTFILES_DIR/starship/starship.toml" > "$CONFIG_DIR/starship.toml"
    
# #     mkdir -p "$CONFIG_DIR/waybar"
# #     cat "$DOTFILES_DIR/waybar/config" > "$CONFIG_DIR/waybar/config"
# #     cat "$DOTFILES_DIR/waybar/style.css" > "$CONFIG_DIR/waybar/style.css"

# #     mkdir -p "$CONFIG_DIR/yazi"
# #     cat "$DOTFILES_DIR/yazi/yazi.toml" > "$CONFIG_DIR/yazi/yazi.toml"
# #     cat "$DOTFILES_DIR/yazi/keymap.toml" > "$CONFIG_DIR/yazi/keymap.toml"

#     PACKAGES="$DOTFILES_DIR/lince/packages"
#     pacman -Qqe >>"$PACKAGES"
#     sudo pacman -Rns $(pacman -Qdtq)
#     sort -u "$PACKAGES" -o "$PACKAGES"
#     yay -S --noconfirm --needed - <"$PACKAGES"
