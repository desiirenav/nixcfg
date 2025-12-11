{ pkgs, config, ... }:

let
  firefoxProfiles = pkgs.writeTextFile {
    name = "profiles.ini";
    destination = "/.mozilla/firefox/profiles.ini";
    text = ''
      [Profile0]
      Name=narayan
      IsRelative=1
      Path=narayan.default
      Default=1

      [General]
      StartWithLastProfile=1
      Version=2
    '';
  };

  userChromeCss = pkgs.writeText "userChrome.css" (import ./userChrome.nix { inherit config; });
in
{
  system.activationScripts.firefoxProfile.text = ''
    ln -sf ${firefoxProfiles}/.mozilla/profiles.ini /home/narayan/.mozilla/profiles.ini

    mkdir -p /home/narayan/.mozilla/narayan.default/chrome
    ln -sf ${userChromeCss} /home/narayan/.mozilla/firefox/narayan.default/chrome/userChrome.css
  '';
}

