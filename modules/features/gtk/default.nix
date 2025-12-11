{ config, lib, pkgs, ... }:

let
  inherit (lib) mkDefault;

  themeName     = "adw-gtk3";
  iconThemeName = "Adwaita";

  # settings.ini content
  gtkSettings = pkgs.writeText "gtk-settings.ini" ''
    [Settings]
    gtk-icon-theme-name=${iconThemeName}
    gtk-theme-name=${themeName}
  '';

  gtkCss = pkgs.writeText "gtk.css" (import ./gtk-css.nix { inherit config; });

in
{
  system.activationScripts.gtk.text = ''

    mkdir -p "/home/narayan/.config/gtk-3.0" "/home/narayan/.config/gtk-4.0"

    ln -sf ${gtkSettings} "/home/narayan/.config/gtk-3.0/settings.ini"
    ln -sf ${gtkSettings} "/home/narayan/.config/gtk-4.0/settings.ini"

    ln -sf ${gtkCss} "/home/narayan/.config/gtk-3.0/gtk.css"
    ln -sf ${gtkCss} "/home/narayan/.config/gtk-4.0/gtk.css"
  '';

  programs.dconf = {
    enable = mkDefault true;
    profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme   = themeName;
            icon-theme  = iconThemeName;
            color-scheme = "prefer-dark";
          };
        };
      }
    ];
  };
}
 
