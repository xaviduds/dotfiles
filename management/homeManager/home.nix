{ inputs, ... }:
{
  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];
  home = {
    username = "eduardo";
    homeDirectory = "/home/eduardo";
    stateVersion = "24.11";
    persistence."/persist/home" = {
      directories = [
        "lince-social"
      ];
      files = [
      ];
      allowOther = true;
    };
  };
}
