{lib,config, ...}: let
  inherit (lib) mkDefault;
  theme-name = "adw-gtk3";
  icon-theme-name = "Adwaita";
  gtk-css = ''
	@define-color accent_color #${config.theme.base0D};
	@define-color accent_fg_color #${config.theme.base0A};
	@define-color accent_bg_color #${config.theme.base07};
	@define-color window_bg_color #${config.theme.base00};
	@define-color window_fg_color #${config.theme.base07};
	@define-color headerbar_bg_color #${config.theme.base00};
	@define-color headerbar_fg_color #${config.theme.base07};
	@define-color popover_bg_color #${config.theme.base00};
	@define-color popover_fg_color #${config.theme.base07};
	@define-color view_bg_color #${config.theme.base00};
	@define-color view_fg_color #${config.theme.base07};
	@define-color card_bg_color #${config.theme.base00};
	@define-color card_fg_color #${config.theme.base07};
	@define-color sidebar_bg_color @window_bg_color;
	@define-color sidebar_fg_color @window_fg_color;
	@define-color sidebar_border_color @window_bg_color;
	@define-color sidebar_backdrop_color @window_bg_color;
  '';
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
