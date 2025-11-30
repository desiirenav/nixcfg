{...}:{
  hjem.users.narayan.files = {
    ".config/fastfetch/config.jsonc".text = ''
	{
	    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
	    "display": {
	    },
	    "modules": [
		{
		   "type": "title",
		   "key": " ",
		    "color": {
			"user": "white",
			"at": "white",
			"host": "white"
		    },
		},
		"break",
		"break",
		{
		    "type": "os",
		    "key": "󱄅 ",
		    "keyColor": "cyan",
		    "format": "{3}"
		},
		{
		    "type": "kernel",
		    "key": " ",
		    "keyColor": "cyan",
		    // "format": "{2}"
		},
		{
		    "type": "packages",
		    "key": " ",
		    "keyColor": "cyan"
		},
		{
		    "type": "shell",
		    "key": " ",
		    "keyColor": "cyan"
		},
		"break",
		{
		    "type": "wm",
		    "key": " ",
		    "keyColor": "cyan"
		},
		{
		    "type": "terminal",
		    "key": " ",
		    "keyColor": "cyan"
		},
		"break",
		{
		    "type": "cpu",
		    "key": " ",
		    "keyColor": "cyan"
		},
		{
		    "type": "gpu",
		    "key": " ",
		    "keyColor": "cyan"
		},
		{
		    "type": "memory",
		    "key": " ",
		    "keyColor": "cyan"
		},
		{
		    "type": "disk",
		    "key": " ",
		    "keyColor": "cyan"
		},
		{
		    "type": "battery",
		    "key": "󰂅 ",
		    "keyColor": "cyan"
		},
	      "break",
	      "colors"
	    ]
	}
    '';
  };
}
