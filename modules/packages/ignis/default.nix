{ config, inputs, pkgs, ... }: {
  environment.systemPackages = [
    (inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = (inputs.ignis.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
        enableAudioService = true;
	useDartSass = true;
	extraPackages = [];
      });
      flags = {
        "init" = "";
	"run-file" = "/home/narayan/nixcfg/modules/packages/ignis/config";
      };
    })
  ];
}
