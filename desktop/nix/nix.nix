{ ... }:
{
  nix = {
    optimise = {
      automatic = true;
      dates = [ "22:11" ];
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };
}
