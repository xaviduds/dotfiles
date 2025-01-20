{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # pkgs
    nodejs_23
    pnpm
    go
    rustc
    cargo
    zig
    eslint
  ];
  LD_LIBRARY_PATH = "${pkgs.rustup}/lib";
  shellHook = ''
    cd ${toString ./.}
    nvim
  '';
}
