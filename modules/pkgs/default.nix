{inputs,pkgs,... }: {
  imports = [
    ./fonts
    ./gaming
    ./neovim
    ./tmux
    inputs.walker.nixosModules.default
  ];

  programs.walker.enable = true;

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    kitty
    starship
    vesktop
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
