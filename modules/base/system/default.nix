{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./features.nix
    ./services.nix
    ./system.nix
    ./user.nix
  ];
}

