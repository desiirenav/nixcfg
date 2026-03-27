{ inputs, ...}: {
  flake.nixosModules.hjem = {pkgs, ...}: {
    imports = [ inputs.hjem.nixosModules.default ]; 
    
    config = {
      hjem = {
        users.narayan = {
          enable = true;
          directory = "/home/narayan";
          user = "narayan";
        };
        linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
      };
    };
  };
}
