{ config, inputs, pkgs, ... }: {
  imports = [
    ./fish
    ./fonts
    ./gaming
    ./neovim
    ./niri
  ];

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    starship
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    vesktop
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
  ] ++ 
  [
    (callPackage ./kitty { inherit config inputs; })
    (callPackage ./fuzzel { inherit config inputs; })
    (callPackage ./git { inherit inputs; })
  ];
}
