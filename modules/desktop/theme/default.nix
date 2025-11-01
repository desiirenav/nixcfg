{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./gtk
    ./matugen
    ./rofi
  ];
}

