{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./discord
    ./firefox
    ./fish
    ./fuzzel
    ./gtk
    ./kitty
    ./ignis
    #./matugen
    ./niri
  ];
}

