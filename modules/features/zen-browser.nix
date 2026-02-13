{
  flake.nixosModules.zen-browser = { self, config, pkgs, ... }: 
  let
    inherit (self) theme;
    
    zenProfilesIni = pkgs.writeText "profiles.ini" ''
      [Profile0]
      Name=narayan
      IsRelative=1
      Path=narayan.default
      Default=1

      [General]
      StartWithLastProfile=1
      Version=2
    '';

    zenUserJs = pkgs.writeText "user.js" ''
      user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
    '';

    userChromeCss = pkgs.writeText "userChrome.css" ''
      :root {
        --zen-colors-primary: #${theme.base02} !important;
        --zen-primary-color: #${theme.base0D} !important;
        --zen-colors-secondary: #${theme.base02} !important;
        --zen-colors-tertiary: #${theme.base01} !important;
        --zen-colors-border: #${theme.base0D} !important;
        --toolbarbutton-icon-fill: #${theme.base0D} !important;
        --lwt-text-color: #${theme.base07} !important;
        --toolbar-field-color: #${theme.base07} !important;
        --tab-selected-textcolor: #${theme.base07} !important;
        --toolbar-field-focus-color: #${theme.base07} !important;
        --toolbar-color: #${theme.base07} !important;
        --newtab-text-primary-color: #${theme.base07} !important;
        --arrowpanel-color: #${theme.base07} !important;
        --arrowpanel-background: #${theme.base00} !important;
        --sidebar-text-color: #${theme.base07} !important;
        --lwt-sidebar-text-color: #${theme.base07} !important;
        --lwt-sidebar-background-color: #${theme.base00} !important;
        --toolbar-bgcolor: #${theme.base02} !important;
        --newtab-background-color: #${theme.base00} !important;
        --zen-themed-toolbar-bg: #${theme.base00} !important;
        --zen-main-browser-background: #${theme.base00} !important;
        --toolbox-bgcolor-inactive: #${theme.base01} !important;
      }

      #permissions-granted-icon {
        color: #${theme.base07} !important;
      }

      .sidebar-placesTree {
        background-color: #${theme.base00} !important;
      }

      #zen-workspaces-button {
        background-color: #${theme.base00} !important;
      }

      #TabsToolbar {
        background-color: #${theme.base00} !important;
      }

      .urlbar-background {
        background-color: #${theme.base02} !important;
      }

      .content-shortcuts {
        background-color: #${theme.base00} !important;
        border-color: #${theme.base0D} !important;
      }

      .urlbarView-url {
        color: #${theme.base0D} !important;
      }

      #urlbar-input::selection {
        background-color: #${theme.base0D} !important;
        color: #${theme.base00} !important;
      }

      #zenEditBookmarkPanelFaviconContainer {
        background: #${theme.base00} !important;
      }

      #zen-media-controls-toolbar {
        & #zen-media-progress-bar {
          &::-moz-range-track {
            background: #${theme.base02} !important;
          }
        }
      }

      toolbar .toolbarbutton-1 {
        &:not([disabled]) {
          &:is([open], [checked])
            > :is(
              .toolbarbutton-icon,
              .toolbarbutton-text,
              .toolbarbutton-badge-stack
            ) {
            fill: #${theme.base00};
          }
        }
      }

      .identity-color-blue {
        --identity-tab-color: #${theme.base0D} !important;
        --identity-icon-color: #${theme.base0D} !important;
      }

      .identity-color-turquoise {
        --identity-tab-color: #${theme.base0C} !important;
        --identity-icon-color: #${theme.base0C} !important;
      }

      .identity-color-green {
        --identity-tab-color: #${theme.base0B} !important;
        --identity-icon-color: #${theme.base0B} !important;
      }

      .identity-color-yellow {
        --identity-tab-color: #${theme.base0A} !important;
        --identity-icon-color: #${theme.base0A} !important;
      }

      .identity-color-orange {
        --identity-tab-color: #${theme.base09} !important;
        --identity-icon-color: #${theme.base09} !important;
      }

      .identity-color-red {
        --identity-tab-color: #${theme.base08} !important;
        --identity-icon-color: #${theme.base08} !important;
      }

      .identity-color-pink {
        --identity-tab-color: #${theme.base0E} !important;
        --identity-icon-color: #${theme.base0E} !important;
      }

      .identity-color-purple {
        --identity-tab-color: #${theme.base0F} !important;
        --identity-icon-color: #${theme.base0F} !important;
      }

      hbox#titlebar {
        background-color: #${theme.base00} !important;
      }

      #zen-appcontent-navbar-container {
        background-color: #${theme.base00} !important;
      }

      #contentAreaContextMenu menu,
      menuitem,
      menupopup {
        color: #${theme.base07} !important;
      }
    '';

    userContentCss = pkgs.writeText "userContent.css" ''
      /* Common variables affecting all pages */
      @-moz-document url-prefix("about:") {
        :root {
          --in-content-page-color: #${theme.base07} !important;
          --color-accent-primary: #${theme.base0D} !important;
          --color-accent-primary-hover: #${theme.base0D} !important;
          --color-accent-primary-active: #${theme.base0D} !important;
          background-color: #${theme.base00} !important;
          --in-content-page-background: #${theme.base00} !important;
        }
      }

      /* Variables and styles specific to about:newtab and about:home */
      @-moz-document url("about:newtab"), url("about:home") {

        :root {
          --newtab-background-color: #${theme.base00} !important;
          --newtab-background-color-secondary: #${theme.base02} !important;
          --newtab-element-hover-color: #${theme.base02} !important;
          --newtab-text-primary-color: #${theme.base07} !important;
          --newtab-wordmark-color: #${theme.base07} !important;
          --newtab-primary-action-background: #${theme.base0D} !important;
        }

        .icon {
          color: #${theme.base0D} !important;
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
          color: #${theme.base0D} !important;
        }

        .top-site-outer .search-topsite {
          background-color: #${theme.base0D} !important;
        }

        .compact-cards .card-outer .card-context .card-context-icon.icon-download {
          fill: #${theme.base0B} !important;
        }
      }

      /* Variables and styles specific to about:preferences */
      @-moz-document url-prefix("about:preferences") {
        :root {
          --zen-colors-tertiary: #${theme.base01} !important;
          --in-content-text-color: #${theme.base07} !important;
          --link-color: #${theme.base0D} !important;
          --link-color-hover: #${theme.base0D} !important;
          --zen-colors-primary: #${theme.base02} !important;
          --in-content-box-background: #${theme.base02} !important;
          --zen-primary-color: #${theme.base0D} !important;
        }

        groupbox , moz-card{
          background: #${theme.base00} !important;
        }

        button,
        groupbox menulist {
          background: #${theme.base02} !important;
          color: #${theme.base07} !important;
        }

        .main-content {
          background-color: #${theme.base00} !important;
        }

        .identity-color-blue {
          --identity-tab-color: #${theme.base0D} !important;
          --identity-icon-color: #${theme.base0D} !important;
        }

        .identity-color-turquoise {
          --identity-tab-color: #${theme.base0C} !important;
          --identity-icon-color: #${theme.base0C} !important;
        }

        .identity-color-green {
          --identity-tab-color: #${theme.base0B} !important;
          --identity-icon-color: #${theme.base0B} !important;
        }

        .identity-color-yellow {
          --identity-tab-color: #${theme.base0A} !important;
          --identity-icon-color: #${theme.base0A} !important;
        }

        .identity-color-orange {
          --identity-tab-color: #${theme.base09} !important;
          --identity-icon-color: #${theme.base09} !important;
        }

        .identity-color-red {
          --identity-tab-color: #${theme.base08} !important;
          --identity-icon-color: #${theme.base08} !important;
        }

        .identity-color-pink {
          --identity-tab-color: #${theme.base0E} !important;
          --identity-icon-color: #${theme.base0E} !important;
        }

        .identity-color-purple {
          --identity-tab-color: #${theme.base0F} !important;
          --identity-icon-color: #${theme.base0F} !important;
        }
      }

      /* Variables and styles specific to about:addons */
      @-moz-document url-prefix("about:addons") {
        :root {
          --zen-dark-color-mix-base: #${theme.base01} !important;
          --background-color-box: #${theme.base00} !important;
        }
      }

      /* Variables and styles specific to about:protections */
      @-moz-document url-prefix("about:protections") {
        :root {
          --zen-primary-color: #${theme.base00} !important;
          --social-color: #${theme.base0E} !important;
          --coockie-color: #${theme.base0D} !important;
          --fingerprinter-color: #${theme.base0A} !important;
          --cryptominer-color: #${theme.base0F} !important;
          --tracker-color: #${theme.base0B} !important;
          --in-content-primary-button-background-hover: #${theme.base03} !important;
          --in-content-primary-button-text-color-hover: #${theme.base07} !important;
          --in-content-primary-button-background: #${theme.base03} !important;
          --in-content-primary-button-text-color: #${theme.base07} !important;
        }

        .card {
          background-color: #${theme.base02} !important;
        }
      }
    '';
  in {
    hjem.users.narayan.files = {
      ".zen/profiles.ini".source = zenProfilesIni;
      ".zen/narayan.default/user.js".source = zenUserJs;
      ".zen/narayan.default/chrome/userChrome.css".source = userChromeCss;
      ".zen/narayan.default/chrome/userContent.css".source = userContentCss;
    };
  };
}

