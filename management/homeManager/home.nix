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
    
    # Files to symlink using home.file
    file = {
      ".ignore".source = "${dotfilesDir}/editor/helix/ignore";
      ".bashrc".source = "${dotfilesDir}/terminal/bash/bashrc";
      ".gitconfig".source = "${dotfilesDir}/terminal/git/gitconfig";
      ".config/alacritty".source = "${dotfilesDir}/terminal/alacritty";
      ".config/emacs".source = "${dotfilesDir}/editor/emacs";
      ".config/helix".source = "${dotfilesDir}/editor/helix";
      ".config/hypr".source = "${dotfilesDir}/desktop/hypr";
      ".config/waybar".source = "${dotfilesDir}/desktop/waybar";
      ".config/starship.toml".source = "${dotfilesDir}/terminal/starship/starship.toml";
      # ".config/ghostty".source = "${dotfilesDir}/terminal/ghostty";
      ".config/rofi".source = "${dotfilesDir}/terminal/rofi";
    };
  persistence."/persist/home" = {
    directories = [
      "lince-social"
      ".config/lince"
      "xaviduds"
      ".config/nvim"
      ".local/share/nvim"
      ".config/nushell"
      ".ssh"
      ".mozilla"
      # ".config/ghostty"
    ];
    files = [];
    allowOther = true;
};
  };
}

