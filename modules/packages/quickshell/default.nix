{ inputs, pkgs, ... }: {
  environment.systemPackages = [
    (inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.quickshell;
      flags = {
        "-c"= "./";
      };
    })
  ];
}
