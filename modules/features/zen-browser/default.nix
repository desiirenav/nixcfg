{ config, pkgs, ... }:

let
  zenProfilesIni = pkgs.writeText "profiles.ini" ''
    [Profile0]
    Name=narayan
    IsRelative=1
    Path=narayan.default
    Default=1

    [General]
    StartWithLastProfile=1
    Version=2
  '';

  zenUserJs = pkgs.writeText "user.js" ''
    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
  '';

  userChromeCss = pkgs.writeText "userChrome.css" (import ./userChrome.nix { inherit config; });
  userContentCss = pkgs.writeText "userContent.css" (import ./userContent.nix { inherit config; });
in
{
  system.activationScripts.zenBrowser.text = ''
    ln -sf ${zenProfilesIni} /home/narayan/.zen/profiles.ini
    ln -sf ${zenUserJs} /home/narayan/.zen/narayan.default/user.js
    ln -sf ${userChromeCss} /home/narayan/.zen/narayan.default/chrome/userChrome.css
    ln -sf ${userContentCss} /home/narayan/.zen/narayan.default/chrome/userContent.css
  '';
}

