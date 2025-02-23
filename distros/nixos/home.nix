{ inputs, ... }:

let dotfilesDir = "/home/eduardo/xaviduds/dotfiles/packages";

in {
  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];
  home = {
    username = "eduardo";
    homeDirectory = "/home/eduardo";
    stateVersion = "24.11";
    file = {
      ".config/waybar".source = "${dotfilesDir}/waybar";
      ".config/hypr".source = "${dotfilesDir}/hypr";
      ".config/ghostty".source = "${dotfilesDir}/ghostty";
      ".config/starship.toml".source = "${dotfilesDir}/starship/starship.toml";
      ".gitconfig".source = "${dotfilesDir}/git/gitconfig";
      ".config/helix".source = "${dotfilesDir}/helix";
      ".ignore".source = "${dotfilesDir}/helix/ignore";
    };
    persistence."/persist/home" = {
      directories = [
        ".config/chromium"
        ".config/discord"
        ".config/lince"
        ".config/nushell"
        ".local/share/Smart Code ltd"
        ".local/state/lazygit"
        ".mozilla"
        ".ssh"
        "lince-social"
        "other"
        "xaviduds"
      ];
      files = [ ];
      allowOther = true;
    };
  };
}
