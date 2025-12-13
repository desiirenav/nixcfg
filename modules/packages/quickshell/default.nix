{ config, inputs, pkgs, ... }: {
  environment.systemPackages = [
    (inputs.wrappers.lib.makeWrapper {
      inherit pkgs;
      package = pkgs.quickshell;
      flags = {
        "-c"= "./";
      };
    })
  ];
}
