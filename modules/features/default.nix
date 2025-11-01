{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./fish
    ./hjem
    ./persist
  ];
}

