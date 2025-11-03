-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor on page down", remap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor on page up", remap = true })

vim.keymap.set("n", ";", ":", { desc = "Command" })
vim.keymap.set("v", ";", ":", { desc = "Command in v" })

vim.keymap.set("n", ",p", '"0p', { desc = "Paste yanked" })
vim.keymap.set("v", ",p", '"0p', { desc = "Paste yanked" })

-- ---- Plugin Keymaps
-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Snacks
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
