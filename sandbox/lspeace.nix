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
  ];
  LD_LIBRARY_PATH = "${pkgs.rustup}/lib";
  shellHook = ''
    cd ${toString ./.}
    nvim
  '';
}
