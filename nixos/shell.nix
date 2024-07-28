{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nodejs
    yarn
    python3
    poetry
    go
  ];
}
