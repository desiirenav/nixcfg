{inputs, pkgs,...}: {

  nix.settings = inputs.aagl.nixConfig;

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs = {
    gamemode.enable = true;
    anime-game-launcher.enable = true;
    sleepy-launcher.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
  };

}
