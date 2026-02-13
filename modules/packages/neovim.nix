{ inputs, config, ... }: {
  perSystem = {pkgs, lib, ...}: let 
    packageName = "mypackage";

    startPlugins =  [
      pkgs.vimPlugins.nvim-lspconfig
      (pkgs.vimUtils.buildVimPlugin {
        name = "base2tone-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "atelierbram";
          repo = "Base2Tone-nvim";
          rev = "HEAD";
          hash = "sha256-XcPZBL4QeiQVCtIoZF63vHdQjl7aCf408MhiFvlrwvI=";
        };
      })     
    ];

    foldPlugins = builtins.foldl' (
      acc: next:
        acc
	++ [ 
	  next
	]
	++ (foldPlugins (next.dependencies or []))
    ) [];

    startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

    packpath = pkgs.runCommandLocal "packpath" {} ''
      mkdir -p $out/pack/${packageName}/{start,opt}
      ${
        lib.concatMapStringsSep
        "\n"
        (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
        startPluginsWithDeps
      }
    '';

    luaConfig = pkgs.writeText "init.lua" ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.lsp.enable({"nixd", "lua_ls"})
      vim.cmd("colorscheme base2tone_lavender_dark")
    '';
  in { 
    packages.neovim = pkgs.symlinkJoin {
      name = "neovim-custom";
      paths = with pkgs; [neovim-unwrapped nixd];
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/nvim \
          --add-flags '-u' \
          --add-flags '${luaConfig}' \
          --add-flags '--cmd' \
          --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
	--prefix PATH : ${lib.makeBinPath [ pkgs.nixd pkgs.lua-language-server ]} \
      '';

      passthru = {
        inherit packpath;
      };
    };
  };
  
}
