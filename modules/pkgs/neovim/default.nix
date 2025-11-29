{ inputs, pkgs, lib,...}:

{
  imports = [ inputs.mnw.nixosModules.default ];


  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          base2tone-nvim = prev.vimUtils.buildVimPlugin {
            name = "base2tone-nvim";
            src = inputs.plugin-base2tone;
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
      vim.cmd("colorscheme base2tone_lavender_dark")
      require('lualine').setup({
	options = {
	  theme = 'base2tone_lavender_dark',
	},
      })
    '';

    plugins = {
      start = with pkgs.vimPlugins;[
	lualine-nvim
	nvim-lspconfig
	which-key-nvim
	base2tone-nvim
      ];
    };
    extraBinPath = with pkgs; [
      lua-language-server
      nixd
      tinymist
    ];
  };
}
