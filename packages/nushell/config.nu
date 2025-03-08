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

# Nixos

# Arch
alias i = yay -S --needed --noconfirm
alias sa = bash ~/xaviduds/dotfiles/packages/lince/os.sh -s
alias ia = bash ~/xaviduds/dotfiles/packages/lince/os.sh -i
