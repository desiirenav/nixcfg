{
  inputs,
  pkgs,
  ...
}: {
  hjem = {
    users.narayan = {
      enable = true;
      directory = "/home/narayan";
      user = "narayan";
    };
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
  };
}
