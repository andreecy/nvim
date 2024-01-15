-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local lazyvim_util = require("lazyvim.util")
local set = vim.keymap.set
local del = vim.keymap.del

-- remove windows default keymap
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")

set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer" })
