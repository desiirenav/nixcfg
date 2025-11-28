{ config,...}: {

  hjem.users.narayan.files.".config/kitty/kitty.conf".text = ''
    font_size 11
    # Black
    color0  #${config.theme.base00}
    color8  #${config.theme.base08}
    # Red
    color1  #${config.theme.base01}
    color9 #${config.theme.base09}
    # Green
    color2  #${config.theme.base02}
    color10 #${config.theme.base0A}
    # Yellow
    color3  #${config.theme.base03}
    color11 #${config.theme.base0B}
    # Blue
    color4  #${config.theme.base04}
    color12  #${config.theme.base0C}
    # Purple
    color5  #${config.theme.base05}
    color13 #${config.theme.base0D}
    # Cyan
    color6  #${config.theme.base06}
    color14 #${config.theme.base0E}
    # White
    color7  #${config.theme.base07}
    color15 #${config.theme.base0F}
    inactive_text_alpha   1.0
  '';
}
