{config,... }:{
  hjem.users.narayan.files = {
    ".mozilla/profiles.ini".text = ''
	[Profile0]
	Name=narayan
	IsRelative=1
	Path=narayan.default
	Default=1

	[General]
	StartWithLastProfile=1
	Version=2
    '';
    ".mozilla/narayan.default/chrome/userChrome.css".text = import ./userChrome.nix {inherit config;};
  };
}

