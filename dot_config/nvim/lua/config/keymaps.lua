-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

keymap("n", "j", "jzz", { desc = "Move down and center line" })
keymap("n", "k", "kzz", { desc = "Move up and center line" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page and center" })
keymap("n", "<leader>a", "gg<S-v><S-g>", { desc = "Select all" })
