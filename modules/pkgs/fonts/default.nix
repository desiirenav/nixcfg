{ pkgs, ...}:{ 

  fonts = {
    packages = with pkgs; [
      inter
      nerd-fonts.mononoki
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Inter"];
        sansSerif = ["Inter"];
        monospace = [ "Mononoki Nerd Font" ];
      };
    };
  };
}
