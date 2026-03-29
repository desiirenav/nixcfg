{ inputs,... }: {
  perSystem = {pkgs, ...}: let
    fish-config = pkgs.writeText "config.fish" ''
      set -g fish_greeting
      set -gx EDITOR nvim
      command -qv nvim && alias vim nvim
      starship init fish | source
    '';
  in {
    packages.fish-wrapper = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.fish;
      flags = {
        "-C" = "source ${fish-config}";
      };
    };
  };
}
