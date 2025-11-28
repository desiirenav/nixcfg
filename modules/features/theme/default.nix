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
      base00 = "29254e";
      base01 = "494562";
      base02 = "6a6476";
      base03 = "8a838a";
      base04 = "aaa29f";
      base05 = "cac2b3";
      base06 = "d2cbbe";
      base07 = "dad4c9";
      base08 = "84775e";
      base09 = "877474";
      base0A = "796eba";
      base0B = "a48fc6";
      base0C = "9a93bd";
      base0D = "7070c0";
      base0E = "c15565";
      base0F = "756ec0";
    };
  };
} 
