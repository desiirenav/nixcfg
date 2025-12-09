{pkgs, lib, config, ...}: 
{

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "matugen-autostart" ''
       matugen image /home/narayan/nixcfg/modules/core/dots/matugen/wallpapers/lavender.png
    '')
    (pkgs.writeShellScriptBin "matugen-vivian" ''
       matugen image /home/narayan/nixcfg/modules/core/dots/matugen/wallpapers/vivian.png
    '')
  ];

  hjem.users.narayan.files = {
    ".config/matugen/config.toml".source = pkgs.writers.writeTOML "config.toml" {
      config = {
        wallpaper = {
          command = "swww";
          arguments = ["img" "--transition-type" "simple"];
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
          output_path = "~/.config/fuzzel/colors.ini";
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
        vencord = {
          input_path = ./templates/midnight-discord.css;
          output_path = "~/.config/vesktop/themes/midnight-discord.css";
        };
        zathura = {
          input_path = ./templates/zathura;
          output_path = "~/.config/zathura/zathurarc";
        };
        zen1 = {
          input_path = ./templates/userChrome.css;
          output_path = "~/.zen/narayan.default/chrome/userChrome.css";
        };
        zen2 = {
          input_path = ./templates/userContent.css;
          output_path = "~/.zen/narayan.default/chrome/userContent.css";
        };
        yazi = {
          input_path = ./templates/yazi.toml;
          output_path = "~/.config/yazi/theme.toml";
        };
        zen3 = {
          input_path = ./templates/zen-logo.svg;
          output_path = "~/.zen/narayan.default/chrome/zen-logo.svg";
        };
      };
    };
  };
}
