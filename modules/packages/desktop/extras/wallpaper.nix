{ self, inputs, lib, ...}: {
  perSystem = { pkgs, ... }: {
    packages.wallpaper = pkgs.writeShellScriptBin "wallpaper"''
      if ["$XDG_SESSION_TYPE" = x11];
        feh --bg-scale /home/narayan/nixcfg/assets/glass.png
      elif ["$XDG_SESSION_TYPE" = wayland]; 
        swaybg -i /home/narayan/nixcfg/assets/sky.jpg
      fi
    '';
  };
}
