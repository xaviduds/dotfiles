{ inputs, ... }:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "eduardo" = import /home/eduardo/xaviduds/dotfiles/management/homeManager/home.nix;
    };
  };
}
