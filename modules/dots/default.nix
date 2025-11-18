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
    ./gtk
    ./ignis
    ./matugen
    ./niri
  ];
}

