{ inputs, pkgs, self, ... }: 
{
  flake.nixosModules.display = { inputs, pkgs, ... }: {
    
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
	package = self.packages."${pkgs.stdenv.hostPlatform.system}".i3;
      };
    };

    services = {
      displayManager.gdm.enable = true;
    };
 
    environment.systemPackages = with pkgs; [
      nautilus
      swaybg
      gtk3
      gtk4
      whitesur-cursors
      xwayland-satellite
      self.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
      self.packages."${pkgs.stdenv.hostPlatform.system}".fuzzel
      self.packages."${pkgs.stdenv.hostPlatform.system}".rofi
      adwaita-icon-theme
      adw-gtk3
      unzip
    ]; 
  };
}
