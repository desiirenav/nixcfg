{pkgs, ...}: {
  imports = [
    ./base
    ./core
    ./pkgs
    ./wrappers
  ];
}

