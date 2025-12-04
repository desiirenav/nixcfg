{config, ...}: {
  hjem.users.narayan.files.".config/kitty/kitty.conf".text = ''
    font_size 13.0
    
    # vim:ft=kitty
    ## name: Base2Tone Lavender Dark
    ## author: Bram de Haan (https://github.com/atelierbram)
    ## license: MIT
    ## upstream: https://github.com/atelierbram/Base2Tone-kitty/blob/main/themes/base2tone-lavender-dark.conf
    ## blurb: duotone theme | blue lavender violet - magenta
    
    #: The basic colors
    foreground #${config.theme.base07}
    background #${config.theme.base00}
    selection_foreground #${config.theme.base05}
    selection_background #${config.theme.base01}
    
    #: Cursor colors
    cursor #${config.theme.base09}
    cursor_text_color #${config.theme.base00}
    
    #: URL underline color when hovering with mouse
    url_color #${config.theme.base06}
    
    #: kitty window border colors
    active_border_color #${config.theme.base02}
    inactive_border_color #${config.theme.base00}
    
    #: OS Window titlebar colors
    wayland_titlebar_color #${config.theme.base01}
    macos_titlebar_color #${config.theme.base01}
    
    #: Tab bar colors
    active_tab_foreground #${config.theme.base07}
    active_tab_background #${config.theme.base00}
    inactive_tab_foreground #${config.theme.base04}
    inactive_tab_background #${config.theme.base01}
    tab_bar_background #${config.theme.base01}
    
    #: The basic 16 colors
    #: black
    color0 #${config.theme.base00}
    color8 #${config.theme.base03}
    
    #: red
    color1 #${config.theme.base0E}
    color9 #${config.theme.base0D}
    
    #: green
    color2 #${config.theme.base0A}
    color10 #${config.theme.base01}
    
    #: yellow
    color3 #${config.theme.base0C}
    color11 #${config.theme.base02}
    
    #: blue
    color4 #${config.theme.base05}
    color12 #${config.theme.base04}
    
    #: magenta
    color5 #${config.theme.base0A}
    color13 #${config.theme.base06}
    
    #: cyan
    color6 #${config.theme.base06}
    color14 #${config.theme.base09}
    
    #: white
    color7 #${config.theme.base05}
    color15 #${config.theme.base07}
  '';
}
