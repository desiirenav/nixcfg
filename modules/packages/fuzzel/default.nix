{ config, inputs, pkgs }:

(inputs.wrappers.wrapperModules.fuzzel.apply {
  inherit pkgs;
  "fuzzel.ini".content = ''
    width=30
    lines=6
    anchor=top
    horizontal-pad=10
    vertical-pad=8
    inner-pad=2

    icons-enabled=no
    y-margin=20

    [border]
    # Thinner border
    width=1
    radius=0

    [colors]
    background=${config.theme.base00}ff
    text=${config.theme.base07}ff
    placeholder=${config.theme.base03}ff
    prompt=${config.theme.base05}ff
    input=${config.theme.base05}ff
    match=${config.theme.base0A}ff
    selection=${config.theme.base03}ff
    selection-text=${config.theme.base05}ff
    selection-match=${config.theme.base0A}ff
    counter=${config.theme.base06}ff
    border=${config.theme.base0D}ff
  '';
}).wrapper
