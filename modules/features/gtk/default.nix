{lib,config, ...}: let
  inherit (lib) mkDefault;
  theme-name = "adw-gtk3";
  icon-theme-name = "Adwaita";
  gtksettings = ''
    [Settings]
    gtk-icon-theme-name = ${icon-theme-name}
    gtk-theme-name = ${theme-name}
  '';
  gtk-css = import ./gtk-css.nix {inherit config;};
in {
    environment = {
      etc = {
        "xdg/gtk-3.0/settings.ini".text = gtksettings;
        "xdg/gtk-4.0/settings.ini".text = gtksettings;
	"xdg/gtk-3.0/gtk.css".text = gtk-css;
	"xdg/gtk-4.0/gtk.css".text = gtk-css;
      };
    };

  programs = {
    dconf = {
      enable = mkDefault true;
      profiles = {
        user = {
          databases = [
            {
	      lockAll = false;
	      settings = {
	        "org/gnome/desktop/interface" = {
	          gtk-theme = theme-name;
	          icon-theme = icon-theme-name;
	          color-scheme = "prefer-dark";
	        };
	      };
            }
          ];
        };
      };
    };
  };
} 
