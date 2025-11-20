{ inputs, pkgs, ... }:

inputs.wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.kitty;
}
