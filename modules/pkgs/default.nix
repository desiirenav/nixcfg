{inputs,pkgs,... }: {
  imports = [
    ./fonts
    ./gaming
  ];

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swww
    gtk3
    gtk4
    fuzzel
    (callPackage ./neovim {})
    kitty
    starship
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    vesktop
    capitaine-cursors
    adwaita-icon-theme
    matugen
    xwayland-satellite
    transmission_4-gtk
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
