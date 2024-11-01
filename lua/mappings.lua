require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

function CloseAndSwitch()
  local current_buf = vim.fn.bufnr('%')
  vim.cmd('bdelete')
  if vim.fn.bufexists(current_buf) then
    vim.cmd('bnext')
  end
end

vim.api.nvim_set_keymap('n', '<C-F4>', ':lua CloseAndSwitch()<CR>', { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
