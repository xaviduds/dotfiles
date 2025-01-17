$env.config.show_banner = false

alias e = exit
alias n = nvim
def z [] { clear; ls -a | sort-by type }
alias ns = nix-shell
alias nl = nix-shell ~/lince-social/lince
alias co = n ~/.config
alias dt = n ~/xaviduds/dotfiles
alias d = n ~/Downloads
alias symlink = sudo bash ~/xaviduds/dotfiles/management/symlink.sh
alias sim = sudo bash ~/xaviduds/dotfiles/management/symlink.sh
alias nsd = nix-shell ~/lince-social/dev/lspeace.nix
def reseedLince [] {prisma db push --force-reset; prisma db seed; npm run dev}


source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu
