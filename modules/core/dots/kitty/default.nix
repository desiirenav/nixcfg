{config, ...}: {
  hjem.users.narayan.files.".config/kitty/kitty.conf".text = ''
    font_size 11.0
    background #${config.theme.base00}
    foreground #${config.theme.base05}
    selection_background #${config.theme.base05}
    selection_foreground #${config.theme.base00}
    url_color #${config.theme.base04}
    cursor #${config.theme.base05}
    cursor_text_color #${config.theme.base00}
    active_border_color #${config.theme.base03}
    inactive_border_color #${config.theme.base01}
    active_tab_background #${config.theme.base00}
    active_tab_foreground #${config.theme.base05}
    inactive_tab_background #${config.theme.base01}
    inactive_tab_foreground #${config.theme.base04}
    tab_bar_background #${config.theme.base01}
    wayland_titlebar_color #${config.theme.base00}
    macos_titlebar_color #${config.theme.base00}

    # normal
    color0 #${config.theme.base00}
    color1 #${config.theme.base08}
    color2 #${config.theme.base0B}
    color3 #${config.theme.base0A}
    color4 #${config.theme.base0D}
    color5 #${config.theme.base0E}
    color6 #${config.theme.base0C}
    color7 #${config.theme.base05}

    # bright
    color8 #${config.theme.base03}
    color9 #${config.theme.base09}
    color10 #${config.theme.base01}
    color11 #${config.theme.base02}
    color12 #${config.theme.base04}
    color13 #${config.theme.base06}
    color14 #${config.theme.base0F}
    color15 #${config.theme.base07}
  '';
}
