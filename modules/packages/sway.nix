{ self, inputs, lib, ... }: {
  perSystem = { pkgs, ... }: let
    inherit (self) theme;
  in {
    packages.sway = (inputs.wrappers.wrapperModules.sway.apply {
      inherit pkgs;
      configFile.content = ''
        set $mod Mod4

        # Use Mouse+$mod to drag floating windows to their wanted position
        floating_modifier $mod

        # Font
        font pango:Liga SFMono Nerd Font 10

        # Terminal
        bindsym $mod+Return exec kitty

        # Kill focused window
        bindsym $mod+q kill

        # Launcher
        bindsym $mod+x exec fuzzel

        # Papersway
        exec papersway

        # Change focus
        bindsym $mod+j focus left
        bindsym $mod+k focus down
        bindsym $mod+l focus up
        bindsym $mod+semicolon focus right

        bindsym $mod+Left focus left
        bindsym $mod+Down focus down
        bindsym $mod+Up focus up
        bindsym $mod+Right focus right

        # Move focused window
        bindsym $mod+Shift+j move left
        bindsym $mod+Shift+k move down
        bindsym $mod+Shift+l move up
        bindsym $mod+Shift+semicolon move right

        bindsym $mod+Shift+Left move left
        bindsym $mod+Shift+Down move down
        bindsym $mod+Shift+Up move up
        bindsym $mod+Shift+Right move right

        # Split
        bindsym $mod+h split h
        bindsym $mod+v split v

        # Fullscreen
        bindsym $mod+f fullscreen

        # Layout
        bindsym $mod+s layout stacking
        bindsym $mod+w layout tabbed
        bindsym $mod+e layout toggle split

        # Floating
        bindsym $mod+Shift+space floating toggle
        bindsym $mod+space focus mode_toggle

        # Parent
        bindsym $mod+a focus parent

        # Workspaces
        bindsym $mod+1 workspace 1
        bindsym $mod+2 workspace 2
        bindsym $mod+3 workspace 3
        bindsym $mod+4 workspace 4
        bindsym $mod+5 workspace 5
        bindsym $mod+6 workspace 6
        bindsym $mod+7 workspace 7
        bindsym $mod+8 workspace 8
        bindsym $mod+9 workspace 9
        bindsym $mod+0 workspace 10

        # Move to workspace
        bindsym $mod+Shift+1 move container to workspace 1
        bindsym $mod+Shift+2 move container to workspace 2
        bindsym $mod+Shift+3 move container to workspace 3
        bindsym $mod+Shift+4 move container to workspace 4
        bindsym $mod+Shift+5 move container to workspace 5
        bindsym $mod+Shift+6 move container to workspace 6
        bindsym $mod+Shift+7 move container to workspace 7
        bindsym $mod+Shift+8 move container to workspace 8
        bindsym $mod+Shift+9 move container to workspace 9
        bindsym $mod+Shift+0 move container to workspace 10

        # Reload / restart / exit
        bindsym $mod+Shift+c reload
        bindsym $mod+Shift+r restart

        # Resize
        mode "resize" {
          bindsym j resize shrink width 10 px or 10 ppt
          bindsym k resize grow height 10 px or 10 ppt
          bindsym l resize shrink height 10 px or 10 ppt
          bindsym semicolon resize grow width 10 px or 10 ppt
          bindsym Left resize shrink width 10 px or 10 ppt
          bindsym Down resize grow height 10 px or 10 ppt
          bindsym Up resize shrink height 10 px or 10 ppt
          bindsym Right resize grow width 10 px or 10 ppt
          bindsym Return mode "default"
          bindsym Escape mode "default"
        }
        bindsym $mod+r mode "resize"
      '';
    }).wrapper;
  };
}
