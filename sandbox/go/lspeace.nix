{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [ go ];
  shellHook = ''
    cd ${toString ./.}
    nvim ${toString ./.}
  '';
}
