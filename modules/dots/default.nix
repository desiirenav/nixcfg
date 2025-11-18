{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./firefox
    ./fish
    ./ghostty
    ./gtk
    ./ignis
    ./matugen
    ./niri
  ];
}

