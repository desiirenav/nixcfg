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
      };
    };
  };
  

  hjem.users.narayan.files = {
    ".mozilla/profiles.ini".text = ''
	[Profile0]
	Name=narayan
	IsRelative=1
	Path=narayan.default
	Default=1

	[General]
	StartWithLastProfile=1
	Version=2
    '';
    ".mozilla/firefox/narayan.default/chrome".text = ''
	@import "firefox-gnome-theme/userChrome.css";

	/* This is strongly inspired by ../gtk/gtk.mustache. */
	:root {
	  /* Palette */
	  --gnome-palette-blue-1: #${config.theme.base0D};
	  --gnome-palette-blue-2: #${config.theme.base0D};
	  --gnome-palette-blue-3: #${config.theme.base0D};
	  --gnome-palette-blue-4: #${config.theme.base0D};
	  --gnome-palette-blue-5: #${config.theme.base0D};
	  --gnome-palette-green-1: #${config.theme.base0B};
	  --gnome-palette-green-2: #${config.theme.base0B};
	  --gnome-palette-green-3: #${config.theme.base0B};
	  --gnome-palette-green-4: #${config.theme.base0B};
	  --gnome-palette-green-5: #${config.theme.base0B};
	  --gnome-palette-yellow-1: #${config.theme.base0A};
	  --gnome-palette-yellow-2: #${config.theme.base0A};
	  --gnome-palette-yellow-3: #${config.theme.base0A};
	  --gnome-palette-yellow-4: #${config.theme.base0A};
	  --gnome-palette-yellow-5: #${config.theme.base0A};
	  --gnome-palette-orange-1: #${config.theme.base09};
	  --gnome-palette-orange-2: #${config.theme.base09};
	  --gnome-palette-orange-3: #${config.theme.base09};
	  --gnome-palette-orange-4: #${config.theme.base09};
	  --gnome-palette-orange-5: #${config.theme.base09};
	  --gnome-palette-red-1: #${config.theme.base08};
	  --gnome-palette-red-2: #${config.theme.base08};
	  --gnome-palette-red-3: #${config.theme.base08};
	  --gnome-palette-red-4: #${config.theme.base08};
	  --gnome-palette-red-5: #${config.theme.base08};
	  --gnome-palette-purple-1: #${config.theme.base0E};
	  --gnome-palette-purple-2: #${config.theme.base0E};
	  --gnome-palette-purple-3: #${config.theme.base0E};
	  --gnome-palette-purple-4: #${config.theme.base0E};
	  --gnome-palette-purple-5: #${config.theme.base0E};
	  --gnome-palette-brown-1: #${config.theme.base0F};
	  --gnome-palette-brown-2: #${config.theme.base0F};
	  --gnome-palette-brown-3: #${config.theme.base0F};
	  --gnome-palette-brown-4: #${config.theme.base0F};
	  --gnome-palette-brown-5: #${config.theme.base0F};
	  --gnome-palette-light-1: #${config.theme.base05};
	  --gnome-palette-light-2: #${config.theme.base05};
	  --gnome-palette-light-3: #${config.theme.base05};
	  --gnome-palette-light-4: #${config.theme.base05};
	  --gnome-palette-light-5: #${config.theme.base05};
	  --gnome-palette-dark-1: #${config.theme.base05};
	  --gnome-palette-dark-2: #${config.theme.base05};
	  --gnome-palette-dark-3: #${config.theme.base05};
	  --gnome-palette-dark-4: #${config.theme.base05};
	  --gnome-palette-dark-5: #${config.theme.base05};

	  /* Colors */
	  --gnome-warning-bg: #${config.theme.base0E};

	  /* Window */
	  --gnome-window-background: #${config.theme.base00};
	  --gnome-window-color: #${config.theme.base05};
	  --gnome-view-background: #${config.theme.base00};
	  --gnome-sidebar-background: #${config.theme.base01};
	  --gnome-secondary-sidebar-background: #${config.theme.base01};

	  /* Card */
	  --gnome-card-background: #${config.theme.base01};
	  --gnome-card-shade-color: rgba(0, 0, 0, 0.07);

	  /* Menu */
	  --gnome-menu-background: #${config.theme.base01};

	  /* Headerbar */
	  --gnome-headerbar-background: #${config.theme.base01};
	  --gnome-headerbar-shade-color: rgba(0, 0, 0, 0.07);

	  /* Toolbar */
	  --gnome-toolbar-icon-fill: #${config.theme.base05};

	  /* Tabs */
	  --gnome-tabbar-tab-hover-background: color-mix(in srgb, #${config.theme.base01}, #${config.theme.base02} 75%);
	  --gnome-tabbar-tab-active-background: #${config.theme.base02};
	  --gnome-tabbar-tab-active-background-contrast: #${config.theme.base02};
	  --gnome-tabbar-tab-active-hover-background: color-mix(in srgb, #${config.theme.base02}, #${config.theme.base03} 25%);

	  /* Private Tabs */
	  --gnome-private-wordmark: #${config.theme.base04};
	  --gnome-private-in-content-page-background: #${config.theme.base00};
	  --gnome-private-text-primary-color: #${config.theme.base04};

	  &:-moz-window-inactive {
	    --gnome-tabbar-tab-hover-background: var(--gnome-tabbar-tab-hover-background);
	    --gnome-tabbar-tab-active-background: var(--gnome-tabbar-tab-active-background);
	  }
	}
    '';
  };
}
