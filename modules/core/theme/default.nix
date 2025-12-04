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
      base01 = "2c2839";
      base02 = "4b455f";
      base03 = "625a7c";
      base04 = "6e658b";
      base05 = "a286fd";
      base06 = "c9b9fe";
      base07 = "efebff";
      base08 = "7451e6";
      base09 = "c16bff";
      base0A = "d294ff";
      base0B = "7c6f85";
      base0C = "ecd1ff";
      base0D = "dba8ff";
      base0E = "9375f5";
      base0F = "8363ee";
    };
  };
}  
