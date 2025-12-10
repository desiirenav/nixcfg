{pkgs, ...}: {
  imports = [
    ./base
    ./core
    ./pkgs
    ./theme
    ./wrapped
  ];
}

