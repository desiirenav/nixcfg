{ config, lib,pkgs,inputs,system,...}: 

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.caskaydia-cove
      inter
      corefonts
      lmodern
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Inter" ];
        sansSerif = ["Inter"];
        monospace = [ "CaskaydiaCove Nerd Font Mono" ];
      };
    };
  };
}
