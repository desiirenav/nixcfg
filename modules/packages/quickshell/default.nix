{ inputs,... }: {
  perSystem = {pkgs, ...}: let
  in {
    packages.quickshell = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.quickshell;
      flags = {
        "-c" = "/home/narayan/nixcfg/modules/packages/quickshell/config";
      };
    };
  };
}
