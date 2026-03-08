{ inputs,... }: {
  perSystem = {pkgs,lib, ...}: let
     inherit (lib) getExe;
  in {
    packages.wallpaper = pkgs.writeShellScriptBin "wallpaper" ''
      ${pkgs.swww}/bin/swww-daemon &
      ${getExe pkgs.swww} img ${./vivian.png} &
      ${getExe pkgs.swaybg} -i ${./vivian.png}
    '';
  };
}
