{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    gtk3
    gtk4
    vlc
    whitesur-cursors
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
