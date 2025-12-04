{config, ...}: {
  hjem.users.narayan.files.".config/kitty/kitty.conf".text = ''
    font_size 13.0

    foreground #${config.theme.base0F}
    background #${config.theme.base00}
    selection_foreground #${config.theme.base07}
    selection_background #${config.theme.base0A}

    cursor #b042ff
    cursor_text_color #${config.theme.base00}

    url_color #${config.theme.base0D}

    active_border_color #${config.theme.base0B}
    inactive_border_color #${config.theme.base00}
    bell_border_color #7451e6
    visual_bell_color none

    wayland_titlebar_color #${config.theme.base0A}
    macos_titlebar_color #${config.theme.base0A}

    active_tab_foreground #faf8fc
    active_tab_background #${config.theme.base00}
    inactive_tab_foreground #b2a4bc
    inactive_tab_background #${config.theme.base0A}
    tab_bar_background #${config.theme.base0A}
    tab_bar_margin_color none

    mark1_foreground #${config.theme.base00}
    mark1_background #8363ee
    mark2_foreground #${config.theme.base00}
    mark2_background #8e8198
    mark3_foreground #${config.theme.base00}
    mark3_background #b957ff

    #: black
    color0 #${config.theme.base00}
    color8 #${config.theme.base08}

    #: red
    color1 #${config.theme.base01}
    color9 #${config.theme.base09}

    #: green
    color2 #${config.theme.base02}
    color10 #${config.theme.base0A}

    #: yellow
    color3 #${config.theme.base03}
    color11 #${config.theme.base0B}

    #: blue
    color4 #${config.theme.base04}
    color12 #${config.theme.base0C}

    #: magenta
    color5 #${config.theme.base05}
    color13 #${config.theme.base0D}

    #: cyan
    color6 #${config.theme.base06}
    color14 #${config.theme.base0E}

    #: white
    color7 #${config.theme.base07}
    color15 #${config.theme.base0F}
  '';
}
