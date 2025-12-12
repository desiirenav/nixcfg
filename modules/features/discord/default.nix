{ config, lib, pkgs, ... }:

let
  discord-css = pkgs.writeText "discord.css" import ./discord-css.nix { inherit config; });
in
{
  system.activationScripts.firefoxProfile.text = ''
    ln -sf ${discord-css}/.config/Vencord/discord.css /home/narayan/.config/Vencord/discord.css

    chown -R narayan:users /home/narayan/.config/Vencord
  '';
}

