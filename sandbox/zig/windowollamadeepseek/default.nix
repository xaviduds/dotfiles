# {
#   pkgs ? import <nixpkgs> { },
# }:
#
# pkgs.mkShell {
#   buildInputs = [
#     pkgs.zig
#     pkgs.pkg-config
#     pkgs.SDL2
#   ];
#
#   shellHook = ''
#     export PKG_CONFIG_PATH=${pkgs.SDL2}/lib/pkgconfig
#   '';
# }

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.zig
    pkgs.pkg-config
    pkgs.SDL2
    pkgs.gcc
  ];

  shellHook = ''
    export PKG_CONFIG_PATH=${pkgs.SDL2}/lib/pkgconfig
  '';
}
