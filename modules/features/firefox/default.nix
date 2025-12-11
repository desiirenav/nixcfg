{ pkgs, ...}: let
  firefoxProfiles = pkgs.writeTextFile {
    name = "profiles.ini";
    destination = "/.mozilla/firefox/profiles.ini";
    text = builtins.readFile ./profiles.ini;
  };
  mylink = pkgs.writeScript "my-link"
    ''
      #!/usr/bin/env bash
      mkdir -p /home/narayan/.mozilla/firefox
      ln -sf ${firefoxProfiles}/.mozilla/firefox/profiles.ini /home/narayan/.mozilla/firefox/profiles.ini
    '';
in {
  apps.default = {
    type = "app";
    program = "${mylink}";
  };

  formatter = pkgs.nixpkgs-fmt;
}
