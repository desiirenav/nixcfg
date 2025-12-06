{config, pkgs, ...}: {
  hjem.users.narayan.files.".config/yazi/theme.toml".source = pkgs.writers.writeTOML "theme.toml" {
    manager = {
      cwd = { fg = "#${config.theme.base0C}"; };
      hovered = { reversed = true; };
      preview_hovered = { underline = true; };
      find_keyword = { bold = true; fg = "#${config.theme.base0A}"; };
      find_position = { fg = "#${config.theme.base0E}"; };
      marker_copied = { fg = "#${config.theme.base0B}"; bg = "#${config.theme.base0B}"; };
      marker_cut = { fg = "#${config.theme.base08}"; bg = "#${config.theme.base08}"; };
      marker_selected = { fg = "#${config.theme.base0A}"; bg = "#${config.theme.base0A}"; };
      tab_inactive = { fg = "#${config.theme.base05}"; };
      tab_active = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base05}"; };
      count_copied = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0B}"; };
      count_cut = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base08}"; };
      count_selected = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0A}"; };
      border_style = { fg = "#${config.theme.base0D}"; };
    };
    
    mode = {
      normal_main = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0D}"; bold = true; };
      normal_alt = { fg = "#${config.theme.base0D}"; bg = "#${config.theme.base02}"; };
      select_alt = { fg = "#${config.theme.base0E}"; bg = "#${config.theme.base02}"; };
      select_main = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base0E}"; bold = true; };
      unset_main = { fg = "#${config.theme.base00}"; bg = "#${config.theme.base08}"; bold = true; };
      unset_alt = { fg = "#${config.theme.base08}"; bg = "#${config.theme.base02}"; };
    };
    
    status = {
      perm_exec = { fg = "#${config.theme.base0B}"; };
      perm_read = { fg = "#${config.theme.base0A}"; };
      perm_sep = { fg = "#${config.theme.base0C}"; };
      perm_type = { fg = "#${config.theme.base0D}"; };
      perm_write = { fg = "#${config.theme.base08}"; };
      progress_error = { fg = "#${config.theme.base08}"; bg = "#${config.theme.base00}"; };
      progress_label = { fg = "#${config.theme.base05}"; bg = "#${config.theme.base00}"; };
      progress_normal = { fg = "#${config.theme.base05}"; bg = "#${config.theme.base00}"; };
    };
    
    pick = {
      active = { fg = "#${config.theme.base0E}"; };
      border = { fg = "#${config.theme.base0D}"; };
      inactive = { fg = "#${config.theme.base05}"; };
    };
    
    task = {
      title = { fg = "#${config.theme.base0D}"; };
      border = { fg = "#${config.theme.base0D}"; };
      hovered = { fg = "#${config.theme.base05}"; bg = "#${config.theme.base02}"; };
    };
    
    input = {
      border = { fg = "#${config.theme.base0D}"; };
      selected = { bg = "#${config.theme.base02}"; };
    };
    
    help = {
      desc = { fg = "#${config.theme.base05}"; };
      on = { fg = "#${config.theme.base0C}"; };
      run = { fg = "#${config.theme.base0E}"; };
      hovered = { reversed = true; bold = true; };
      footer = { fg = "#${config.theme.base02}"; bg = "#${config.theme.base05}"; };
    };
    
    which = {
      mask = { bg = "#${config.theme.base02}"; };
      desc = { fg = "#${config.theme.base05}"; };
      cand = { fg = "#${config.theme.base0C}"; };
      rest = { fg = "#${config.theme.base0F}"; };
      separator_style = { fg = "#${config.theme.base04}"; };
    };
    
    notify = {
      title_info = { fg = "#${config.theme.base0C}"; };
      title_warn = { fg = "#${config.theme.base0A}"; };
      title_error = { fg = "#${config.theme.base08}"; };
    };
    
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
