{ inputs, pkgs, ... }: {
  environment.systemPackages = [
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
      '';
    }).wrapper
  ];
}
