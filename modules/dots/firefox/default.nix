{ inputs, config, lib, pkgs, ... }:
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
        "{e613be14-63c3-4bd9-8a4a-502c12bcf201}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/p-stream-extension/latest.xpi";
          installation_mode = "force_installed";
        };
        "FirefoxColor@mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
