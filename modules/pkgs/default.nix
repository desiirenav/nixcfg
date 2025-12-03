{inputs,pkgs,... }: {
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
    vesktop
    ghostty
    pywalfox-native
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
    git
  ];
}
