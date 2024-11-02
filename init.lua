vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)



-- require("telescope").load_extension "repo"
-- require("presence"):setup {
--   auto_update = true,
--   neovim_image_text = "The best ide",
--   main_image = "neovim",
--   editing_text = "Editing %s",
--   file_explorer_text = "Browsing files",
--   reading_text = "Reading %s",
--   workspace_text = "Working on %s",
-- }

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.8
  vim.o.guifont = "JetBrainsMono Nerd Font"

end
