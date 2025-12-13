{ config, inputs, pkgs, ... }: {
  environment.systemPackages = [
    (inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = inputs.qml-niri.packages."${pkgs.stdenv.hostPlatform.system}".quickshell;
      env = {
        theme00 = "${config.theme.base00}";
      };
      flags = {
        "-c"= "/home/narayan/nixcfg/modules/packages/quickshell/config";
      };
    })
  ];
}
