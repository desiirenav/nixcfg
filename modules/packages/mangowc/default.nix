{ inputs, pkgs, ... }:
let
  mangowc-wrapper = inputs.wrappers.lib.wrapPackage {
    inherit pkgs;
    package = pkgs.mangowc;
    flags."-c" = "/home/narayan/nixcfg/modules/packages/mangowc/config.conf";
  };
in {
   programs.mango = {
    enable = true;
    package = mangowc-wrapper;
  };
}
   
