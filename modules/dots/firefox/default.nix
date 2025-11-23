{ inputs, config, lib, pkgs, ... }:
let
  pywalfox-wrapper = pkgs.writeShellScriptBin "pywalfox-wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in
{
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

  hjem.users.narayan.files = {
    ".mozilla/native-messaging-hosts/pywalfox.json".text = lib.replaceStrings [ "<path>" ] [
      "${pywalfox-wrapper}/bin/pywalfox-wrapper"
      ] (lib.readFile "${pkgs.pywalfox-native}/lib/python3.13/site-packages/pywalfox/assets/manifest.json");
    ".cache/wal/colors.json".text = ''
	{
	  "wallpaper": "",
	  "alpha": "100",
	  "colors": {
	    "color0": "#${config.theme.base00}",
	    "color1": "",
	    "color2": "",
	    "color3": "",
	    "color4": "",
	    "color5": "",
	    "color6": "",
	    "color7": "",
	    "color8": "",
	    "color9": "",
	    "color10": "#${config.theme.base07}",
	    "color11": "",
	    "color12": "",
	    "color13": "#${config.theme.base07}",
	    "color14": "",
	    "color15": "#${config.theme.base07}"
	  }
	}
    '';
  };
}
