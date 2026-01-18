{inputs,pkgs,... }: {
  programs.niri = {
    enable = true;
    package = (inputs.wrappers.wrapperModules.niri.apply {
      inherit pkgs;
      "config.kdl".path = "/home/narayan/nixcfg/modules/packages/niri/config.kdl";
    }).wrapper;
  };
}
