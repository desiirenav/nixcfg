{ config, lib, ...}: 

{
  hjem.users.narayan.files.".config/fuzzel/fuzzel.ini".text = ''
    background = ${config.theme.base00}
    text = ${config.theme.base05}
    placeholder = ${config.theme.base03}
    prompt = ${config.theme.base05}
    input = ${config.theme.base05}
    match = ${config.theme.base0A}
    selection = ${config.theme.base03}
    selection-text = ${config.theme.base05}
    selection-match = ${config.theme.base0A}
    counter = ${config.theme.base06}
    border = ${config.theme.base0D}
  '';
}
