{ pkgs, ... }:
{
  users.users.eduardo = {
    isNormalUser = true;
    description = "eduardo";
    initialPassword = "1";
    extraGroups = [
      "audio"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };
}
