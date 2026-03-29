{
  flake.nixosModules.xinitrc = {
    hjem.users.narayan.files = {
      ".xinitrc".text = ''
        exec i3
      '';
    };
  };
}
