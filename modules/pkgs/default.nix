{ pkgs, inputs, config, ... }:

{ 
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    vlc
    ffmpeg
    fuzzel
    imagemagick
    matugen
    swww
    termusic
    pywalfox-native
    starship
    (callPackage ./neovim.nix {})
    (callPackage ./kitty.nix {})
    (discord.override {
      withVencord = true;
    })
    capitaine-cursors
    adwaita-icon-theme
    xwayland-satellite
    brightnessctl
    ani-cli
    adw-gtk3
    unzip
    pfetch
    fastfetch
    zathura
    git
  ];
}
