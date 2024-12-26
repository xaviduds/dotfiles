{ inputs, ... }:
{
  system = {
    autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        "-L"
      ];
      dates = "22:11";
      randomizedDelaySec = "45min";
    };
    stateVersion = "24.11";
  };
}
