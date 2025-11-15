{
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,    
  lua-language-server,
  nixd,
  tinymist,
  vimPlugins,
  lib,
}: let
  packageName = "mypackage";
  startPlugins = with vimPlugins;[
    base16-nvim
    lualine-nvim
    nvim-lspconfig
    which-key-nvim
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
    mkdir -p $out/pack/${packageName}/start
    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }
  '';
  
  runtimePackages = [
    lua-language-server
    nixd
    tinymist
  ];
in
  symlinkJoin {
    name = "neovim-custom";
    paths = [neovim-unwrapped];
    nativeBuildInputs = [makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --add-flags "--cmd 'set packpath^=${packpath}'" \
        --add-flags "--cmd 'set runtimepath^=${packpath}'" \
        --prefix PATH : ${lib.makeBinPath runtimePackages}
    '';
    passthru = {
      inherit packpath;
    };
  } 
