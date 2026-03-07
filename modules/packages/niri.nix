{ self, inputs, lib, ...}: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme; 
  in {
    packages.niri = (inputs.wrappers.wrapperModules.niri.apply {
      inherit pkgs;
      settings = {
        prefer-no-csd = null;
        
        input = {
          keyboard = {
            xkb = {
              layout = "us";
            };
            numlock = null;
          };
          touchpad = {
            natural-scroll = null;
            tap = null;
            accel-speed = 0.4;
          };
        };

        outputs = {
          "eDP-1" = {
            mode = "1920x1080@144";
          };
        };

        overview = {
          zoom = 0.5;
          workspace-shadow = {
            off = null;
          };
        };

        layout = {
          focus-ring = {
            off = null;
          };
          border = {
            off = null;
          };
          preset-column-widths = [
            { proportion = 0.25; }
            { proportion = 0.5; }
            { proportion = 0.75; }
            { proportion = 1.0; }
          ];
          default-column-width = { proportion = 0.5; };
          gaps = 32;
          struts = { };
          background-color = "transparent";
          center-focused-column = "never";
          shadow = {
            on = null;
            softness = 10;
            spread = 10;
          };
        };

        cursor = {
          xcursor-theme = "WhiteSur-cursors";
          xcursor-size = 22;
        };

        spawn-at-startup = [
          [ "wallpaper" ]
	  "quickshell"
        ];

        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        hotkey-overlay = {
          skip-at-startup = null;
        };

        animations = { };

        layer-rules = [
          {
            matches = [ { namespace = "^wallpaper$"; } ];
            place-within-backdrop = true;
          }
        ];

        window-rules = [
          {
            geometry-corner-radius = 12;
            clip-to-geometry = true;
          }
        ];

        binds = {
          "Mod+Shift+Slash".show-hotkey-overlay = null;
          "Mod+Return".spawn = "kitty";
          "Mod+X".spawn = "fuzzel";
          
          "XF86AudioRaiseVolume allow-when-locked=true".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          "XF86AudioLowerVolume allow-when-locked=true".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          "XF86AudioMute allow-when-locked=true".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute allow-when-locked=true".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "XF86MonBrightnessUp allow-when-locked=true".spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
          "XF86MonBrightnessDown allow-when-locked=true".spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];
          "Mod+O repeat=false".toggle-overview = null;
          "Mod+Q repeat=false".close-window = null;

          "Mod+Left".focus-column-left = null;
          "Mod+Down".focus-window-down = null;
          "Mod+Up".focus-window-up = null;
          "Mod+Right".focus-column-right = null;
          "Mod+H".focus-column-left = null;
          "Mod+J".focus-window-down = null;
          "Mod+K".focus-window-up = null;
          "Mod+L".focus-column-right = null;

          "Mod+Ctrl+Left".move-column-left = null;
          "Mod+Ctrl+Down".move-window-down = null;
          "Mod+Ctrl+Up".move-window-up = null;
          "Mod+Ctrl+Right".move-column-right = null;
          "Mod+Ctrl+H".move-column-left = null;
          "Mod+Ctrl+J".move-window-down = null;
          "Mod+Ctrl+K".move-window-up = null;
          "Mod+Ctrl+L".move-column-right = null;

          "Mod+Home".focus-column-first = null;
          "Mod+End".focus-column-last = null;
          "Mod+Ctrl+Home".move-column-to-first = null;
          "Mod+Ctrl+End".move-column-to-last = null;

          "Mod+Shift+Left".focus-monitor-left = null;
          "Mod+Shift+Down".focus-monitor-down = null;
          "Mod+Shift+Up".focus-monitor-up = null;
          "Mod+Shift+Right".focus-monitor-right = null;
          "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = null;
          "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = null;
          "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = null;
          "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = null;

          "Mod+Page_Down".focus-workspace-down = null;
          "Mod+Page_Up".focus-workspace-up = null;
          "Mod+U".focus-workspace-down = null;
          "Mod+I".focus-workspace-up = null;
          "Mod+Ctrl+Page_Down".move-column-to-workspace-down = null;
          "Mod+Ctrl+Page_Up".move-column-to-workspace-up = null;
          "Mod+Ctrl+U".move-column-to-workspace-down = null;
          "Mod+Ctrl+I".move-column-to-workspace-up = null;
          "Mod+Shift+Page_Down".move-workspace-down = null;
          "Mod+Shift+Page_Up".move-workspace-up = null;
          "Mod+Shift+U".move-workspace-down = null;
          "Mod+Shift+I".move-workspace-up = null;

          "Mod+WheelScrollDown cooldown-ms=150".focus-workspace-down = null;
          "Mod+WheelScrollUp cooldown-ms=150".focus-workspace-up = null;
          "Mod+Ctrl+WheelScrollDown cooldown-ms=150".move-column-to-workspace-down = null;
          "Mod+Ctrl+WheelScrollUp cooldown-ms=150".move-column-to-workspace-up = null;
          "Mod+WheelScrollRight".focus-column-right = null;
          "Mod+WheelScrollLeft".focus-column-left = null;
          "Mod+Ctrl+WheelScrollRight".move-column-right = null;
          "Mod+Ctrl+WheelScrollLeft".move-column-left = null;
          "Mod+Shift+WheelScrollDown".focus-column-right = null;
          "Mod+Shift+WheelScrollUp".focus-column-left = null;
          "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = null;
          "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = null;

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+Ctrl+1".move-column-to-workspace = 1;
          "Mod+Ctrl+2".move-column-to-workspace = 2;
          "Mod+Ctrl+3".move-column-to-workspace = 3;
          "Mod+Ctrl+4".move-column-to-workspace = 4;
          "Mod+Ctrl+5".move-column-to-workspace = 5;
          "Mod+Ctrl+6".move-column-to-workspace = 6;
          "Mod+Ctrl+7".move-column-to-workspace = 7;
          "Mod+Ctrl+8".move-column-to-workspace = 8;
          "Mod+Ctrl+9".move-column-to-workspace = 9;

          "Mod+BracketLeft".consume-or-expel-window-left = null;
          "Mod+BracketRight".consume-or-expel-window-right = null;
          "Mod+Comma".consume-window-into-column = null;
          "Mod+Period".expel-window-from-column = null;
          "Mod+R".switch-preset-column-width = null;
          "Mod+Shift+R".switch-preset-window-height = null;
          "Mod+Ctrl+R".reset-window-height = null;
          "Mod+F".maximize-column = null;
          "Mod+Shift+F".fullscreen-window = null;
          "Mod+Ctrl+F".expand-column-to-available-width = null;
          "Mod+C".center-column = null;
          "Mod+Ctrl+C".center-visible-columns = null;

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";
          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";

          "Mod+V".toggle-window-floating = null;
          "Mod+Shift+V".switch-focus-between-floating-and-tiling = null;
          "Mod+W".toggle-column-tabbed-display = null;

          "Print".screenshot = null;
          "Ctrl+Print".screenshot-screen = null;
          "Alt+Print".screenshot-window = null;

          "Mod+Escape allow-inhibiting=false".toggle-keyboard-shortcuts-inhibit = null;
          "Mod+Shift+E".quit = null;
          "Ctrl+Alt+Delete".quit = null;
          "Mod+Shift+P".power-off-monitors = null;
        };
      };
    }).wrapper;
  };
}
