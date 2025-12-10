{inputs,pkgs,... }: {
  environment.systemPackages = [
    (inputs.wrappers.wrapperModules.kitty.apply {
      inherit pkgs;
      "kitty.conf".content = ''
        font_size 12.0
      '';
    }).wrapper
  ];
}
