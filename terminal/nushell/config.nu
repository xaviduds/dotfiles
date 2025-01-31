$env.config.show_banner = false
source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu

alias e = exit
alias n = nvim
def z [] { clear; ls -a | sort-by type }
alias ns = nix-shell
alias nl = nix-shell ~/lince-social/lince
alias nsl = nix-shell ~/lince-social/dev/misc/language-servers.nix
alias nsd = nix-shell ~/lince-social/dev

def reseedLince [] {prisma db push --force-reset; prisma db seed; npm run dev}

$env.BUN_INSTALL = $"($env.HOME)/.bun"
$env.PATH = ($env.PATH | append $"($env.BUN_INSTALL)/bin")
