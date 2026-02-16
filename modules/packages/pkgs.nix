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

    environment.systemPackages = with pkgs; [
      nautilus
      swaybg
      gtk3
      gtk4
      vlc
      whitesur-cursors
      wl-clipboard
      self.packages."${pkgs.stdenv.hostPlatform.system}".kitty
      self.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
      self.packages."${pkgs.stdenv.hostPlatform.system}".neovim
      self.packages."${pkgs.stdenv.hostPlatform.system}".git
      self.packages."${pkgs.stdenv.hostPlatform.system}".fuzzel
      self.packages."${pkgs.stdenv.hostPlatform.system}".wallpaper
      yazi
      weylus
      telegram-desktop
      xwayland-satellite
      starship
      fuzzel
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
