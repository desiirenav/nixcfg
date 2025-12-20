{ config, lib, pkgs, ... }:

let
  discord-css = pkgs.writeText "gtk.css" (import ./discord-css.nix { inherit config; });

in
{

  system.activationScripts.discord.text = ''
    ln -sf ${discord-css} "/home/narayan/.config/Vencord/themes/discord.css"
  '';
}
 
 
