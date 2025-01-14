{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # pkgs
    nodejs_23
    go
  ];
  shellHook = ''
    # cd ${toString ./.}
    nu
  '';
}
