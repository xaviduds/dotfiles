{ pkgs, ... }:
{
  environment = {
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
    systemPackages = with pkgs; [
      alacritty
      astro-language-server
      brightnessctl
      carapace
      chromium
      # clang
      # coreutils
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
      gimp
      git
      gopls
      grim
      helix
      isort
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
      # nushellPlugins.query
      # nushellPlugins.polars
      # nushellPlugins.net
      # nushellPlugins.highlight
      # nushellPlugins.gstat
      # nushellPlugins.formats
      openssl
      # pgformatter
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
      rofi-wayland
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
      waybar
      wl-clipboard
      yazi
      yt-dlp
      zathura
      zig
      zip
      zls
    ];
  };
}
