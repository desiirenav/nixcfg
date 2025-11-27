{ pkgs, inputs, config, ... }:

{ 
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    kitty
    fuzzel
    ghostty
    starship
    vesktop
    pywalfox-native
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
