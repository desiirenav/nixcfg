{ config, pkgs, ... }: {
  hjem.users.narayan.files.".config/kitty/kitty.conf".text = ''
    font_size 11.0

    background #${config.theme.base00}
    foreground #${config.theme.base05}

    # Stylix / base16 style selection
    selection_background #${config.theme.base02}
    selection_foreground #${config.theme.base05}

    url_color #${config.theme.base0D}

    cursor #${config.theme.base05}
    cursor_text_color #${config.theme.base00}

    active_border_color   #${config.theme.base03}
    inactive_border_color #${config.theme.base01}

    active_tab_background   #${config.theme.base00}
    active_tab_foreground   #${config.theme.base05}
    inactive_tab_background #${config.theme.base01}
    inactive_tab_foreground #${config.theme.base04}

    tab_bar_background #${config.theme.base00}

    # --- ANSI 0–7 (normal) ---
    color0  #${config.theme.base00}
    color1  #${config.theme.base08}
    color2  #${config.theme.base0B}
    color3  #${config.theme.base0A}
    color4  #${config.theme.base0D}
    color5  #${config.theme.base0E}
    color6  #${config.theme.base0C}
    color7  #${config.theme.base05}

    # --- ANSI 8–15 (bright) ---
    # This matches the base16 kitty “base16” template
    color8  #${config.theme.base03}
    color9  #${config.theme.base09}
    color10 #${config.theme.base01}
    color11 #${config.theme.base02}
    color12 #${config.theme.base04}
    color13 #${config.theme.base06}
    color14 #${config.theme.base0F}
    color15 #${config.theme.base07}
  '';
  hjem.users.narayan.files.".config/yazi/theme.toml".source =
    pkgs.writers.writeTOML "theme.toml" {
      # [mgr]
      mgr = {
        cwd = { fg = "#${config.theme.base0C}"; };
        hovered = { reversed = true; };
        preview_hovered = { underline = true; };
        find_keyword = { bold = true; fg = "#${config.theme.base0A}"; };
        find_position = { fg = "#${config.theme.base0E}"; };
        marker_copied = { fg = "#${config.theme.base0B}"; bg = "#${config.theme.base0B}"; };
        marker_cut = { fg = "#${config.theme.base08}"; bg = "#${config.theme.base08}"; };
        marker_selected = { fg = "#${config.theme.base0A}"; bg = "#${config.theme.base0A}"; };
        count_copied = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0B}"; };
        count_cut = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base08}"; };
        count_selected = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0A}"; };
        border_style = { fg = "#${config.theme.base0D}"; };
      };

      # [tabs]
      tabs = {
        inactive = { fg = "#${config.theme.base05}"; };
        active = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base05}"; };
      };

      # [mode]
      mode = {
        normal_main = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0D}"; bold = true; };
        normal_alt  = { fg = "#${config.theme.base0D}"; bg = "#${config.theme.base02}"; };
        select_alt  = { fg = "#${config.theme.base0E}"; bg = "#${config.theme.base02}"; };
        select_main = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0E}"; bold = true; };
        unset_main  = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base08}"; bold = true; };
        unset_alt   = { fg = "#${config.theme.base08}"; bg = "#${config.theme.base02}"; };
      };

      # [status]
      status = {
        perm_exec   = { fg = "#${config.theme.base0B}"; };
        perm_read   = { fg = "#${config.theme.base0A}"; };
        perm_sep    = { fg = "#${config.theme.base0C}"; };
        perm_type   = { fg = "#${config.theme.base0D}"; };
        perm_write  = { fg = "#${config.theme.base08}"; };
        progress_error  = { fg = "#${config.theme.base08}"; bg = "#${config.theme.base00}"; };
        progress_label  = { fg = "#${config.theme.base05}"; bg = "#${config.theme.base00}"; };
        progress_normal = { fg = "#${config.theme.base05}"; bg = "#${config.theme.base00}"; };
      };

      # [pick]
      pick = {
        active   = { fg = "#${config.theme.base0E}"; };
        border   = { fg = "#${config.theme.base0D}"; };
        inactive = { fg = "#${config.theme.base05}"; };
      };

      # [tasks]
      tasks = {
        title   = { fg = "#${config.theme.base0D}"; };
        border  = { fg = "#${config.theme.base0D}"; };
        hovered = { fg = "#${config.theme.base05}"; bg = "#${config.theme.base02}"; };
      };

      # [input]
      input = {
        border   = { fg = "#${config.theme.base0D}"; };
        selected = { bg = "#${config.theme.base02}"; };
      };

      # [help]
      help = {
        desc    = { fg = "#${config.theme.base05}"; };
        on      = { fg = "#${config.theme.base0C}"; };
        run     = { fg = "#${config.theme.base0E}"; };
        hovered = { reversed = true; bold = true; };
        footer  = { fg = "#${config.theme.base02}"; bg = "#${config.theme.base05}"; };
      };

      # [which]
      which = {
        mask            = { bg = "#${config.theme.base02}"; };
        desc            = { fg = "#${config.theme.base05}"; };
        cand            = { fg = "#${config.theme.base0C}"; };
        rest            = { fg = "#${config.theme.base0F}"; };
        separator_style = { fg = "#${config.theme.base04}"; };
      };

      # [notify]
      notify = {
        title_info  = { fg = "#${config.theme.base0C}"; };
        title_warn  = { fg = "#${config.theme.base0A}"; };
        title_error = { fg = "#${config.theme.base08}"; };
      };

      # [filetype]
      filetype = {
        rules = [
          { mime = "image/*"; fg = "#${config.theme.base0C}"; }
          { mime = "{audio,video}/*"; fg = "#${config.theme.base0A}"; }
          { mime = "application/{pdf,doc,rtf}"; fg = "#${config.theme.base0B}"; }
          { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}"; fg = "#${config.theme.base0E}"; }
          { mime = "inode/directory"; fg = "#${config.theme.base0D}"; }
          { mime = "*"; fg = "#${config.theme.base05}"; }
        ];
      };
    };
}

