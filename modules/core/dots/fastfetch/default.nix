{...}:{
  hjem.users.narayan.files = {
    ".config/fastfetch/config.jsonc".text = ''
	{
	    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
	    "display": {
	    },
	    "logo": {
		"source": "~/.config/fastfetch/logo.txt",
		"type": "file",
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
		{
		    "type": "os",
		    "key": "󱄅 ",
		    "keyColor": "cyan",
		    "format": "{3}"
		},
		{
		    "type": "host",
		    "key": "󰌢 ",
		    "keyColor": "cyan"
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
	    ]
	}
  '';
    ".config/fastfetch/logo.txt".text = ''
        \\  \\     //
         \\  \\   // //
          \\  \\ // //  
      =====\\__\\/ //
           //   \\// 
     =====//     //=====
         //\\___//   
        // /\\  \\=====
       // // \\  \\
      // //   \\  \\
     // //     \\  \\
    '';
  };
}
