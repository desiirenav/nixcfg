{inputs,pkgs,... }: {
  environment.systemPackages = [
    (inputs.wrapperModules.kitty.apply {
      inherit pkgs;
      "kitty.conf".content = ''
        font_size 10.0
      '';
    }).wrapper
  ];
}
