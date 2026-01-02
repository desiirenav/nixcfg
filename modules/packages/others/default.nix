{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    starship
    capitaine-cursors
    (discord.override { withVencord = true;})
    adwaita-icon-theme
    transmission_4-gtk
    xwayland-satellite
    brightnessctl
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    ani-cli
    adw-gtk3
    unzip
    fastfetch
    zathura
  ];

}
