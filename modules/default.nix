{pkgs, ...}: {
  imports = [
    ./base
    ./dots
    ./features
  ];
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "matugen-autostart" ''
       matugen image /home/narayan/nixcfg/modules/dots/wal/nixos.png
    '')
    (pkgs.writeShellScriptBin "matugen-vivian" ''
       matugen image /home/narayan/nixcfg/modules/dots/wal/vivian.png
    '')
  ];

  hjem.users.narayan.files = {
    ".config/matugen/config.toml".source = pkgs.writers.writeTOML "config.toml" {
      config = {
        wallpaper = {
          command = "swww";
          arguments = ["img" "--transition-type" "center"];
          set = true;
        };
      };
      templates = {
        vencord = {
          input_path = ./midnight-discord.css;
          output_path = "~/.config/Vencord/themes/midnight-discord.css";
        };
      };
    };
  };
}

