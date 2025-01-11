{ pkgs, ... }:
{
  services = {
    ollama.enable = true;
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
    blueman.enable = true;
    thermald.enable = true;
    power-profiles-daemon.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      wireplumber.enable = true;
    };
    displayManager = {
      theme = "catppuccin-mocha";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
