{
  config,
  pkgs,
  inputs,
  ...
}: {

  nix.settings = inputs.aagl.nixConfig;

  environment.systemPackages = with pkgs; [
    mangohud
    qbittorrent
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;

  networking.mihoyo-telemetry.block = true;
  programs = {
    sleepy-launcher.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  environment.persistence."/persist/system" = {
    users.narayan = {
      directories = [
        ".local/share/Steam"
        ".local/share/sleepy-launcher"
        ".steam"
      ];
    };
  };



}
