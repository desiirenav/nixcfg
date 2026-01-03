{
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  callPackage,
  writeText,
  lua-language-server,
  nixd,
  lib,
}: let
  packageName = "mypackage";
  
  startPlugins = with vimPlugins; [
    nvim-lspconfig
    base2tone-nvim
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

  packpath = runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }
  '';
  luaConfig = writeText "init.lua" (callPackage ./lua-config.nix {});
in
  symlinkJoin {
    name = "neovim-custom";
    paths = [neovim-unwrapped nixd];
    nativeBuildInputs = [makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --add-flags '-u' \
        --add-flags '${luaConfig}' \
        --add-flags '--cmd' \
        --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
	--prefix PATH : ${lib.makeBinPath [ nixd lua-language-server ]} \
    '';

    passthru = {
      inherit packpath;
    };
  }

  
  

