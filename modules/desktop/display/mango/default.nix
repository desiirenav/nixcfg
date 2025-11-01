{ inputs, config, lib, pkgs, ... }:

{
  programs.mango.enable = true;
  
  hjem.users.narayan.files = {
    ".config/mango/config.conf".source = ./config.conf; 
  };
}

