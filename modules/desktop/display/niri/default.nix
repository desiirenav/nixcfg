{ inputs, config, lib, pkgs, ... }:

{
  programs.niri.enable = true;
  
  hjem.users.narayan.files = {
    ".config/niri/config.kdl".source = ./config.kdl; 
  };
}

