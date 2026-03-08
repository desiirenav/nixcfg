{
  flake.nixosModules.yazi = { self, lib, pkgs, ... }:
  let 
    inherit (self) theme;
  in { 
    hjem.users.narayan.files = {
      ".config/yazi/theme.toml".source = pkgs.writers.writeTOML "theme.toml" {
        mgr {
	  cwd = { 
	    fg = "cyan"; 
	  };
	};
      };
    };
  };
}
