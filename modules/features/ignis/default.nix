{ config, lib, pkgs, ... }: let
  ignisconf = import ./config;
in
{
  system.activationScripts.gtk.text = ''
    ln -sf ${ignisconf} "/home/narayan/.config/ignis"
  '';
}
 
 
