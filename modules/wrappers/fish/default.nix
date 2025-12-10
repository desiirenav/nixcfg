{ inputs, pkgs, ... }:
let
  fish-wrapper = inputs.wrappers.lib.wrapPackage {
    inherit pkgs;
    package = pkgs.fish;
    args = [
      "--init-command"
      ''
        set -g fish_greeting
        set -gx EDITOR nvim
        command -qv nvim && alias vim nvim
        starship init fish | source
      ''
    ];
  };
in {
  programs.fish = {
    enable = true;
    package = fish-wrapper;
  };

  users.users.narayan.shell = fish-wrapper;
}
