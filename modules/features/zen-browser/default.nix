{ config, lib, pkgs, ... }:

let
  zenProfiles = pkgs.writeTextFile {
    name = "profiles.ini";
    destination = ".zen/profiles.ini";
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
#  zenUserJs = pkgs.writeText "user.js" ''
#    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
#  '';
  userChrome = pkgs.writeText "userChrome.css" (import ./userChrome.nix { inherit config; });
  userContent = pkgs.writeText "userContent.css" (import ./userContent.nix { inherit config; });
in
{
  system.activationScripts.firefoxProfile.text = ''
    ln -sf ${zenProfiles}/.zen/profiles.ini /home/narayan/.zen/profiles.ini
    ln -sf ${userChrome}/home/narayan/.zen/narayan.default/userChrome.css /home/narayan/.zen/narayan.default/userChrome.css
    ln -sf ${userContent}/home/narayan/.zen/narayan.default/userContent.css /home/narayan/.zen/narayan.default/userContent.css
#    ln -sf ${firefoxUserJs} /home/narayan/.zen/narayan.default/user.js
    chown -R narayan:users /home/narayan/.zen
  '';
}

