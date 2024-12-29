To install, run on the terminal after iso boot:
```bash
git clone https://github.com/xaviduds/dotfiles

mkdir xaviduds && mv dotfiles/ xaviduds/

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ~/xaviduds/dotfiles/management/disko.nix --arg device '"/dev/nvme0n1"'

sudo nixos-generate-config --no-filesystems --root /mnt

cd && sudo cp -r ~/xaviduds/dotfiles ./

sudo mv dotfiles/* /mnt/etc/nixos

sudo mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/desktop/hardware

# Comment home.file
sudo nano /mnt/persist/etc/nixos/management/homeManager/home.nix

sudo nixos-install --root /mnt --flake /mnt/etc/nixos#default --impure

cd && sudo mv ./xaviduds /mnt/persist && reboot
```

To configure, after reboot:
```bash
mv /persist/xaviduds/dotfiles ~/xaviduds/
```
I think this works haha
