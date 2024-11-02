return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "nanotee/zoxide.vim",
    lazy = false,
  },
  -- { "nvim-lua/plenary.nvim" },
  -- { "cljoly/telescope-repo.nvim" },
  -- {
  --   "andweeb/presence.nvim",
  --   lazy = false,
  -- },
}
