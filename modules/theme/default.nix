{ config, lib, ... }:
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
      base00 = "faf4ed";
      base01 = "fffaf3";
      base02 = "f2e9de";
      base03 = "9893a5";
      base04 = "797593";
      base05 = "575279";
      base06 = "575279";
      base07 = "cecacd";
      base08 = "b4637a";
      base09 = "ea9d34";
      base0A = "d7827e";
      base0B = "286983";
      base0C = "56949f";
      base0D = "907aa9";
      base0E = "ea9d34";
      base0F = "cecacd";
    };
  };
}

