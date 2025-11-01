{ inputs, config, lib, pkgs, ... }:

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
      };
    };
  };
}

