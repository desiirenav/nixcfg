{ config, lib, ...}: {
  hjem.users.narayan.files.".config/fuzzel/fuzzel.ini".text = ''
    [colors]
    background=${lib.toLower config.theme.base00}ff
    text=${lib.toLower config.theme.base0F}ff
    placeholder=${lib.toLower config.theme.base03}ff
    prompt=${lib.toLower config.theme.base05}ff
    input=${lib.toLower config.theme.base05}ff
    match=${lib.toLower config.theme.base0A}ff
    selection=${lib.toLower config.theme.base03}ff
    selection-text=${lib.toLower config.theme.base05}ff
    selection-match=${lib.toLower config.theme.base0A}ff
    counter=${lib.toLower config.theme.base06}ff
    border=${lib.toLower config.theme.base0D}ff
  '';
}
