{ inputs, pkgs, ... }:let
  fish-wrapper = (inputs.wrappers.wrapperModules.fish.apply {
    inherit pkgs;
    "config.fish".content = ''
      set -g fish_greeting
      set -gx EDITOR nvim
      command -qv nvim && alias vim nvim
      starship init fish | source
    '';
  }).wrapper;
in {
   programs.fish = {
     enable = true;
     package = fish-wrapper;
   };

   users.users.narayan.shell = fish-wrapper;
}
