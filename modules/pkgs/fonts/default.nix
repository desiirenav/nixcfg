{ pkgs,inputs,...}:{ 
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: prev: {
      sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
      pname = "sf-mono-liga-bin";
      version = "dev";
      src = inputs.sf-mono-liga-src;
      dontConfigure = true;
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp -R $src/*.otf $out/share/fonts/opentype/
      '';
     };
   }) 
  ];

  fonts = {
    packages = with pkgs; [
      inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro-nerd
      sf-mono-liga-bin
      (callPackage ./maple-mono { inherit inputs; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "SFProDisplay Nerd Font"];
        sansSerif = ["SFProDisplay Nerd Font"];
        monospace = [ "Liga SFMono Nerd Font" ];
      };
    };
  };
}
