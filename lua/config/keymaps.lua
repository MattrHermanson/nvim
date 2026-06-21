-- Clear search highlights on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlight" })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Move windows around the layout
vim.keymap.set("n", "<leader>mH", "<C-w>H", { desc = "Move window to far left" })
vim.keymap.set("n", "<leader>mJ", "<C-w>J", { desc = "Move window to bottom" })
vim.keymap.set("n", "<leader>mK", "<C-w>K", { desc = "Move window to top" })
vim.keymap.set("n", "<leader>mL", "<C-w>L", { desc = "Move window to far right" })

-- Split windows using leader key
vim.keymap.set("n", "<leader>sh", ":split<CR>", { silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { silent = true, desc = "Split window vertically" })

-- Layout equalization and maximizing
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>zo", ":only<CR>", { desc = "Close all other windows (Zoom)" })

-- Shrink / Grow window width by 5 columns
vim.keymap.set("n", "<C-,>", ":vertical resize -5<CR>", { silent = true, desc = "Shrink window width" })
vim.keymap.set("n", "<C-.>", ":vertical resize +5<CR>", { silent = true, desc = "Grow window width" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
