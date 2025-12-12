{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swaybg
    gtk3
    gtk4
    starship
    capitaine-cursors
    adwaita-icon-theme
    transmission_4-gtk
    xwayland-satellite
    brightnessctl
	inputs.zen-browser.packages."${system}".default.override {
	  policies = {
	      DisableAppUpdate = true;
	      DisableTelemetry = true;
	  };
    ani-cli
    adw-gtk3
    unzip
    fastfetch
    zathura
  ];

}
