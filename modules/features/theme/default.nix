{ config, pkgs, lib, ... }:
{
  options = with lib; with types; {
    theme = {
      background = mkOption { type = str; }; 
      foreground = mkOption { type = str; }; 
      cursor-color = mkOption { type = str; };
      selection-background = mkOption { type = str; };
      selection-foreground = mkOption { type = str; };
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
      background = "161617";
      foreground = "c9c7cd";
      cursor-color = "c9c7cd";
      base00 = "27272a";
      base01 = "ea83a5";
      base02 = "90b99f";
      base03 = "e6b99d";
      base04 = "9ca2cf";
      base05 = "aca1cf";
      base06 = "85b5ba";
      base07 = "c9c7cd";
      base08 = "353539";
      base09 = "ED96B3";
      base0A = "a7c8b3";
      base0B = "eac5ae";
      base0C = "acb1d7";
      base0D = "b7aed5";
      base0E = "97c0c4";
      base0F = "d3d1d7";
    };
  };
}
