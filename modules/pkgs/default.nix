{ pkgs,... }: {
  imports = [
    ./fonts
    ./gaming
    ./neovim
  ];
  environment.systemPackages = with pkgs; [
    (inputs.ignis.packages.${pkgs.system}.default.override {
      enableAudioService = true;
      useDartSass = true;
      extraPackages = [
      ];
    })
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
