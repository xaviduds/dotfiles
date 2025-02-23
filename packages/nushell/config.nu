$env.config.show_banner = false
$env.EDITOR = "helix"
$env.VISUAL = "helix"
source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu

# General
alias e = exit
alias h = helix
def z [] { clear; ls -a | sort-by type }

# Git
alias s = git status

# Nix-shells
alias ns = nix-shell
alias hl = helix ~/lince-social/dev

# Nixos

# Arch
alias i = yay -S --needed --noconfirm
alias sa = bash ~/xaviduds/dotfiles/distros/arch/arch.sh -s
alias ia = bash ~/xaviduds/dotfiles/distros/arch/arch.sh -i
