{ inputs,... }: {
  perSystem = {pkgs,lib, ...}: let
     inherit (lib) getExe;
  in {
    packages.wallpaper = pkgs.writeShellScriptBin "wallpaper" ''
      ${pkgs.swww}/bin/swww-daemon &
      ${getExe pkgs.swww} img ${./pattern.png} &
      ${getExe pkgs.swaybg} -i ${./pattern.png}
    '';
  };
}
