{ pkgs, lib, ...}: let 
  theme-name = "adw-gtk3";
  icon-theme-name = "adwaita-icon-theme";
in {
  hjem.users.narayan.files = {
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-icon-theme-name=${icon-theme-name}
      gtk-theme-name=${theme-name}
    '';
    ".config/gtk-3.0/gtk.css".text = ''
      @import 'colors.css';
    '';
    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-icon-theme-name=${icon-theme-name}
      gtk-theme-name=${theme-name}
    '';
    ".config/gtk-4.0/gtk.css".text = ''
      @import 'colors.css';
    '';
  };
}
