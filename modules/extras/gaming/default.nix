{
  config,
  pkgs,
  inputs,
  ...
}: {
   
  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig;

  environment.systemPackages = with pkgs; [
    mangohud
    qbittorrent
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs = {
    an-anime-game-launcher.enable = true;
    sleepy-launcher.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
  };

  environment.persistence."/persist/system" = {
    users.narayan = {
      directories = [
        ".local/share/Steam"
        ".local/share/anime-game-launcher"
        ".local/share/sleepy-launcher"
        ".steam"
        "Games"
      ];
    };
  };
}
