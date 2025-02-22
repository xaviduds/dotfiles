$env.config.show_banner = false
source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu

# General
alias e = exit
alias n = nvim
def z [] { clear; ls -a | sort-by type }

# Nix-shells
alias ns = nix-shell
alias nl = nix-shell ~/lince-social/lince
alias nsl = nix-shell ~/lince-social/dev/misc/language-servers.nix
alias hl = helix ~/lince-social/dev
alias l = nix-shell ~/lince-social/dev

# Git
alias p = git push
alias gs = git switch 
alias s = git status
alias c = git commit
alias a = git add .

alias sa = bash ~/xaviduds/dotfiles/management/symlinkArch.sh
alias ia = bash ~/xaviduds/dotfiles/desktop/packages/archPackagesManagement.sh
alias h = helix
alias i = yay -S --needed --noconfirm

def reseedLince [] {prisma db push --force-reset; prisma db seed; npm run dev}

$env.BUN_INSTALL = $"($env.HOME)/.bun"
$env.PATH = ($env.PATH | append $"($env.BUN_INSTALL)/bin")
$env.EDITOR = "helix"
$env.VISUAL = "helix"
