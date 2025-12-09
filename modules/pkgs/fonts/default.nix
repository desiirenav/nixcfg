{ inputs, pkgs, ...}:{ 

  fonts = {
    packages = with pkgs; [
	   inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro-nerd
      nerd-fonts.mononoki
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "SFProDisplay Nerd Font"];
        sansSerif = ["SFProDisplay Nerd Font"];
        monospace = [ "Mononoki Nerd Font"];
      };
    };
  };
}
