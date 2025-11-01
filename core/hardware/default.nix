{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./disko.nix
    ./hardware.nix
    ./nvidia.nix
  ];
}

