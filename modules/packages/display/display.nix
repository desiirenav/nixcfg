{ inputs, pkgs, self, ... }: 
{
  flake.nixosModules.display = { inputs, pkgs, ... }: {
    
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
      adwaita-icon-theme
      adw-gtk3
      unzip
    ]; 
  };
}
