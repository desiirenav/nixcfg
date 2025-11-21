{ pkgs, inputs, config, ... }:

{ 
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    kitty
    fuzzel
    starship
    (callPackage ./neovim.nix {})
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
