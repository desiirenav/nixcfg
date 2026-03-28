{inputs,pkgs,... }: {
  programs.niri = {
    enable = true;
    package = (inputs.wrappers.wrapperModules.i3.apply {
      inherit pkgs;
      "config".path = "/home/narayan/nixcfg/modules/packages/i3/config";
    }).wrapper;
  };
}
