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
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    (callPackage ./neovim {})
    vesktop
    capitaine-cursors
    adwaita-icon-theme
    transmission_4-gtk
    matugen
    swww-daemon
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
