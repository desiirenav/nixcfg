{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./bar
    ./display
    ./fonts
    ./theme
  ];
}

