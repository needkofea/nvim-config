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

require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
}
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
  ---- Ctrl + S to  Save ----
  -- Normal mode
  vim.api.nvim_set_keymap("n", "<C-S>", ":w<CR>", { noremap = true, silent = true })
  -- Visual mode
  vim.api.nvim_set_keymap("v", "<C-S>", ":w<CR>", { noremap = true, silent = true })
  -- Insert mode
  vim.api.nvim_set_keymap("i", "<C-S>", "<C-O>:w<CR>", { noremap = true, silent = true })
  ---------------------------
end
