{ config, lib, ...}: {

  hjem.users.narayan.files.".config/ghostty/config".text = ''
    font-family = "Liga SFMono Nerd Font"
    font-style = Medium
    font-size = 11
  '';
}
