{ pkgs, lib, ...}: 

{
  hjem.users.narayan.files = {
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=true
      gtk-cursor-theme-name=capitaine-cursors
      gtk-cursor-theme-size=22
      gtk-icon-theme-name=adwaita-icon-theme
      gtk-theme-name=adw-gtk3
    '';
    ".config/gtk-3.0/gtk.css".text = ''
      @import 'colors.css';
    '';
    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=true
      gtk-cursor-theme-name=capitaine-cursors
      gtk-cursor-theme-size=22
      gtk-icon-theme-name=adwaita-icon-theme
      gtk-theme-name=adw-gtk3
    '';
    ".config/gtk-4.0/gtk.css".text = ''
      @import 'colors.css';
    '';
  };
}
