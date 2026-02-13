{ self, inputs, lib, ...}: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme; 
  in {
    packages.fuzzel = (inputs.wrappers.wrapperModules.fuzzel.apply {
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
        background=${theme.base00}ff
        text=${theme.base07}ff
        placeholder=${theme.base03}ff
        prompt=${theme.base05}ff
        input=${theme.base05}ff
        match=${theme.base0A}ff
        selection=${theme.base03}ff
        selection-text=${theme.base05}ff
        selection-match=${theme.base0A}ff
        counter=${theme.base06}ff
        border=${theme.base0D}ff
      '';
    }).wrapper;
  };
}
