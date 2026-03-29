{ inputs, pkgs, self, ... }: 
{
  flake.nixosModules.pkgs = { inputs, pkgs, ... }: {
    
    programs.fish = {
      enable = true;
      package = self.packages."${pkgs.stdenv.hostPlatform.system}".fish-wrapper;
    };

    programs.niri = {
      enable = true;
      package = self.packages."${pkgs.stdenv.hostPlatform.system}".niri;
    };
 
    environment.pathsToLink = [ "/libexec" ];
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };
   
      windowManager.i3 = {
        enable = true;
      };
    };

    services.displayManager.gdm.enable = false;
    services.xserver.displayManager.lightdm.enable = false;


    environment.systemPackages = with pkgs; [
      nautilus
      swaybg
      gtk3
      gtk4
      vlc
      xhost
      xinit
      telegram-desktop
      whitesur-cursors
      wl-clipboard
      xwayland-satellite
      rofi
      perl5Packages.Apppapersway
      krita
      weylus
      self.packages."${pkgs.stdenv.hostPlatform.system}".kitty
      self.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
      self.packages."${pkgs.stdenv.hostPlatform.system}".neovim
      self.packages."${pkgs.stdenv.hostPlatform.system}".git
      self.packages."${pkgs.stdenv.hostPlatform.system}".fuzzel
      yazi
      typst
      starship
      (discord.override { withVencord = true;})
      adwaita-icon-theme
      transmission_4-gtk
      brightnessctl
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
      ani-cli
      adw-gtk3
      unzip
      fastfetch
      zathura
    ]; 
  };
}
