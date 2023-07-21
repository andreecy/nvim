vim.opt.termguicolors = true
local bufferline = require("bufferline")

bufferline.setup {}

vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>1", function() bufferline.go_to(1, true) end)
vim.keymap.set("n", "<leader>2", function() bufferline.go_to(2, true) end)
vim.keymap.set("n", "<leader>3", function() bufferline.go_to(3, true) end)
vim.keymap.set("n", "<leader>4", function() bufferline.go_to(4, true) end)
vim.keymap.set("n", "<leader>5", function() bufferline.go_to(5, true) end)
vim.keymap.set("n", "<leader>6", function() bufferline.go_to(6, true) end)
vim.keymap.set("n", "<leader>7", function() bufferline.go_to(7, true) end)
vim.keymap.set("n", "<leader>8", function() bufferline.go_to(8, true) end)
vim.keymap.set("n", "<leader>9", function() bufferline.go_to(9, true) end)
