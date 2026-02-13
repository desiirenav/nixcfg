{
  flake.nixosModules.gtk = { self, lib, pkgs, ... }:
  let 
    inherit (lib) mkDefault;
    inherit (self) theme;
    theme-name     = "adw-gtk3";
    icon-theme-name = "Adwaita";
    gtkfont = "SFProDisplay Nerd Font 11";
    gtkmonofont = "Liga SFMono Nerd Font 11";
    
    gtksettings = ''
      [Settings]
      gtk-icon-theme-name=${icon-theme-name}
      gtk-theme-name=${theme-name}
      gtk-font-name=${gtkfont}
    '';
    
    gtkcss = ''
      @define-color accent_color #${theme.base0D};
      @define-color accent_bg_color #${theme.base0D};
      @define-color accent_fg_color #${theme.base00};
      @define-color destructive_color #${theme.base08};
      @define-color destructive_bg_color #${theme.base08};
      @define-color destructive_fg_color #${theme.base00};
      @define-color success_color #${theme.base0B};
      @define-color success_bg_color #${theme.base0B};
      @define-color success_fg_color #${theme.base00};
      @define-color warning_color #${theme.base0E};
      @define-color warning_bg_color #${theme.base0E};
      @define-color warning_fg_color #${theme.base00};
      @define-color error_color #${theme.base08};
      @define-color error_bg_color #${theme.base08};
      @define-color error_fg_color #${theme.base00};
      @define-color window_bg_color #${theme.base00};
      @define-color window_fg_color #${theme.base07};
      @define-color view_bg_color #${theme.base00};
      @define-color view_fg_color #${theme.base07};
      @define-color headerbar_bg_color #${theme.base01};
      @define-color headerbar_fg_color #${theme.base07};
      @define-color headerbar_border_color rgba(#${theme.base01}, #${theme.base01}, #${theme.base01}, 0.7);
      @define-color headerbar_backdrop_color @window_bg_color;
      @define-color headerbar_shade_color rgba(0, 0, 0, 0.07);
      @define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.07);
      @define-color sidebar_bg_color #${theme.base01};
      @define-color sidebar_fg_color #${theme.base07};
      @define-color sidebar_backdrop_color @window_bg_color;
      @define-color sidebar_shade_color rgba(0, 0, 0, 0.07);
      @define-color secondary_sidebar_bg_color @sidebar_bg_color;
      @define-color secondary_sidebar_fg_color @sidebar_fg_color;
      @define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
      @define-color secondary_sidebar_shade_color @sidebar_shade_color;
      @define-color card_bg_color #${theme.base01};
      @define-color card_fg_color #${theme.base07};
      @define-color card_shade_color rgba(0, 0, 0, 0.07);
      @define-color dialog_bg_color #${theme.base01};
      @define-color dialog_fg_color #${theme.base07};
      @define-color popover_bg_color #${theme.base01};
      @define-color popover_fg_color #${theme.base07};
      @define-color popover_shade_color rgba(0, 0, 0, 0.07);
      @define-color shade_color rgba(0, 0, 0, 0.07);
      @define-color scrollbar_outline_color #${theme.base02};
      @define-color blue_1 #${theme.base0D};
      @define-color blue_2 #${theme.base0D};
      @define-color blue_3 #${theme.base0D};
      @define-color blue_4 #${theme.base0D};
      @define-color blue_5 #${theme.base0D};
      @define-color green_1 #${theme.base0B};
      @define-color green_2 #${theme.base0B};
      @define-color green_3 #${theme.base0B};
      @define-color green_4 #${theme.base0B};
      @define-color green_5 #${theme.base0B};
      @define-color yellow_1 #${theme.base0A};
      @define-color yellow_2 #${theme.base0A};
      @define-color yellow_3 #${theme.base0A};
      @define-color yellow_4 #${theme.base0A};
      @define-color yellow_5 #${theme.base0A};
      @define-color orange_1 #${theme.base09};
      @define-color orange_2 #${theme.base09};
      @define-color orange_3 #${theme.base09};
      @define-color orange_4 #${theme.base09};
      @define-color orange_5 #${theme.base09};
      @define-color red_1 #${theme.base08};
      @define-color red_2 #${theme.base08};
      @define-color red_3 #${theme.base08};
      @define-color red_4 #${theme.base08};
      @define-color red_5 #${theme.base08};
      @define-color purple_1 #${theme.base0E};
      @define-color purple_2 #${theme.base0E};
      @define-color purple_3 #${theme.base0E};
      @define-color purple_4 #${theme.base0E};
      @define-color purple_5 #${theme.base0E};
      @define-color brown_1 #${theme.base0F};
      @define-color brown_2 #${theme.base0F};
      @define-color brown_3 #${theme.base0F};
      @define-color brown_4 #${theme.base0F};
      @define-color brown_5 #${theme.base0F};
      @define-color light_1 #${theme.base07};
      @define-color light_2 #${theme.base07};
      @define-color light_3 #${theme.base07};
      @define-color light_4 #${theme.base07};
      @define-color light_5 #${theme.base07};
      @define-color dark_1 #${theme.base00};
      @define-color dark_2 #${theme.base00};
      @define-color dark_3 #${theme.base00};
      @define-color dark_4 #${theme.base00};
      @define-color dark_5 #${theme.base00};
    '';

  in { 
    environment.sessionVariables = {
      GTK_THEME = theme-name;
    };

    hjem.users.narayan.files = {
      ".config/gtk-3.0/settings.ini".text = gtksettings;
      ".config/gtk-4.0/settings.ini".text = gtksettings;
      ".config/gtk-3.0/gtk.css".text = gtkcss;
      ".config/gtk-4.0/gtk.css".text = gtkcss;
    };

    programs.dconf = {
      enable = mkDefault true;
      profiles.user.databases = [
        {
          lockAll = false;
          settings = {
            "org/gnome/desktop/interface" = {
              gtk-theme   = theme-name;
              icon-theme  = icon-theme-name;
              color-scheme = "prefer-dark";
              font-name = gtkfont;
              monospace-font-name = gtkmonofont;
            };
          };
        }
      ];
    };
  };
}
