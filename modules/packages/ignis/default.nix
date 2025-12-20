{ config, inputs, pkgs, ... }: {
  environment.systemPackages = [
    (inputs.wrappers.lib.wrapPackage {
      package = (pkgs.inputs.ignis.packages.${pkgs.system}.default.override {
        enableAudioService = true;
	useDartSass = true;
	extraPackages = [];
      });
      flags = {
        "init" = {};
	"run-file" = "/home/narayan/nixcfg/modules/packages/ignis/config";
      };
    })
  ];
}
