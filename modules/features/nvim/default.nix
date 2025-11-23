{ inputs, pkgs, lib,...}:

{
  imports = [ inputs.mnw.nixosModules.default ];

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
      vim.cmd.colorscheme("dark-orchid")
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
