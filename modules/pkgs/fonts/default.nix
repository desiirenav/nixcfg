{ inputs, pkgs, ...}:{ 

  fonts = {
    packages = with pkgs; [
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
