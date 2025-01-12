{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 2;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
