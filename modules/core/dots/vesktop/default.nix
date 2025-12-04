{config, ...}: {
  hjem.users.narayan.files = {
    ".config/vesktop/themes/base16.css".text = import ./discord-css.nix {inherit config;};
    '';
  };
}
