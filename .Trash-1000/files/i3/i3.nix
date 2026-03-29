{ self, inputs, lib, ...}: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme;
  in {
    packages.i3 = (inputs.wrappers.wrapperModules.i3.apply {
      inherit pkgs;
    }).wrapper;
  };
}
