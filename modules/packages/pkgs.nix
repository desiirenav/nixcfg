{ inputs, pkgs, self, ... }: 
{
  flake.nixosModules.pkgs = { inputs, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      vlc
      krita
      unzip
      weylus
      ani-cli
      zathura
      nautilus
      fastfetch
      wl-clipboard
      brightnessctl
      transmission_4-gtk
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ]; 
  };
}
