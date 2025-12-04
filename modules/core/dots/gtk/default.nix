{lib,config, ...}: let
  inherit (lib) mkDefault;
  theme-name = "adw-gtk3";
  icon-theme-name = "Adwaita";
  gtk-css = import ./gtk-css.nix {inherit config;};
in {
  hjem.users.narayan.files = {
    ".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-icon-theme-name=${icon-theme-name}
      gtk-theme-name=${theme-name}
    '';
    ".config/gtk-3.0/gtk.css".text = ''
      ${gtk-css}
    '';
    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-icon-theme-name=${icon-theme-name}
      gtk-theme-name=${theme-name}
    '';
    ".config/gtk-4.0/gtk.css".text = ''
      ${gtk-css}
    '';
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
