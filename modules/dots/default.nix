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
    ./ignis
    #./matugen
    ./niri
  ];
}

