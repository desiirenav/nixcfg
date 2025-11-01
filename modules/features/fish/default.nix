{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.narayan.shell = pkgs.fish;

  hjem.users.narayan.files = {
    ".config/fish/config.fish".text = ''
    set -g fish_greeting
    fish_config theme choose "Matugen"
    starship init fish | source
    '';
  };
  environment.persistence."/persist/system" = {
    users.narayan = {
      directories = [
        ".config/fish"
      ];
    };
  };
}
