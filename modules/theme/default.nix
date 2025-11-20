{ config, pkgs, lib, ... }:
{
  options = with lib; with types; {
    theme = {
      base00 = mkOption { type = str; };
    };
  };
  config = {
    theme = {
      base00 = "2E3440";
    };
  };
}
