{config}:
''
	/**
	* @name base16 {{scheme-name}}
	* @author {{scheme-author}}
	* @version 1.0.0
	* @description base16 {{scheme-name}} theme generated from https://github.com/tinted-theming/schemes
	**/

	:root {
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
	    --primary-630: var(--base00); /* Autocomplete background */
	    --primary-660: var(--base00); /* Search input background */
	}

	.theme-light, .theme-dark {
	    --search-popout-option-fade: none; /* Disable fade for search popout */
	    --bg-overlay-2: var(--base00); /* These 2 are needed for proper threads coloring */
	    --home-background: var(--base00);
	    --background-primary: var(--base00);
	    --background-secondary: var(--base01);
	    --background-secondary-alt: var(--base01);
	    --channeltextarea-background: var(--base01);
	    --background-tertiary: var(--base00);
	    --background-accent: var(--base0E);
	    --background-floating: var(--base01);
	    --background-modifier-selected: var(--base00);
	    --text-normal: var(--base05);
	    --text-secondary: var(--base00);
	    --text-muted: var(--base03);
	    --text-link: var(--base0C);
	    --interactive-normal: var(--base05);
	    --interactive-hover: var(--base0C);
	    --interactive-active: var(--base0A);
	    --interactive-muted: var(--base03);
	    --header-primary: var(--base06);
	    --header-secondary: var(--base03);
	    --scrollbar-thin-track: transparent;
	    --scrollbar-auto-track: transparent;
	}
''
