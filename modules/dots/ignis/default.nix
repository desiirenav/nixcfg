{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (inputs.ignis.packages.${pkgs.system}.default.override {
      enableAudioService = true;
      useDartSass = true;
      extraPackages = [
      ];
    })
  ];

  hjem.users.narayan.files = {
    ".config/ignis".source = ./config; 
  };

}
