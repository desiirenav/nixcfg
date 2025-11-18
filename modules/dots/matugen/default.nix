{pkgs, lib, config, ...}: 
{

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

        gtk3 = {
          input_path = ./templates/gtk-colors.css;
          output_path = "~/.config/gtk-3.0/colors.css";
        };
        gtk4 = {
          input_path = ./templates/gtk-colors.css;
          output_path = "~/.config/gtk-4.0/colors.css";
        };
        fish = {
          input_path = ./templates/colors-fish.theme;
          output_path = "~/.config/fish/themes/Matugen.theme";
        };
        fuzzel = {
          input_path = ./templates/fuzzel.ini;
          output_path = "~/.config/fuzzel/fuzzel.ini";
        };
        ghostty = {
          input_path = ./templates/ghostty;
          output_path = "~/.config/ghostty/themes/matugen";
        };
        kitty = {
          input_path = ./templates/kitty-colors.conf;
          output_path = "~/.config/kitty/kitty.conf";
        };
	neovim = {
	  input_path = ./templates/nvim.lua;
	  output_path = "~/.config/nvim/init.lua";
	  post_hook = "pkill -SIGUSR1 nvim";
	};
        pywalfox = {
          input_path = ./templates/colors.json;
          output_path = "~/.cache/wal/colors.json";
        };
        vencord = {
          input_path = ./templates/midnight-discord.css;
          output_path = "~/.config/Vencord/themes/midnight-discord.css";
        };
        yazi = {
          input_path = ./templates/yazi.toml;
          output_path = "~/.config/yazi/theme.toml";
        };
        zathura = {
          input_path = ./templates/zathura;
          output_path = "~/.config/zathura/zathurarc";
        };
        zen1 = {
          input_path = ./templates/userChrome.css;
          output_path = "~/.zen/a1chj0ej.Default Profile/chrome/userChrome.css";
        };
        zen2 = {
          input_path = ./templates/userContent.css;
          output_path = "~/.zen/a1chj0ej.Default Profile/chrome/userContent.css";
        };
        zen3 = {
          input_path = ./templates/zen-logo.svg;
          output_path = "~/.zen/a1chj0ej.Default Profile/chrome/zen-logo.svg";
        };
      };
    };
  };
}
