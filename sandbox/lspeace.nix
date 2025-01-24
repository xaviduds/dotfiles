{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    ## Go
    go
    gopls
    golangci-lint

    ## Rust
    rustc
    cargo

    ## Zig
    zig
    zls

    ##  JS
    # nodejs_23
    # pnpm
    eslint
    eslint_d
    nodePackages_latest.prettier

    # Python
    mypy
    pyright
    isort
    ruff

    ## Nix
    nil
    nixfmt-rfc-style

    ## Markdown
    marksman
    markdown-oxide
  ];
  LD_LIBRARY_PATH = "${pkgs.rustup}/lib";
  shellHook = ''
    cd ${toString ./.}
    nvim
  '';
}
