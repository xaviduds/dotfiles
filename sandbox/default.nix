{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # pkgs
    nodejs_23
    go
    zig
  ];
  shellHook = ''
    cd ${toString ./.}
    nu
  '';
}
