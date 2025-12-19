{ config, inputs, pkgs, ... }:
{
  environment.systemPackages = [
    (inputs.wrappers.wrapperModules.kitty.apply {
      inherit pkgs;
      "kitty.conf".content = ''
        font_size 11.0

        # The basic colors
        foreground #${config.theme.base07}
        background #${config.theme.base00}
        selection_foreground #${config.theme.base04}
        selection_background #${config.theme.base01}

        # Cursor colors
        cursor #${config.theme.base09}
        cursor_text_color #${config.theme.base00}

        # URL underline color when hovering with mouse
        url_color #${config.theme.base06}

        # kitty window border colors and terminal bell colors
        active_border_color #${config.theme.base02}
        inactive_border_color #${config.theme.base00}
        bell_border_color #${config.theme.base08}
        visual_bell_color none

        # OS Window titlebar colors
        wayland_titlebar_color #${config.theme.base01}
        macos_titlebar_color #${config.theme.base01}

        # Tab bar colors
        active_tab_foreground #${config.theme.base07}
        active_tab_background #${config.theme.base00}
        inactive_tab_foreground #${config.theme.base05}
        inactive_tab_background #${config.theme.base01}
        tab_bar_background #${config.theme.base01}
        tab_bar_margin_color none

        # Colors for marks (marked text in the terminal)
        mark1_foreground #${config.theme.base00}
        mark1_background #${config.theme.base0F}
        mark2_foreground #${config.theme.base00}
        mark2_background #${config.theme.base0B}
        mark3_foreground #${config.theme.base00}
        mark3_background #${config.theme.base09}

        # The basic 16 colors
        # black
        color0  #${config.theme.base00}
        color8  #${config.theme.base03}

        # red
        color1  #${config.theme.base0E}
        color9  #${config.theme.base0D}

        # green
        color2  #${config.theme.base0A}
        color10 #${config.theme.base01}

        # yellow
        color3  #${config.theme.base0C}
        color11 #${config.theme.base02}

        # blue
        color4  #${config.theme.base05}
        color12 #${config.theme.base04}

        # magenta
        color5  #${config.theme.base0A}
        color13 #${config.theme.base06}

        # cyan
        color6  #${config.theme.base05}
        color14 #${config.theme.base09}

        # white
        color7  #${config.theme.base04}
        color15 #${config.theme.base07}
      '';
    }).wrapper
  ];
}
