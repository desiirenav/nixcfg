{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.narayan.shell = pkgs.fish;

  hjem.users.narayan.files = {
    ".config/fish/config.fish".text = ''
    set -g fish_greeting
#    fish_config theme choose "Matugen"
    starship init fish | source
#    fish_config theme choose "Matugen"
    set -gx EDITOR nvim
    command -qv nvim && alias vim nvim
    if status is-login
      if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
        exec niri-session -l
      end
    end
    '';
  };
  environment.persistence."/persist/system" = {
    users.narayan = {
      directories = [
        ".local/share/fish"
      ];
    };
  };
}
