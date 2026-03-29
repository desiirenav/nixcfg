{ self, inputs, lib, ... }: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme;
  in {
    packages.i3 = (inputs.wrappers.wrapperModules.i3.apply {
      inherit pkgs;

      modifier = "Mod4";
      terminal = "kitty";
      launcher = "rofi -show drun";

      gaps = {
        inner = 10;
        outer = 5;
      };

      border = {
        width = 2;
        activeColor = "#${theme.base04}";
        inactiveColor = "#${theme.base00}";
      };

      extraConfig = ''
        bindsym XF86MonBrightnessUp exec brightnessctl set +10%
        bindsym XF86MonBrightnessDown exec brightnessctl set 10%-
        bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+
        bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-
        bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      '';
    }).wrapper;
  };
}

