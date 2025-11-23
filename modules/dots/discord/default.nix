{ pkgs, config, ... }:

{
  hjem.users.narayan.files = {
    ".config/vesktop/themes/midnight-discord.css".text = ''
/**
 * @name midnight
 * @description a dark, customizable discord theme.
 * @author refact0r
 * @version 2.1.1
 * @invite nz87hXyvcy
 * @website https://github.com/refact0r/midnight-discord
 * @source https://github.com/refact0r/midnight-discord/blob/master/themes/midnight.theme.css
 * @authorId 508863359777505290
 * @authorLink https://www.refact0r.dev
*/
/* import theme modules */
@import url('https://refact0r.github.io/midnight-discord/build/midnight.css');
body {
    /* font options */
    --font: 'figtree'; /* change to '' for default discord font */
    --code-font: ''; /* change to '' for default discord font */
    font-weight: 400; /* normal text font weight. DOES NOT AFFECT BOLD TEXT */
    /* sizes */
    --gap: 12px; /* spacing between panels */
    --divider-thickness: 4px; /* thickness of unread messages divider and highlighted message borders */
    --border-thickness: 1px; /* thickness of borders around main panels. DOES NOT AFFECT OTHER BORDERS */
    /* animation/transition options */
    --animations: on; /* off: disable animations/transitions, on: enable animations/transitions */
    --list-item-transition: 0.2s ease; /* transition for list items */
    --dms-icon-svg-transition: 0.4s ease; /* transition for the dms icon */
    --border-hover-transition: 0.2s ease; /* transition for borders when hovered */
    /* top bar options */
    --top-bar-height: var(--gap); /* height of the top bar (discord default is 36px, old discord style is 24px, var(--gap) recommended if button position is set to titlebar) */
    --top-bar-button-position: titlebar; /* off: default position, hide: hide buttons completely, serverlist: move inbox button to server list, titlebar: move inbox button to channel titlebar (will hide title) */
    --top-bar-title-position: off; /* off: default centered position, hide: hide title completely, left: left align title (like old discord) */
    --subtle-top-bar-title: off; /* off: default, on: hide the icon and use subtle text color (like old discord) */
    /* window controls */
    --custom-window-controls: on; /* off: default window controls, on: custom window controls */
    --window-control-size: 14px; /* size of custom window controls */
    /* dms button options */
    --custom-dms-icon: custom; /* off: use default discord icon, hide: remove icon entirely, custom: use custom icon */
    --dms-icon-svg-url: url('https://refact0r.github.io/midnight-discord/assets/Font_Awesome_5_solid_moon.svg'); /* icon svg url. MUST BE A SVG. */
    --dms-icon-svg-size: 90%; /* size of the svg (css mask-size property) */
    --dms-icon-color-before: var(--icon-secondary); /* normal icon color */
    --dms-icon-color-after: var(--white); /* icon color when button is hovered/selected */
    --custom-dms-background: off; /* off to disable, image to use a background image (must set url variable below), color to use a custom color/gradient */
    --dms-background-image-url: url(''); /* url of the background image */
    --dms-background-image-size: cover; /* size of the background image (css background-size property) */
    --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2)); /* fixed color/gradient (css background property) */
    /* background image options */
    --background-image: off; /* off: no background image, on: enable background image (must set url variable below) */
    --background-image-url: url(''); /* url of the background image */
    /* transparency/blur options */
    /* NOTE: TO USE TRANSPARENCY/BLUR, YOU MUST HAVE TRANSPARENT BG COLORS. FOR EXAMPLE: --bg-4: hsla(220, 15%, 10%, 0.7); */
    --transparency-tweaks: off; /* off: no changes, on: remove some elements for better transparency */
    --remove-bg-layer: off; /* off: no changes, on: remove the base --bg-3 layer for use with window transparency (WILL OVERRIDE BACKGROUND IMAGE) */
    --panel-blur: off; /* off: no changes, on: blur the background of panels */
    --blur-amount: 12px; /* amount of blur */
    --bg-floating: var(--bg-3); /* set this to a more opaque color if floating panels look too transparent. only applies if panel blur is on  */
    /* chatbar options */
    --custom-chatbar: off; /* off: default chatbar, separated: chatbar separated from chat */
    --chatbar-height: 47px; /* height of the chatbar (56px by default, 47px to align with user panel, 56px recommended for separated) */
    /* other options */
    --small-user-panel: on; /* off: default user panel, on: smaller user panel like in old discord */
}
/* color options */
:root {
    --colors: on; /* off: discord default colors, on: midnight custom colors */
    /* text colors */
    --text-0: var(--bg-4); /* text on colored elements */
    --text-1: #${config.theme.base05}; /* other normally white text */
    --text-2: #${config.theme.base06}; /* headings and important text */
    --text-3: #${config.theme.base04}; /* normal text */
    --text-4: #${config.theme.base03}; /* icon buttons and channels */
    --text-5: #${config.theme.base03}; /* muted channels/chats and timestamps */
    /* background and dark colors */
    --bg-1: #${config.theme.base02}; /* dark buttons when clicked */
    --bg-2: #${config.theme.base01}; /* dark buttons */
    --bg-3: #${config.theme.base01}; /* spacing, secondary elements */
    --bg-4: #${config.theme.base00}; /* main background color */
    --hover: color-mix(in srgb, #${config.theme.base03} 10%, transparent); /* channels and buttons when hovered */
    --active: color-mix(in srgb, #${config.theme.base03} 20%, transparent); /* channels and buttons when clicked or selected */
    --active-2: color-mix(in srgb, #${config.theme.base03} 30%, transparent); /* extra state for transparent buttons */
    --message-hover: color-mix(in srgb, #${config.theme.base00} 10%, transparent); /* messages when hovered */
    /* accent colors */
    --accent-1: #${config.theme.base0D}; /* links and other accent text */
    --accent-2: #${config.theme.base0D}; /* small accent elements */
    --accent-3: #${config.theme.base0D}; /* accent buttons */
    --accent-4: color-mix(in srgb, #${config.theme.base0D} 80%, #${config.theme.base05}); /* accent buttons when hovered */
    --accent-5: color-mix(in srgb, #${config.theme.base0D} 60%, #${config.theme.base05}); /* accent buttons when clicked */
    --accent-new: #${config.theme.base08}; /* stuff that's normally red like mute/deafen buttons */
    --mention: linear-gradient(to right, color-mix(in srgb, #${config.theme.base0D} 10%, transparent) 40%, transparent); /* background of messages that mention you */
    --mention-hover: linear-gradient(to right, color-mix(in srgb, #${config.theme.base0D} 5%, transparent) 40%, transparent); /* background of messages that mention you when hovered */
    --reply: linear-gradient(to right, color-mix(in srgb, #${config.theme.base04} 10%, transparent) 40%, transparent); /* background of messages that reply to you */
    --reply-hover: linear-gradient(to right, color-mix(in srgb, #${config.theme.base04} 5%, transparent) 40%, transparent); /* background of messages that reply to you when hovered */
    /* status indicator colors */
    --online: #${config.theme.base0B}; /* change to #40a258 for default */
    --dnd: #${config.theme.base08}; /* change to #d83a41 for default */
    --idle: #${config.theme.base0A}; /* change to #cc954c for default */
    --streaming: #${config.theme.base0E}; /* change to ##9147ff for default */
    --offline: var(--text-4); /* change to #82838b for default offline color */
    /* border colors */
    --border-light: var(--hover); /* general light border color */
    --border: var(--active); /* general normal border color */
    --border-hover: var(--active); /* border color of panels when hovered */
    --button-border: color-mix(in srgb, #${config.theme.base05} 10%, transparent); /* neutral border color of buttons */
    /* base colors - mapped to base16 scheme */
    --red-1: #${config.theme.base08};
    --red-2: #${config.theme.base08};
    --red-3: color-mix(in srgb, #${config.theme.base08} 90%, #${config.theme.base00});
    --red-4: color-mix(in srgb, #${config.theme.base08} 80%, #${config.theme.base00});
    --red-5: color-mix(in srgb, #${config.theme.base08} 70%, #${config.theme.base00});
    --green-1: #${config.theme.base0B};
    --green-2: #${config.theme.base0B};
    --green-3: color-mix(in srgb, #${config.theme.base0B} 90%, #${config.theme.base00});
    --green-4: color-mix(in srgb, #${config.theme.base0B} 80%, #${config.theme.base00});
    --green-5: color-mix(in srgb, #${config.theme.base0B} 70%, #${config.theme.base00});
    --blue-1: #${config.theme.base0D};
    --blue-2: #${config.theme.base0D};
    --blue-3: color-mix(in srgb, #${config.theme.base0D} 90%, #${config.theme.base00});
    --blue-4: color-mix(in srgb, #${config.theme.base0D} 80%, #${config.theme.base00});
    --blue-5: color-mix(in srgb, #${config.theme.base0D} 70%, #${config.theme.base00});
    --yellow-1: #${config.theme.base0A};
    --yellow-2: #${config.theme.base0A};
    --yellow-3: color-mix(in srgb, #${config.theme.base0A} 90%, #${config.theme.base00});
    --yellow-4: color-mix(in srgb, #${config.theme.base0A} 80%, #${config.theme.base00});
    --yellow-5: color-mix(in srgb, #${config.theme.base0A} 70%, #${config.theme.base00});
    --purple-1: #${config.theme.base0E};
    --purple-2: #${config.theme.base0E};
    --purple-3: color-mix(in srgb, #${config.theme.base0E} 90%, #${config.theme.base00});
    --purple-4: color-mix(in srgb, #${config.theme.base0E} 80%, #${config.theme.base00});
    --purple-5: color-mix(in srgb, #${config.theme.base0E} 70%, #${config.theme.base00});
}
    '';
  };
}
