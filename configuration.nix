{ ... }:
{
  imports = [
    ./desktop/hardware/hardware-configuration.nix
    ./desktop/hardware/hardware.nix
    ./desktop/boot/boot.nix
    #./desktop/impermanence/impermanence.nix
    ./desktop/misc/fonts.nix
    ./desktop/misc/keymap.nix
    ./desktop/misc/locale.nix
    ./desktop/misc/security.nix
    ./desktop/misc/time.nix
    ./desktop/network/network.nix
    ./desktop/nix/nix.nix
    ./desktop/packages/nixpkgs.nix
    ./desktop/packages/pkgs.nix
    ./desktop/packages/programs.nix
    ./desktop/services/services.nix
    ./desktop/system/system.nix
    ./desktop/users/eduardo.nix
    #./management/homeManager/homeManager.nix
  ];
}
