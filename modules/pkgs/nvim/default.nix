{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  programs.mnw = {
    enable = true;
    aliases = [
      "vi"
      "vim"
    ];
    luaFiles = [
      ./init.lua
    ];
    plugins = {
      start =  with pkgs.vimPlugins; [
      ];
    };
  };
} 
