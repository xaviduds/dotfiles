$env.config.show_banner = false

alias e = exit
alias n = nvim
def z [] { clear; ls -a | sort-by type }
alias ns = nix-shell
alias nl = nix-shell ~/lince-social/lince
alias co = n ~/.config
alias dt = n ~/xaviduds/dotfiles
alias d = n ~/Downloads
alias archsym = sudo bash ~/xaviduds/dotfiles/management/arch.sh
alias nixsym = sudo bash ~/xaviduds/dotfiles/management/nixos.sh
def reseedLince [] {prisma db push --force-reset; prisma db seed; npm run dev}

source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu
