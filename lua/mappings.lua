require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

function CloseAndSwitch()
  local current_buf = vim.fn.bufnr "%"
  vim.cmd "bdelete"
  if vim.fn.bufexists(current_buf) then
    vim.cmd "bnext"
  end
end

function formatFile()
  require("conform").format()
end

vim.api.nvim_create_user_command("Format", formatFile, { desc = "Format the current buffer using conform" })

vim.api.nvim_set_keymap("n", "<C-F4>", ":lua CloseAndSwitch()<CR>", { noremap = true, silent = true })

-- CTRL SHIFT SELECTION IN NORMAL AND INSERT MODE --
vim.api.nvim_set_keymap("n", "<C-S-Right>", "vw", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Left>", "vb", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Up>", "vk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Down>", "vj", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-Right>", "vl", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Left>", "vh", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Up>", "vk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "vj", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-Home>", "v<Home>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-End>", "v<End>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-S-Right>", "<C-O>vw", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-S-Left>", "<C-O>vb", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-S-Up>", "<C-O>vk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-S-Down>", "<C-O>vj", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<S-Right>", "<C-O>vl", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Left>", "<C-O>vh", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<C-O>vk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Down>", "<C-O>vj", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<S-Home>", "<C-O>v<Home>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-End>", "<C-O>v<End>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<C-S-Right>", "l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-Left>", "h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-Up>", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-Down>", "vj", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<S-Right>", "l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Left>", "h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Up>", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Down>", "j", { noremap = true, silent = true })

------------------------------------------------------

-- COPY PASTE UNDO IN NORMAL AND INSERT MODE --
vim.api.nvim_set_keymap("n", "<C-V>", '"+gP', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Z>", "u", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-V>", '<C-O>"+gP', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Z>", '<C-O>"u', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-Z>", '<Esc>"u', { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<C-C>", '"+y', { noremap = true, silent = true })
-----------------------------------------------

-- Indentation --
vim.api.nvim_set_keymap("v", "<Tab>", ">", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", "v>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Tab>", "<Esc>v>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<S-Tab>", "<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "v<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "<Esc>v<", { noremap = true, silent = true })
-- Tab Switching --
vim.api.nvim_set_keymap("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Left>", "<C-o>:bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Right>", "<C-o>:bnext<CR>", { noremap = true, silent = true })
-- Command Mode --
vim.api.nvim_set_keymap("i", "<C-S-p>", "<Esc>:", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-p>", "<Esc>:", { noremap = true, silent = true })
-- Duplicate line --
vim.api.nvim_set_keymap("n", "<C-d>", "<Esc>:t.<Enter>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-d>", "<Esc>:t.<Enter>i", { noremap = true, silent = true })

-- Comment Toggle --
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false, silent = true })
vim.api.nvim_set_keymap("i", "<C-/>", "<Esc>gcci", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "<C-/>", "gc<CR>", { noremap = false, silent = true })

-- Format file --
vim.api.nvim_set_keymap("i", "<S-A-f>", "<Esc>:Format<Enter>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-A-f>", "<Esc>:Format<Enter>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-A-f>", ":Format<Enter>", { noremap = true, silent = true })

---- Ctrl + S to  Save ----
vim.api.nvim_set_keymap("n", "<C-S>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-S>", "<C-O>:w<CR>", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
