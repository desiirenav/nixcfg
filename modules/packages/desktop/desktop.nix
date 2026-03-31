{ inputs, pkgs, self, ... }: 
{
  flake.nixosModules.desktop = { inputs, pkgs, ... }: {

    programs.fish = {
      enable = true;
      package = self.packages."${pkgs.stdenv.hostPlatform.system}".fish-wrapper;
    };

    environment.systemPackages = with pkgs; [
      self.packages."${pkgs.stdenv.hostPlatform.system}".git
      self.packages."${pkgs.stdenv.hostPlatform.system}".rofi
      self.packages."${pkgs.stdenv.hostPlatform.system}".kitty
      self.packages."${pkgs.stdenv.hostPlatform.system}".neovim
      self.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
    ]; 
  };
}
