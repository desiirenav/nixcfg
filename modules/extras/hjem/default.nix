{
  inputs,
  pkgs,
  ...
}: {
  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    users.narayan = {
      enable = true;
      directory = "/home/narayan";
      user = "narayan";
    };
    clobberByDefault = true;
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
  };
}
