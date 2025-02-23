{ pkgs, lib, inputs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
    initrd.postDeviceCommands = lib.mkAfter ''
      mkdir /btrfs_tmp
      mount /dev/root_vg/root /btrfs_tmp
      if [[ -e /btrfs_tmp/root ]]; then
      mkdir -p /btrfs_tmp/old_roots
      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
      mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
      fi
      delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
      delete_subvolume_recursively "/btrfs_tmp/$i"
      done
      btrfs subvolume delete "$1"
      }
      for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +0); do
      delete_subvolume_recursively "$i"
      done
      btrfs subvolume create /btrfs_tmp/root
      umount /btrfs_tmp
    '';
  };

  systemd = {
    tmpfiles.rules = [
      "d /persist/home/ 0777 root root -"
      "d /persist/home/eduardo 0700 eduardo users -"
    ];
  };

  fileSystems."/persist".neededForBoot = true;
  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [ "/etc/NetworkManager/system-connections" ];
  };

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  console.keyMap = "br-abnt2";

  i18n.defaultLocale = "pt_BR.UTF-8";

  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  time.timeZone = "America/Sao_Paulo";

  networking = {
    hostName = "nixos";
    networkmanager = { enable = true; };
  };

  nix = {
    optimise = {
      automatic = true;
      dates = [ "22:11" ];
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  environment = {
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "\${HOME}/.steam/root/compatibilitytools.d";
    };
    systemPackages = with pkgs; [
      alacritty
      astro-language-server
      brightnessctl
      btop
      carapace
      chromium
      dbeaver-bin
      delta
      discord
      eslint
      eslint_d
      fastfetch
      fd
      feh
      firefox
      fuzzel
      fzf
      gcc
      ghostty
      gimp
      git
      golangci-lint
      gopls
      graph-easy
      grim
      helix
      isort
      jq
      kitty
      lua-language-server
      luajitPackages.luarocks
      # ladybird
      lazygit
      markdown-oxide
      marksman
      mesa
      mpv
      mypy
      ncdu
      neovim
      nil
      nixfmt-rfc-style
      nodePackages.bash-language-server
      nodePackages.prettier
      nodePackages_latest.typescript-language-server
      nushell
      openssh
      openssl
      postman
      prisma
      protonup
      pyright
      ripgrep
      ruff
      rustup
      slurp
      rofi-wayland
      slides
      sonic-pi
      sql-formatter
      sqlfluff
      sqruff
      sqls
      starship
      stremio
      stylua
      svelte-language-server
      swww
      tailwindcss-language-server
      ueberzugpp
      unzip
      vscode-langservers-extracted
      wakeonlan
      waybar
      wl-clipboard
      xonsh
      yazi
      yt-dlp
      zathura
      zig
      zip
      zls
    ];
  };

  programs = {
    steam.enable = true;
    gamemode.enable = true;
    fuse.userAllowOther = true;
    hyprland.enable = true;
    dconf.enable = true;
  };

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
      sddm = {
        enable = true;
        # theme = "catppuccin-mocha";
        wayland.enable = true;
      };
    };
  };

  system = {
    autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [ "--update-input" "nixpkgs" "-L" ];
      dates = "22:11";
      randomizedDelaySec = "45min";
    };
    stateVersion = "24.11";
  };

  users.users.eduardo = {
    isNormalUser = true;
    description = "eduardo";
    initialPassword = "1";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "eduardo" = import ./home.nix; };
  };
}
