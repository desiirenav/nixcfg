{ pkgs, lib, config, ...}: let
  inherit (lib) mkDefault;
  theme-name = "adw-gtk3";
  icon-theme-name = "adwaita-icon-theme";
  gtk-css = ''
	@define-color accent_color #${config.theme.base0D};
	@define-color accent_bg_color #${config.theme.base0D};
	@define-color accent_fg_color #${config.theme.base00};
	@define-color destructive_color #${config.theme.base08};
	@define-color destructive_bg_color #${config.theme.base08};
	@define-color destructive_fg_color #${config.theme.base00};
	@define-color success_color #${config.theme.base0B};
	@define-color success_bg_color #${config.theme.base0B};
	@define-color success_fg_color #${config.theme.base00};
	@define-color warning_color #${config.theme.base0E};
	@define-color warning_bg_color #${config.theme.base0E};
	@define-color warning_fg_color #${config.theme.base00};
	@define-color error_color #${config.theme.base08};
	@define-color error_bg_color #${config.theme.base08};
	@define-color error_fg_color #${config.theme.base00};
	@define-color window_bg_color #${config.theme.base00};
	@define-color window_fg_color #${config.theme.base05};
	@define-color view_bg_color #${config.theme.base00};
	@define-color view_fg_color #${config.theme.base05};
	@define-color headerbar_bg_color #${config.theme.base01};
	@define-color headerbar_fg_color #${config.theme.base05};
	@define-color headerbar_backdrop_color @window_bg_color;
	@define-color headerbar_shade_color rgba(0, 0, 0, 0.07);
	@define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.07);
	@define-color sidebar_bg_color #${config.theme.base01};
	@define-color sidebar_fg_color #${config.theme.base05};
	@define-color sidebar_backdrop_color @window_bg_color;
	@define-color sidebar_shade_color rgba(0, 0, 0, 0.07);
	@define-color secondary_sidebar_bg_color @sidebar_bg_color;
	@define-color secondary_sidebar_fg_color @sidebar_fg_color;
	@define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
	@define-color secondary_sidebar_shade_color @sidebar_shade_color;
	@define-color card_bg_color #${config.theme.base01};
	@define-color card_fg_color #${config.theme.base05};
	@define-color card_shade_color rgba(0, 0, 0, 0.07);
	@define-color dialog_bg_color #${config.theme.base01};
	@define-color dialog_fg_color #${config.theme.base05};
	@define-color popover_bg_color #${config.theme.base01};
	@define-color popover_fg_color #${config.theme.base05};
	@define-color popover_shade_color rgba(0, 0, 0, 0.07);
	@define-color shade_color rgba(0, 0, 0, 0.07);
	@define-color scrollbar_outline_color #${config.theme.base02};
	@define-color blue_1 #${config.theme.base0D};
	@define-color blue_2 #${config.theme.base0D};
	@define-color blue_3 #${config.theme.base0D};
	@define-color blue_4 #${config.theme.base0D};
	@define-color blue_5 #${config.theme.base0D};
	@define-color green_1 #${config.theme.base0B};
	@define-color green_2 #${config.theme.base0B};
	@define-color green_3 #${config.theme.base0B};
	@define-color green_4 #${config.theme.base0B};
	@define-color green_5 #${config.theme.base0B};
	@define-color yellow_1 #${config.theme.base0A};
	@define-color yellow_2 #${config.theme.base0A};
	@define-color yellow_3 #${config.theme.base0A};
	@define-color yellow_4 #${config.theme.base0A};
	@define-color yellow_5 #${config.theme.base0A};
	@define-color orange_1 #${config.theme.base09};
	@define-color orange_2 #${config.theme.base09};
	@define-color orange_3 #${config.theme.base09};
	@define-color orange_4 #${config.theme.base09};
	@define-color orange_5 #${config.theme.base09};
	@define-color red_1 #${config.theme.base08};
	@define-color red_2 #${config.theme.base08};
	@define-color red_3 #${config.theme.base08};
	@define-color red_4 #${config.theme.base08};
	@define-color red_5 #${config.theme.base08};
	@define-color purple_1 #${config.theme.base0E};
	@define-color purple_2 #${config.theme.base0E};
	@define-color purple_3 #${config.theme.base0E};
	@define-color purple_4 #${config.theme.base0E};
	@define-color purple_5 #${config.theme.base0E};
	@define-color brown_1 #${config.theme.base0F};
	@define-color brown_2 #${config.theme.base0F};
	@define-color brown_3 #${config.theme.base0F};
	@define-color brown_4 #${config.theme.base0F};
	@define-color brown_5 #${config.theme.base0F};
	@define-color light_1 #${config.theme.base05};
	@define-color light_2 #${config.theme.base05};
	@define-color light_3 #${config.theme.base05};
	@define-color light_4 #${config.theme.base05};
	@define-color light_5 #${config.theme.base05};
	@define-color dark_1 #${config.theme.base05};
	@define-color dark_2 #${config.theme.base05};
	@define-color dark_3 #${config.theme.base05};
	@define-color dark_4 #${config.theme.base05};
	@define-color dark_5 #${config.theme.base05};
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
} 
