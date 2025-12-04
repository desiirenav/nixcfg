{config,lib,... }:{
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
      base00 = "201d2a";
      base01 = "9375f5";
      base02 = "d294ff";
      base03 = "ecd1ff";
      base04 = "a286fd";
      base05 = "d294ff";
      base06 = "b5a0fe";
      base07 = "9992b0";
      base08 = "625a7c";
      base09 = "dba8ff";
      base0A = "2c2839";
      base0B = "4b455f";
      base0C = "6e658b";
      base0D = "dcd2fe";
      base0E = "ca80ff";
      base0F = "efebff";
    };
  };
} 
