{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./desktop
    ./features
    ./pkgs
  ];
}

