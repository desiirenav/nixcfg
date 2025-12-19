{ inputs, pkgs, ... }:
let
  fish-config = pkgs.writeText "config.fish" ''
    set -g fish_greeting
    set -gx EDITOR nvim
    command -qv nvim && alias vim nvim
    starship init fish | source
    if status is-interactive
      if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
        exec niri-session -l
      end
    end
  '';

  fish-wrapper = inputs.wrappers.lib.wrapPackage {
    inherit pkgs;
    package = pkgs.fish;
    flags."-C" = "source ${fish-config}";
  };
in {
  programs.fish = {
    enable = true;
    package = fish-wrapper;
  };
  
  users.users.narayan.shell = fish-wrapper;
}
