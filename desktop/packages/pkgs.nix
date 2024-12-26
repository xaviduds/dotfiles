{ pkgs, ... }:
{
  environment = {
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
    systemPackages = with pkgs; [
      adwaita-icon-theme
      ags
      alacritty
      astro-language-server
      black
      bottles
      brave
      brightnessctl
      carapace
      chromium
      # clang
      # coreutils
      dbeaver-bin
      delta
      delve
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
      gimp
      git
      gnome-themes-extra
      gopls
      grim
      helix
      imagemagick
      isort
      jdk
      lua-language-server
      luajitPackages.luarocks
      # ladybird
      lazygit
      libreoffice
      librewolf
      markdown-oxide
      marksman
      mpv
      mypy
      ncdu
      neovim
      nil
      niri
      nixd
      nixfmt-rfc-style
      nodePackages.bash-language-server
      nodePackages.prettier
      nodePackages_latest.typescript-language-server
      nushell
      # nushellPlugins.query
      # nushellPlugins.polars
      # nushellPlugins.net
      # nushellPlugins.highlight
      # nushellPlugins.gstat
      # nushellPlugins.formats
      openssl
      # pgformatter
      pgmodeler
      pnpm
      # postgres-lsp
      postman
      prisma
      protonup
      pyright
      ripgrep
      ruff
      rustup
      slurp
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
      unrar-free
      unzip
      vlc
      vscode
      vscode-langservers-extracted
      waybar
      wl-clipboard
      xterm
      yazi
      yt-dlp
      zathura
      zed-editor
      zig
      zip
      zls
    ];
  };
}
