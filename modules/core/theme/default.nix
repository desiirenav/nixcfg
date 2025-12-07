{ config, lib, ... }:
let
  inherit (lib) mkOption types;
in {
  options.theme = {
    base00 = mkOption { type = types.str; default = "161616"; };
    base01 = mkOption { type = types.str; default = "262626"; };
    base02 = mkOption { type = types.str; default = "393939"; };
    base03 = mkOption { type = types.str; default = "525252"; };
    base04 = mkOption { type = types.str; default = "dde1e6"; };
    base05 = mkOption { type = types.str; default = "f2f4f8"; };
    base06 = mkOption { type = types.str; default = "ffffff"; };
    base07 = mkOption { type = types.str; default = "08bdba"; };
    base08 = mkOption { type = types.str; default = "ee5396"; };
    base09 = mkOption { type = types.str; default = "ff7eb6"; };
    base0A = mkOption { type = types.str; default = "ff6f00"; };
    base0B = mkOption { type = types.str; default = "42be65"; };
    base0C = mkOption { type = types.str; default = "3ddbd9"; };
    base0D = mkOption { type = types.str; default = "33b1ff"; };
    base0E = mkOption { type = types.str; default = "be95ff"; };
    base0F = mkOption { type = types.str; default = "82cfff"; };
  };

  # Only one helper: add '#'
  config.lib.theme = {
    hex = name: "#${config.theme.${name}}";
  };
}

