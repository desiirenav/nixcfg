{inputs,pkgs,... }: {
  imports = [
    ./fonts
    ./gaming
    ./tmux
  ];

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swww
    gtk3
    gtk4
    fuzzel
    (callPackage ./neovim.nix {})
    kitty
    starship
    inputs.zen-browser.packages."${system}".beta
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
