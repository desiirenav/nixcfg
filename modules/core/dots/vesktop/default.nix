{config, ...}: {
  hjem.users.narayan.files = {
    ".config/vesktop/themes/base16.css".text = ''
      @import url("https://mrtipson.github.io/DiscordCSS/css/base.css");

      .theme-light, .theme-dark {
        --base00: #${config.theme.base00};
        --base01: #${config.theme.base01};
        --base02: #${config.theme.base02};
        --base03: #${config.theme.base03};
        --base04: #${config.theme.base04};
        --base05: #${config.theme.base05};
        --base06: #${config.theme.base06};
        --base07: #${config.theme.base07};
        --base08: #${config.theme.base08};
        --base09: #${config.theme.base09};
        --base0A: #${config.theme.base0A};
        --base0B: #${config.theme.base0B};
        --base0C: #${config.theme.base0C};
        --base0D: #${config.theme.base0D};
        --base0E: #${config.theme.base0E};
        --base0F: #${config.theme.base0F};

        --window-opacity: 1;
      }
      .theme-light.theme-light, .theme-dark.theme-dark {
        --header-primary: var(--text-normal);
        --header-secondary: var(--text-normal);
        --text-normal: var(--base0F);
        --background-primary: var(--base00);
        --background-secondary: var(--base0B);
        --background-secondary-alt: transparent;
        --background-tertiary: var(--base0B) !important;
        --background-floating: var(--base00);
        --modal-footer-background: var(--base0B);
        --chat-background-default: var(--background-tertiary);
        --deprecated-store-bg: var(--background-primary);
        --deprecated-quickswitcher-input-background: transparent;
        --deprecated-card-editable-bg: var(--deprecated-card-bg);
        --autocomplete-bg: var(--background-floating);
        --interactive-normal: var(--base0E);
        --interactive-muted: var(--base0C);
        --interactive-hover: var(--interactive-active);
        --text-link: var(--base09);
        --interactive-active: var(--color-main);
        --text-muted: var(--base0C);
        --info-warning-foreground: var(--base0C);
        --channels-default: var(--text-normal);
        --background-accent: var(--background-secondary);
        --background-message-hover: var(--base0B);
        --background-modifier-accent: var(--base0B);
        --background-modifier-hover: var(--base0B);
        --background-modifier-active: var(--base0B);
        --background-modifier-selected: var(--base0B);
        --deprecated-card-bg: var(--background-secondary);
        --scrollbar-thin-thumb: var(--base0B);
        --scrollbar-thin-track: transparent;
        --scrollbar-auto-thumb: var(--base0B);
        --scrollbar-auto-track: var(--base0B);
        --bg-base-primary: var(--background-primary);
        --user-profile-overlay-background: var(--base0B);
        --color-main: var(--base08);
        --background-image: none;
        --background-filter: none;
        --background-markup: var(--background-tertiary);
        --background-embed: var(--background-tertiary);
        --background-modal: var(--base0B);
        --background-dropdown: var(--background-floating);
        --background-color: var(--base0B);
        --progress-thumb: var(--text-muted);
        --progress-track-full: var(--base0B);
        --progress-track-empty: var(--base0B);
        --folder-shadow: -1px 0px 3px 0px var(--base0C);
      }
    '';
  };
}
