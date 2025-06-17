require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode (Vim style)" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode (Vim style alt)" })


map("n", ";", ":", { desc = "CMD enter command mode" })

-- Ctrl+S to save (works in normal and insert mode)
map({"n", "i", "v"}, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

-- Ctrl+Z for undo, Ctrl+Y for redo
map("n", "<C-z>", "u", { desc = "Undo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo in insert mode" })

-- Ctrl+A to select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })



-- Ctrl+C, Ctrl+V, Ctrl+X (system clipboard)
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map({"n", "v"}, "<C-v>", '"+p', { desc = "Paste from clipboard" })
map("v", "<C-x>", '"+d', { desc = "Cut to clipboard" })

-- Insert mode paste
map("i", "<C-v>", '<C-r>+', { desc = "Paste in insert mode" })


-- Alt+Up/Down to move lines
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })




-- Ctrl+F for search
map("n", "<C-f>", "/", { desc = "Search" })

-- Tab and Shift+Tab for indentation in visual &normal  mode
map("v", "<Tab>", ">gv", { desc = "Indent" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent" })
map("n", "<Tab>", "V>gv<ESC>", { desc = "Indent" })
map("n", "<S-Tab>", "V<gv<ESC>", { desc = "Outdent" })


-- ==== Text Selection ====
-- Normal mode: start visual selection with Shift+Arrow
map("n", "<S-Up>", "v<Up>", opts)
map("n", "<S-Down>", "v<Down>", opts)
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)

-- Visual mode: extend selection with Shift+Arrow
map("v", "<S-Up>", "<Up>", opts)
map("v", "<S-Down>", "<Down>", opts)
map("v", "<S-Left>", "<Left>", opts)
map("v", "<S-Right>", "<Right>", opts)


-- ===== VSCODE-LIKE LSP MAPPINGS =====

-- F2 for rename
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- F12 for go to definition
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Ctrl+Click simulation with Ctrl+]
map("n", "<C-]>", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Shift+F12 for find references
map("n", "<S-F12>", vim.lsp.buf.references, { desc = "Find references" })

-- Ctrl+. for code actions
map("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Ctrl+Space for completion trigger
map("i", "<C-Space>", "<C-x><C-o>", { desc = "Trigger completion" })



-- Home and End keys behaviors
map({"n", "v"}, "<Home>", "^", { desc = "Go to first non-blank character" })
map({"n", "v"}, "<End>", "$", { desc = "Go to end of line" })
