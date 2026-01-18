{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    swww
    gtk3
    gtk4
    vlc
    wl-clipboard
    telegram-desktop
    xwayland-satellite
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
}
