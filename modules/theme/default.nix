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
  config = {
    theme = {
      base00 = "2E3440";
      base01 = "3B4252";
      base02 = "434C5E";
      base03 = "4C566A";
      base04 = "D8DEE9";
      base05 = "E5E9F0";
      base06 = "ECEFF4";
      base07 = "8FBCBB";
      base08 = "BF616A";
      base09 = "D08770";
      base0A = "EBCB8B";
      base0B = "A3BE8C";
      base0C = "88C0D0";
      base0D = "81A1C1";
      base0E = "B48EAD";
      base0F = "5E81AC";
    };
  };
}
