{ config, lib, pkgs, ... }:

let
  inherit (lib) mkDefault;

  theme-name     = "adw-gtk3";
  icon-theme-name = "Adwaita";

  # settings.ini content
  gtksettings = pkgs.writeText "gtk-settings.ini" ''
    [Settings]
    gtk-icon-theme-name=${icon-theme-name}
    gtk-theme-name=${theme-name}
  '';

  gtkcss = pkgs.writeText "gtk.css" (import ./gtk-css.nix { inherit config; });

in
{
  system.activationScripts.gtk.text = ''

    mkdir -p "/home/narayan/.config/gtk-3.0" "/home/narayan/.config/gtk-4.0"

    ln -sf ${gtksettings} "/home/narayan/.config/gtk-3.0/settings.ini"
    ln -sf ${gtksettings} "/home/narayan/.config/gtk-4.0/settings.ini"

    ln -sf ${gtkcss} "/home/narayan/.config/gtk-3.0/gtk.css"
    ln -sf ${gtkcss} "/home/narayan/.config/gtk-4.0/gtk.css"
  '';

  programs.dconf = {
    enable = mkDefault true;
    profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme   = theme-name;
            icon-theme  = icon-theme-name;
          };
        };
      }
    ];
  };
}
 
