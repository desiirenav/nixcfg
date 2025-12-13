{ config, inputs, pkgs, ... }: {
  environment.systemPackages = [
    (inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = inputs.qml-niri.packages."${pkgs.stdenv.hostPlatform.system}".quickshell;
      flags = {
        "-c"= "/home/narayan/nixcfg/modules/packages/quickshell/config";
      };
    })
  ];
}
