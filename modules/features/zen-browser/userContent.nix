{ config }:
''
  /* Common variables affecting all pages */
  @-moz-document url-prefix("about:") {
    :root {
      --in-content-page-color: #${config.theme.base07} !important;
      --color-accent-primary: #${config.theme.base0D} !important;
      --color-accent-primary-hover: #${config.theme.base0D} !important;
      --color-accent-primary-active: #${config.theme.base0D} !important;
      background-color: #${config.theme.base00} !important;
      --in-content-page-background: #${config.theme.base00} !important;
    }
  }

  /* Variables and styles specific to about:newtab and about:home */
  @-moz-document url("about:newtab"), url("about:home") {

    :root {
      --newtab-background-color: #${config.theme.base00} !important;
      --newtab-background-color-secondary: #${config.theme.base02} !important;
      --newtab-element-hover-color: #${config.theme.base02} !important;
      --newtab-text-primary-color: #${config.theme.base07} !important;
      --newtab-wordmark-color: #${config.theme.base07} !important;
      --newtab-primary-action-background: #${config.theme.base0D} !important;
    }

    .icon {
      color: #${config.theme.base0D} !important;
    }

    .search-wrapper .logo-and-wordmark .logo {
      display: inline-block !important;
      height: 82px !important;
      width: 82px !important;
      background-size: 82px !important;
    }

    @media (max-width: 609px) {
      .search-wrapper .logo-and-wordmark .logo {
        background-size: 64px !important;
        height: 64px !important;
        width: 64px !important;
      }
    }

    .card-outer:is(:hover, :focus, .active):not(.placeholder) .card-title {
      color: #${config.theme.base0D} !important;
    }

    .top-site-outer .search-topsite {
      background-color: #${config.theme.base0D} !important;
    }

    .compact-cards .card-outer .card-context .card-context-icon.icon-download {
      fill: #${config.theme.base0B} !important;
    }
  }

  /* Variables and styles specific to about:preferences */
  @-moz-document url-prefix("about:preferences") {
    :root {
      --zen-colors-tertiary: #${config.theme.base01} !important;
      --in-content-text-color: #${config.theme.base07} !important;
      --link-color: #${config.theme.base0D} !important;
      --link-color-hover: #${config.theme.base0D} !important;
      --zen-colors-primary: #${config.theme.base02} !important;
      --in-content-box-background: #${config.theme.base02} !important;
      --zen-primary-color: #${config.theme.base0D} !important;
    }

    groupbox , moz-card{
      background: #${config.theme.base00} !important;
    }

    button,
    groupbox menulist {
      background: #${config.theme.base02} !important;
      color: #${config.theme.base07} !important;
    }

    .main-content {
      background-color: #${config.theme.base00} !important;
    }

    .identity-color-blue {
      --identity-tab-color: #${config.theme.base0D} !important;
      --identity-icon-color: #${config.theme.base0D} !important;
    }

    .identity-color-turquoise {
      --identity-tab-color: #${config.theme.base0C} !important;
      --identity-icon-color: #${config.theme.base0C} !important;
    }

    .identity-color-green {
      --identity-tab-color: #${config.theme.base0B} !important;
      --identity-icon-color: #${config.theme.base0B} !important;
    }

    .identity-color-yellow {
      --identity-tab-color: #${config.theme.base0A} !important;
      --identity-icon-color: #${config.theme.base0A} !important;
    }

    .identity-color-orange {
      --identity-tab-color: #${config.theme.base09} !important;
      --identity-icon-color: #${config.theme.base09} !important;
    }

    .identity-color-red {
      --identity-tab-color: #${config.theme.base08} !important;
      --identity-icon-color: #${config.theme.base08} !important;
    }

    .identity-color-pink {
      --identity-tab-color: #${config.theme.base0E} !important;
      --identity-icon-color: #${config.theme.base0E} !important;
    }

    .identity-color-purple {
      --identity-tab-color: #${config.theme.base0F} !important;
      --identity-icon-color: #${config.theme.base0F} !important;
    }
  }

  /* Variables and styles specific to about:addons */
  @-moz-document url-prefix("about:addons") {
    :root {
      --zen-dark-color-mix-base: #${config.theme.base01} !important;
      --background-color-box: #${config.theme.base00} !important;
    }
  }

  /* Variables and styles specific to about:protections */
  @-moz-document url-prefix("about:protections") {
    :root {
      --zen-primary-color: #${config.theme.base00} !important;
      --social-color: #${config.theme.base0E} !important;
      --coockie-color: #${config.theme.base0D} !important;
      --fingerprinter-color: #${config.theme.base0A} !important;
      --cryptominer-color: #${config.theme.base0F} !important;
      --tracker-color: #${config.theme.base0B} !important;
      --in-content-primary-button-background-hover: #${config.theme.base03} !important;
      --in-content-primary-button-text-color-hover: #${config.theme.base07} !important;
      --in-content-primary-button-background: #${config.theme.base03} !important;
      --in-content-primary-button-text-color: #${config.theme.base07} !important;
    }

    .card {
      background-color: #${config.theme.base02} !important;
    }
  }
''
