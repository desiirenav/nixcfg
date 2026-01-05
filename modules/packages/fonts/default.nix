{ inputs, pkgs, ...}:{ 

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
      (callPackage ./apple-fonts.nix {})
      sf-mono-liga-bin
      material-symbols
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "SF Pro Display"];
        sansSerif = ["SF Pro Display"];
        monospace = [ "Liga SFMono Nerd Font" ];
      };
    };
  };
}
