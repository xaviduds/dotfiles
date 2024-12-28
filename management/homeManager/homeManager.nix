{ inputs, ... }:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "eduardo" = import ./home.nix;
    };
  };
}
