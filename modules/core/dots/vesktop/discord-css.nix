{ config }:
''
      @import url("https://mrtipson.github.io/DiscordCSS/css/base.css");
      @import url("https://mrtipson.github.io/DiscordCSS/css/base16.css");

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
''

