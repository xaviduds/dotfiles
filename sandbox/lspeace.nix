{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # pkgs
  ];
  shellHook = ''
    cd ${toString ./.}
    nvim ${toString ./.}
  '';
}
