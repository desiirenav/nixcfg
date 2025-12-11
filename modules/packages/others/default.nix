{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    starship
    pywalfox-native
    vesktop
    capitaine-cursors
    adwaita-icon-theme
    transmission_4-gtk
    xwayland-satellite
    brightnessctl
    ani-cli
    adw-gtk3
    unzip
    fastfetch
    zathura
  ];

}
