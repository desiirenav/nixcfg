{ config, lib, pkgs, ... }:

let
  discord-css = pkgs.writeText "gtk.css" (import ./discord-css.nix { inherit config; });

in
{

  system.activationScripts.gtk.text = ''
    ln -sf ${discord-css} "/home/narayan/.config/Vencord/theme/discord.css"
  '';
}
 
 
