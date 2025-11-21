{ inputs, pkgs, lib,...}:

{
  imports = [ inputs.mnw.nixosModules.default ];

  programs.mnw = {
    enable = true;
    initLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.swapfile = false
    '';
    plugins = {
      start = with pkgs.vimPlugins;[
	lualine-nvim
	nvim-lspconfig
	which-key-nvim
      ];
    };
    extraBinPath = with pkgs; [
      lua-language-server
      nixd
      tinymist
    ];
  };
}
