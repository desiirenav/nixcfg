{ inputs, config, lib, pkgs, ... }:

{  
  hjem.users.narayan.files = {
    ".config/rofi".source = ./config; 
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "appdrawer" ''
       rofi -show drun -config "$HOME/.config/rofi/appdrawer.rasi" 
    '')

    (pkgs.writeShellScriptBin "bgselector" ''
      wall_dir="/etc/nixos/assets"
      cache_dir="$HOME/.cache/thumbnails/bgselector"

      mkdir -p "$wall_dir"
      mkdir -p "$cache_dir"

      # Generate thumbnails
      find "$wall_dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif'-o \) | while read -r imagen; do
        filename="$(basename "$imagen")"
        thumb="$cache_dir/$filename"
        if [ ! -f "$thumb" ]; then
          ffmpeg -y -i "$imagen" -vf "thumbnail,scale=-1:540:force_original_aspect_ratio=increase,crop=262:540" -frames:v 1 "$thumb"
          # magick convert -strip "$imagen" -thumbnail x540^ -gravity center -extent 262x540 "$thumb"
        fi
      done

      # List wallpapers with icons for rofi
      wall_selection=$(ls "$wall_dir" | while read -r A; do echo -en "$A\x00icon\x1f$cache_dir/$A\n"; done | rofi -dmenu -config "$HOME/.config/rofi/bgselector.rasi")

      # Set wallpaper and update waybar color
      if [ -n "$wall_selection" ]; then
        wal -i $wall_dir/$wall_selection
          matugen image $wall_dir/$wall_selection
        sleep 0.2
        openrgb -c $(sed 's/#//' ~/.cache/wal/rgb.css) -b 35
        exit 0
      else
        exit 1
      fi
    '')
    
    (pkgs.writeShellScriptBin "powermenu" ''
      shutdown="$(printf '\uf16f')"
      reboot="$(printf '\ue5d5')"
      suspend="$(printf '\uef44')"
      logout="$(printf '\ue9ba')"

      # Give options to rofi and save choice
      chosen="$(echo -e "$shutdown\n$reboot\n$suspend\n$logout" | rofi -dmenu -config "$HOME/.config/rofi/powermenu.rasi" )"

      case "$chosen" in
        "$shutdown")
          poweroff
          ;;
        "$reboot")
          reboot
          ;;
        "$suspend")
          systemctl suspend
          ;;
        "$logout")
          niri msg action quit
          ;;
        *)
          exit 0
          ;;
      esac
    '')
  ];
}

