{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      
    '';
  };
}

