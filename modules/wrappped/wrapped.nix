{self, ...}: {
  flake.modules.wrapped = {
    pkgs,
    lib,
    ...
  }: let
    inherit (lib) getExe;
    selfpkgs = self.packages."${pkgs.system}";
  in {
    environment.systemPackages = [
      selfpkgs.terminal
    ];
  };
}
