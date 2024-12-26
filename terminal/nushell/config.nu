$env.config.show_banner = false

alias e = exit
alias n = nvim
def z [] { clear; ls -a | sort-by type }
alias ns = nix-shell
alias nl = nix-shell ~/lince-social/lince
alias co = n ~/.config
alias dt = n ~/xaviduds/dotfiles
alias l = n ~/lince-social/lince
alias d = n ~/Downloads

source ~/.config/nushell/env.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu
