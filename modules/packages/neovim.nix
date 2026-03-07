{ self, inputs, config, ... }: {
  perSystem = {pkgs, lib, ...}: let
    inherit (self) theme;
    packageName = "mypackage";

    startPlugins =  [
      pkgs.vimPlugins.base16-nvim
      pkgs.vimPlugins.nvim-lspconfig
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
      require('base16-colorscheme').setup({
	base00 = '#${theme.base00}', base01 = '#${theme.base01}', base02 = '#${theme.base02}', base03 = '#${theme.base03}',
	base04 = '#${theme.base04}', base05 = '#${theme.base05}', base06 = '#${theme.base06}', base07 = '#${theme.base07}',
	base08 = '#${theme.base08}', base09 = '#${theme.base09}', base0A = '#${theme.base0A}', base0B = '#${theme.base0B}',
	base0C = '#${theme.base0C}', base0D = '#${theme.base0D}', base0E = '#${theme.base0E}', base0F = '#${theme.base0F}',
      })
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
