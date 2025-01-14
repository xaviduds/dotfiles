{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # pkgs
    nodejs_23
    pnpm
    go
  ];
  shellHook = ''
    # cd ${toString ./.}
    nvim ${toString ./.}
  '';
}
