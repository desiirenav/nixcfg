{ config }:
''
  :root {
    --zen-colors-primary: #${config.theme.base02} !important;
    --zen-primary-color: #${config.theme.base0D} !important;
    --zen-colors-secondary: #${config.theme.base02} !important;
    --zen-colors-tertiary: #${config.theme.base01} !important;
    --zen-colors-border: #${config.theme.base0D} !important;
    --toolbarbutton-icon-fill: #${config.theme.base0D} !important;
    --lwt-text-color: #${config.theme.base07} !important;
    --toolbar-field-color: #${config.theme.base07} !important;
    --tab-selected-textcolor: #${config.theme.base07} !important;
    --toolbar-field-focus-color: #${config.theme.base07} !important;
    --toolbar-color: #${config.theme.base07} !important;
    --newtab-text-primary-color: #${config.theme.base07} !important;
    --arrowpanel-color: #${config.theme.base07} !important;
    --arrowpanel-background: #${config.theme.base00} !important;
    --sidebar-text-color: #${config.theme.base07} !important;
    --lwt-sidebar-text-color: #${config.theme.base07} !important;
    --lwt-sidebar-background-color: #${config.theme.base00} !important;
    --toolbar-bgcolor: #${config.theme.base02} !important;
    --newtab-background-color: #${config.theme.base00} !important;
    --zen-themed-toolbar-bg: #${config.theme.base00} !important;
    --zen-main-browser-background: #${config.theme.base00} !important;
    --toolbox-bgcolor-inactive: #${config.theme.base01} !important;
  }

  #permissions-granted-icon {
    color: #${config.theme.base07} !important;
  }

  .sidebar-placesTree {
    background-color: #${config.theme.base00} !important;
  }

  #zen-workspaces-button {
    background-color: #${config.theme.base00} !important;
  }

  #TabsToolbar {
    background-color: #${config.theme.base00} !important;
  }

  .urlbar-background {
    background-color: #${config.theme.base02} !important;
  }

  .content-shortcuts {
    background-color: #${config.theme.base00} !important;
    border-color: #${config.theme.base0D} !important;
  }

  .urlbarView-url {
    color: #${config.theme.base0D} !important;
  }

  #urlbar-input::selection {
    background-color: #${config.theme.base0D} !important;
    color: #${config.theme.base00} !important;
  }

  #zenEditBookmarkPanelFaviconContainer {
    background: #${config.theme.base00} !important;
  }

  #zen-media-controls-toolbar {
    & #zen-media-progress-bar {
      &::-moz-range-track {
        background: #${config.theme.base02} !important;
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
        fill: #${config.theme.base00};
      }
    }
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

  hbox#titlebar {
    background-color: #${config.theme.base00} !important;
  }

  #zen-appcontent-navbar-container {
    background-color: #${config.theme.base00} !important;
  }

  #contentAreaContextMenu menu,
  menuitem,
  menupopup {
    color: #${config.theme.base07} !important;
  }
''
