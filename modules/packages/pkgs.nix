{ inputs, pkgs, self, ... }: 
{
  flake.nixosModules.pkgs = { inputs, pkgs, ... }: {

  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules = [
      self.nixosModules.display
    ];
  };

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
      vlc
      wl-clipboard
      krita
      weylus
      self.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
      self.packages."${pkgs.stdenv.hostPlatform.system}".neovim
      self.packages."${pkgs.stdenv.hostPlatform.system}".git
      transmission_4-gtk
      brightnessctl
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
      ani-cli
      unzip
      fastfetch
      zathura
    ]; 
  };
}
