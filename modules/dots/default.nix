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
#    ./gtk/gtk.nix
    ./kitty
    ./ignis
    #./matugen
    ./niri
  ];
}

