{config,... }:{
  hjem.users.narayan.files = {
    ".zen/profiles.ini".text = ''
	[Profile0]
	Name=narayan
	IsRelative=1
	Path=narayan.default
	Default=1

	[General]
	StartWithLastProfile=1
	Version=2
    '';
    ".zen/narayan.default/userChrome.css".text = import ./userchome.nix {inherit config;};
    ".zen/narayan.default/userContent.css".text = import ./userContent.nix {inherit config;};
  };


