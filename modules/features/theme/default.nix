{ config, pkgs, lib, ... }:
{
  options = with lib; with types; {
    theme = {
      base00 = mkOption { type = str; };
      base01 = mkOption { type = str; };
      base02 = mkOption { type = str; };
      base03 = mkOption { type = str; };
      base04 = mkOption { type = str; };
      base05 = mkOption { type = str; };
      base06 = mkOption { type = str; };
      base07 = mkOption { type = str; };
      base08 = mkOption { type = str; };
      base09 = mkOption { type = str; };
      base0A = mkOption { type = str; };
      base0B = mkOption { type = str; };
      base0C = mkOption { type = str; };
      base0D = mkOption { type = str; };
      base0E = mkOption { type = str; };
      base0F = mkOption { type = str; };
    };
  };
  theme = {
    base00 = "09090b";
    base01 = "18181b";
    base02 = "27272a";
    base03 = "52525b";
    base04 = "a1a1aa";
    base05 = "d4d4d8";
    base06 = "e4e4e7";
    base07 = "ffffff";
    base08 = "dc2626";
    base09 = "ca8a04";
    base0A = "eab308";
    base0B = "16a34a";
    base0C = "60a5fa";
    base0D = "2563eb";
    base0E = "7300ff";
    base0F = "e879f9";
  };
}
