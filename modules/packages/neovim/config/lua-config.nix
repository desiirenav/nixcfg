{...}:
''
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.cmd("colorscheme base2tone_lavender_dark")
  vim.lsp.enable({"nixd", "lua_ls"})
  require('lualine').setup()
''
