{ pkgs, ... }:
{
  home = {
    username = "eduardo";
    homeDirectory = "/home/eduardo";
    stateVersion = "24.11";
  };
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        tailwindcss-language-server
      ];
    };
  };
}
