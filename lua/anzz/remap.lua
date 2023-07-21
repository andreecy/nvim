vim.g.mapleader = " "
-- vim explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>")
-- quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
