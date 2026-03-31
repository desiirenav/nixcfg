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
  
      displayManager = {
        lightdm.enable = true;
      };

      windowManager.i3 = {
        enable = true;
	package = self.packages."${pkgs.stdenv.hostPlatform.system}".i3;
      };
    };

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    }
 
    environment.systemPackages = with pkgs; [
      nautilus
      swaybg
      gtk3
      gtk4
      vlc
      tg
      telegram-desktop
      whitesur-cursors
      xwayland-satellite
      wl-clipboard
      krita
      weylus
      self.packages."${pkgs.stdenv.hostPlatform.system}".kitty
      self.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
      self.packages."${pkgs.stdenv.hostPlatform.system}".neovim
      self.packages."${pkgs.stdenv.hostPlatform.system}".git
      self.packages."${pkgs.stdenv.hostPlatform.system}".fuzzel
      self.packages."${pkgs.stdenv.hostPlatform.system}".rofi
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
