{ inputs, config, lib, pkgs, ... }:

{
  programs.niri.enable = true;


  environment.systemPackages = [
    (pkgs.writeShellScriptBin "vivian" ''
      swaybg -m fill -i /home/narayan/nixcfg/modules/dots/wal/vivian.png
    '')
  ];

  hjem.users.narayan.files = {
    ".config/niri/config.kdl".source = ./config.kdl; 
  };
}

