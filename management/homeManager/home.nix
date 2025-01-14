{ inputs, ... }:

let
  dotfilesDir = "/home/eduardo/xaviduds/dotfiles";
in

{
  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];
  home = {
    username = "eduardo";
    homeDirectory = "/home/eduardo";
    stateVersion = "24.11";
    file = {
      ".ignore".source = "${dotfilesDir}/editor/helix/ignore";
      ".bashrc".source = "${dotfilesDir}/terminal/bash/bashrc";
      ".gitconfig".source = "${dotfilesDir}/terminal/git/gitconfig";
      ".config/starship.toml".source = "${dotfilesDir}/terminal/starship/starship.toml";
      ".config/alacritty".source = "${dotfilesDir}/terminal/alacritty";
      ".config/rofi".source = "${dotfilesDir}/terminal/rofi";
      ".config/emacs".source = "${dotfilesDir}/editor/emacs";
      ".config/helix".source = "${dotfilesDir}/editor/helix";
      ".config/waybar".source = "${dotfilesDir}/desktop/waybar";
      ".config/ghostty".source = "${dotfilesDir}/terminal/ghostty";
      ".config/hypr".source = "${dotfilesDir}/desktop/hypr";
    };
    persistence."/persist/home" = {
      directories = [
        ".config/chromium"
        ".config/discord"
        ".config/lince"
        ".config/nushell"
        ".config/nvim"
        ".local/share/nvim"
        ".local/share/Smart Code ltd"
        ".local/state/lazygit"
        ".mozilla"
        ".ssh"
        "lince-social"
        "other"
        "xaviduds"
        ".config/Postman"
        ".local/share/DBeaverData"
        # ".local/share/Steam"
      ];
      files = [ ];
      allowOther = true;
    };
  };
}
