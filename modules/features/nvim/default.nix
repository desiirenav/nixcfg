{ inputs, pkgs, lib,...}:

{
  imports = [ inputs.mnw.nixosModules.default ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          oldworld-nvim = prev.vimUtils.buildVimPlugin {
            name = "oldworld-nvim";
            src = inputs.plugin-oldworld;
          };
        };
      })
    ];
  };

  programs.mnw = {
    enable = true;
    aliases = [
      "vi"
      "vim"
    ];
    initLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.swapfile = false
      vim.lsp.enable({"lua_ls", "nixd", "tinymist"})
      vim.cmd("colorscheme oldworld")
      require('lualine').setup({
	options = {
	  theme = 'oldworld',
	},
      })
    '';
    plugins = {
      start = with pkgs.vimPlugins;[
	lualine-nvim
	nvim-lspconfig
	which-key-nvim
	nord-nvim
        oldworld-nvim
      ];
    };
    extraBinPath = with pkgs; [
      lua-language-server
      nixd
      tinymist
    ];
  };
}
