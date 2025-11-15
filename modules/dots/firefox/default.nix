{ inputs, config, lib, pkgs, ... }:
let
  pywalfox-wrapper = pkgs.writeShellScriptBin "pywalfox-wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in
{
  environment.persistence."/persist/system" = { 
    users.narayan = {
      directories = [
        ".mozilla"
        ".zen"
      ];
    };
  };

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

  hjem.users.narayan.files.".mozilla/native-messaging-hosts/pywalfox.json".text = lib.replaceStrings [ "<path>" ] [
    "${pywalfox-wrapper}/bin/pywalfox-wrapper"
  ] (lib.readFile "${pkgs.pywalfox-native}/lib/python3.13/site-packages/pywalfox/assets/manifest.json");
}

