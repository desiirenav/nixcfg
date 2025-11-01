{pkgs, lib, config, ...}: 
{

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "matugen-autostart" ''
       matugen image /etc/nixos/assets/pond.png
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
        gtk3 = {
          input_path = ./templates/gtk-colors.css;
          output_path = "~/.config/gtk-3.0/colors.css";
        };
        gtk4 = {
          input_path = ./templates/gtk-colors.css;
          output_path = "~/.config/gtk-4.0/colors.css";
        };
        fuzzel = {
          input_path = ./templates/fuzzel.ini;
          output_path = "~/.config/fuzzel/fuzzel.ini";
        };
        kitty = {
          input_path = ./templates/kitty-colors.conf;
          output_path = "~/.config/kitty/kitty.conf";
        };
        fish = {
          input_path = ./templates/colors-fish.theme;
          output_path = "~/.config/fish/themes/Matugen.theme";
        };
        pywalfox = {
          input_path = ./templates/colors.json;
          output_path = "~/.cache/wal/colors.json";
        };
        vencord = {
          input_path = ./templates/midnight-discord.css;
          output_path = "~/.config/Vencord/themes/midnight-discord.css";
        };
        zathura = {
          input_path = ./templates/zathura;
          output_path = "~/.config/zathura/zathurarc";
        };
      };
    };
  };
}
