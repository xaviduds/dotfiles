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
      ".config/alacritty/alacritty.toml".source = "${dotfilesDir}/terminal/alacritty/alacritty.toml";
      ".config/emacs/init.el".source = "${dotfilesDir}/editor/emacs/init.el";
      ".config/emacs/config.org".source = "${dotfilesDir}/editor/emacs/config.org";
      ".config/helix/themes/dark.toml".source = "${dotfilesDir}/editor/helix/dark.toml";
      ".config/helix/config.toml".source = "${dotfilesDir}/editor/helix/config.toml";
      ".config/hypr/hyprland.conf".source = "${dotfilesDir}/desktop/hypr/hyprland.conf";
      ".config/nushell/config.nu".source = "${dotfilesDir}/terminal/nushell/config.nu";
      ".config/nushell/env.nu".source = "${dotfilesDir}/terminal/nushell/env.nu";
      ".config/waybar/config".source = "${dotfilesDir}/desktop/waybar/waybar.json";
      ".config/waybar/style.css".source = "${dotfilesDir}/desktop/waybar/waybar.css";
      ".config/starship.toml".source = "${dotfilesDir}/terminal/starship/starship.toml";
            # "~/.config/nvim".source = "${dotfilesDir}/editor/nvim";
      # "~/.config/ghostty".source = "${dotfilesDir}/terminal/ghostty";
      # "~/.config/rofi".source = "${dotfilesDir}/terminal/rofi";
      # "~/.config/lince".source = "${dotfilesDir}/lince";

    };

    # Symlink directories using home.directory
    # directory = {
    #   "~/.config/nvim".source = "${dotfilesDir}/editor/nvim";
    #   "~/.config/ghostty".source = "${dotfilesDir}/terminal/ghostty";
    #   "~/.config/rofi".source = "${dotfilesDir}/terminal/rofi";
    #   "~/.config/lince".source = "${dotfilesDir}/lince";
    # };
  # Impermanence persistence settings
  persistence."/persist/home" = {
    directories = [
      # ".config/hypr"
      # ".config/nvim"
      # ".config/ghostty"
      # ".config/rofi"
      # ".config/waybar"
      # ".config/lince"
      ".ssh"
      ".mozilla"
      "lince-social"
      "xaviduds"
    ];
    files = [];
    allowOther = true;
};
  };
}

