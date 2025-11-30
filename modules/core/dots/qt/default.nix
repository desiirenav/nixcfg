{config, ...}: let
  qtct = ''
[ColorScheme]
active_colors=#${config.theme.base05}, #${config.theme.base01}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #${config.theme.base05}, #ffffff, #${config.theme.base05}, #${config.theme.base00}, #${config.theme.base00}, #${config.theme.base02}, #${config.theme.base0D}, #${config.theme.base00}, #${config.theme.base0E}, #${config.theme.base0D}, #${config.theme.base01}, #${config.theme.base00}, #${config.theme.base01}, #${config.theme.base05}, #${config.theme.base0E}
disabled_colors=#${config.theme.base03}, #${config.theme.base01}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #${config.theme.base03}, #ffffff, #${config.theme.base03}, #${config.theme.base00}, #${config.theme.base00}, #${config.theme.base02}, #${config.theme.base02}, #${config.theme.base03}, #${config.theme.base03}, #${config.theme.base02}, #${config.theme.base01}, #${config.theme.base00}, #${config.theme.base01}, #${config.theme.base03}, #${config.theme.base03}
inactive_colors=#${config.theme.base04}, #${config.theme.base01}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #${config.theme.base04}, #ffffff, #${config.theme.base04}, #${config.theme.base00}, #${config.theme.base00}, #${config.theme.base02}, #${config.theme.base0D}, #${config.theme.base00}, #${config.theme.base0E}, #${config.theme.base0D}, #${config.theme.base01}, #${config.theme.base00}, #${config.theme.base01}, #${config.theme.base04}, #${config.theme.base0E}
  '';
in {
  hjem.users.narayan.files = {
    ".config/qt5ct/colors/lavender.conf".text = qtct;
    ".config/qt6ct/colors/lavender.conf".text = qtct;
  };
} 
