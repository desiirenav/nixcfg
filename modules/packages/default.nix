{ config, inputs, pkgs, ... }: {
  imports = [
    ./fish
    ./fonts
    ./fuzzel
    ./gaming
    ./git
    ./kitty
    ./neovim
    ./niri
    ./others
  ];
}
