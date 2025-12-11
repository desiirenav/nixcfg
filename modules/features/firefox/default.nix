{ config, lib, pkgs, ... }:

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

  walColorsJson = pkgs.writeText "colors.json" ''
    {
      "wallpaper": "",
      "alpha": "100",
      "colors": {
        "color0":  "#${config.theme.base00}",
        "color1":  "#${config.theme.base08}",
        "color2":  "#${config.theme.base0B}",
        "color3":  "#${config.theme.base0A}",
        "color4":  "#${config.theme.base0D}",
        "color5":  "#${config.theme.base0E}",
        "color6":  "#${config.theme.base0C}",
        "color7":  "#${config.theme.base05}",
        "color8":  "#${config.theme.base03}",
        "color9":  "#${config.theme.base08}",
        "color10": "#${config.theme.base0B}",
        "color11": "#${config.theme.base0A}",
        "color12": "#${config.theme.base0D}",
        "color13": "#${config.theme.base0E}",
        "color14": "#${config.theme.base0C}",
        "color15": "#${config.theme.base07}"
      }
    }
  '';

  pywalfox-wrapper = pkgs.writeShellScriptBin "pywalfox-wrapper" ''
    exec ${pkgs.pywalfox-native}/bin/pywalfox "$@"
  '';

  pywalfoxJson = pkgs.writeText "pywalfox.json" (
    lib.replaceStrings
      [ "<path>" ]
      [ "${pywalfox-wrapper}/bin/pywalfox-wrapper" ]
      (lib.readFile
        "${pkgs.pywalfox-native}/lib/python3.13/site-packages/pywalfox/assets/manifest.json")
  );

  firefoxUserJs = pkgs.writeText "user.js" ''
    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
  '';
in
{
  system.activationScripts.firefoxProfile.text = ''
    ln -sf ${firefoxProfiles}/.mozilla/firefox/profiles.ini /home/narayan/.mozilla/firefox/profiles.ini
    ln -sf ${pywalfoxJson} /home/narayan/.mozilla/native-messaging-hosts/pywalfox.json
    ln -sf ${walColorsJson} /home/narayan/.cache/wal/colors.json
    ln -sf ${firefoxUserJs} /home/narayan/.mozilla/firefox/narayan.default/user.js

    chown -R narayan:users /home/narayan/.mozilla
    chown -R narayan:users /home/narayan/.cache
  '';

  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "pywalfox@frewacom.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/pywalfox/latest.xpi";
        };
      };
    };
  };
}

