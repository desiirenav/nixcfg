{ config, lib, ...}: {

  hjem.users.narayan.files.".config/ghostty/config".text = ''
    font-family = "Liga SFMono Nerd Font"
    font-style = Medium
    font-size = 11
    palette = 0=#${config.theme.base00}
    palette = 1=#${config.theme.base01}
    palette = 2=#${config.theme.base02}
    palette = 3=#${config.theme.base03}
    palette = 4=#${config.theme.base04}
    palette = 5=#${config.theme.base05}
    palette = 6=#${config.theme.base06}
    palette = 7=#${config.theme.base07}
    palette = 8=#${config.theme.base08}
    palette = 9=#${config.theme.base09}
    palette = 10=#${config.theme.base0A}
    palette = 11=#${config.theme.base0B}
    palette = 12=#${config.theme.base0C}
    palette = 13=#${config.theme.base0D}
    palette = 14=#${config.theme.base0E}
    palette = 15=#${config.theme.base0F}
    background = ${config.theme.background}
    foreground = ${config.theme.foreground}
    cursor-color = ${config.theme.cursor-color}
    selection-background = ${config.theme.selection-background}
    selection-foreground = ${config.theme.selection-foreground}
  '';
}
