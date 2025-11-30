{pkgs,config,... }: {
  imports = [
    ./fonts
    ./gaming
    ./neovim
    ./tmux
  ];
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    kitty
    fuzzel
    starship
    qbittorrent
    vesktop
    pywalfox-native
    capitaine-cursors
    adwaita-icon-theme
    (callPackage ./adwaita {})
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
