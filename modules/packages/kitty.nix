{ self, inputs, lib, ...}: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme; 
  in {
    packages.kitty = (inputs.wrappers.wrapperModules.kitty.apply {
      inherit pkgs;
      "kitty.conf".content = ''
        font_size 11.0

        # The basic colors
        foreground #${theme.base07}
        background #${theme.base00}
        selection_foreground #${theme.base04}
        selection_background #${theme.base01}

        # Cursor colors
        cursor #${theme.base09}
        cursor_text_color #${theme.base00}
        cursor_trail 3
       
        url_color #${theme.base06}

        # kitty window border colors and terminal bell colors
        active_border_color #${theme.base02}
        inactive_border_color #${theme.base00}
        bell_border_color #${theme.base08}
        visual_bell_color none

        # OS Window titlebar colors
        wayland_titlebar_color #${theme.base01}
        macos_titlebar_color #${theme.base01}

        # Tab bar colors
        active_tab_foreground #${theme.base07}
        active_tab_background #${theme.base00}
        inactive_tab_foreground #${theme.base05}
        inactive_tab_background #${theme.base01}
        tab_bar_background #${theme.base01}
        tab_bar_margin_color none

        # Colors for marks (marked text in the terminal)
        mark1_foreground #${theme.base00}
        mark1_background #${theme.base0F}
        mark2_foreground #${theme.base00}
        mark2_background #${theme.base0B}
        mark3_foreground #${theme.base00}
        mark3_background #${theme.base09}

        # The basic 16 colors
        # black
        color0  #${theme.base00}
        color8  #${theme.base03}

        # red
        color1  #${theme.base0E}
        color9  #${theme.base0D}

        # green
        color2  #${theme.base0A}
        color10 #${theme.base01}

        # yellow
        color3  #${theme.base0C}
        color11 #${theme.base02}

        # blue
        color4  #${theme.base05}
        color12 #${theme.base04}

        # magenta
        color5  #${theme.base0A}
        color13 #${theme.base06}

        # cyan
        color6  #${theme.base05}
        color14 #${theme.base09}

        # white
        color7  #${theme.base04}
        color15 #${theme.base07}
      '';
    }).wrapper;
  };
}
