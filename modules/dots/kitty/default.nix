{ config, lib, ...}: {

  hjem.users.narayan.files.".config/kitty/kitty.conf".text = ''
    font_size 11
    background #${config.theme.base00}
    foreground #${config.theme.base05}
    cursor #${config.theme.base05}
    cursor_text_color  #${config.theme.base00}
    url_color  #${config.theme.base04}
    selection_background #${config.theme.base01} 
    selection_foreground #${config.theme.base02} 
    color0 #${config.theme.base00}
    color1 #${config.theme.base08}
    color2 #${config.theme.base0B}
    color3 #${config.theme.base0A}
    color4 #${config.theme.base0D}
    color5 #${config.theme.base0E}
    color6 #${config.theme.base0D}
    color7 #${config.theme.base05}
    color8 #${config.theme.base02}
    color9 #${config.theme.base08}
    color10 #${config.theme.base0B}
    color11 #${config.theme.base0A}
    color12 #${config.theme.base0D}
    color13 #${config.theme.base0E}
    color14 #${config.theme.base0C}
    color15 #${config.theme.base07}
  '';
}
