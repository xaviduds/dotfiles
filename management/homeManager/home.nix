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
      ".config/alacritty".source = "${dotfilesDir}/terminal/alacritty";
      # ".config/emacs".source = "${dotfilesDir}/editor/emacs";
      # ".config/helix".source = "${dotfilesDir}/editor/helix";
      # ".config/hypr".source = "${dotfilesDir}/desktop/hypr";
      # ".config/waybar".source = "${dotfilesDir}/desktop/waybar";
      ".config/starship.toml".source = "${dotfilesDir}/terminal/starship/starship.toml";
      # ".config/rofi".source = "${dotfilesDir}/terminal/rofi";
    };
    persistence."/persist/home" = {
      directories = [
        ".config/chromium"
        ".config/discord"
        ".config/ghostty"
        ".config/lince"
        ".config/nushell"
        ".config/nvim"
        ".config/Postman"
        ".local/share/DBeaverData"
        ".local/share/nvim"
        ".local/share/Smart Code ltd"
        # ".local/share/Steam"
        ".local/state/lazygit"
        ".mozilla"
        ".ssh"
        "lince-social"
        "xaviduds"
      ];
      files = [ ];
      allowOther = true;
    };
  };
}
