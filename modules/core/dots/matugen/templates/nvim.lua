vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.swapfile = false

require('base16-colorscheme').setup({
  base00 = "{{colors.background.default.hex}}",
  base01 = "{{colors.surface_container_lowest.default.hex}}",
  base02 = "{{colors.surface_container_low.default.hex}}",
  base03 = "{{colors.outline_variant.default.hex}}",    
  base04 = "{{colors.on_surface_variant.default.hex}}", 
  base05 = "{{colors.on_surface.default.hex}}",         
  base06 = "{{colors.inverse_on_surface.default.hex}}", 
  base07 = "{{colors.surface_bright.default.hex}}",    
  base08 = "{{colors.error.default.hex}}",
  base09 = "{{colors.tertiary.default.hex}}",
  base0A = "{{colors.secondary.default.hex}}",
  base0B = "{{colors.primary.default.hex}}",
  base0C = "{{colors.tertiary_container.default.hex}}",
  base0D = "{{colors.primary_container.default.hex}}",
  base0E = "{{colors.secondary_container.default.hex}}",
  base0F = "{{colors.error_container.default.hex}}",
})

vim.api.nvim_set_hl(0, 'Visual', {
  bg = '{{colors.primary_container.default.hex}}',
  fg = '{{colors.background.default.hex}}',
})

require('lualine').setup({
  options = {
    theme = "base16",
  }
})

local function source_matugen()
  -- Update this with the location of your output file
  local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua"  -- dofile doesn't expand $HOME or ~

  local file, err = io.open(matugen_path, "r")
  -- If the matugen file does not exist (yet or at all), we must initialize a color scheme ourselves
  if err ~= nil then
    -- Some placeholder theme, this will be overwritten once matugen kicks in
    vim.cmd('colorscheme base16-catppuccin-mocha')

    -- Optionally print something to the user
    vim.print("A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!")
  else
    dofile(matugen_path)
    io.close(file)
  end
end

-- Main entrypoint on matugen reloads
local function auxiliary_function()
  -- Load the matugen style file to get all the new colors
  source_matugen()

  dofile(os.getenv("HOME") .. '/.config/nvim/config/plugins/lualine-nvim.lua')

  -- Any other options you wish to set upon matugen reloads can also go here!
  vim.api.nvim_set_hl(0, "Comment", { italic = true })
end

-- Register an autocmd to listen for matugen updates
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = auxiliary_function,
})
