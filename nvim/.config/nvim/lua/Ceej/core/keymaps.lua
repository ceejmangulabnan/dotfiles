-- ----------- General Keymaps -----------
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>")

vim.keymap.set("n", ";", ":", { desc = "Command" })
vim.keymap.set("v", ";", ":", { desc = "Command in v" })

vim.keymap.set("n", ",p", '"0p', { desc = "Paste yanked" })
vim.keymap.set("v", ",p", '"0p', { desc = "Paste yanked" })

vim.keymap.set("n", "<leader>cl", "<cmd>%s/\r//g<CR>", { desc = "Clear" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<C-[>", "<cmd>tabprevious<CR>", { desc = "Go to Previous Tab" })
vim.keymap.set("n", "<C-]>", "<cmd>tabnext<CR>", { desc = "Go to Next Tab" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Window/Pane Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Clipboard options for working in WSL
-- vim.g.clipboard = {
--   name = 'WslClipboard',
--   copy = {
--     ['+'] = 'clip.exe',
--     ['*'] = 'clip.exe',
--   },
--   paste = {
--     ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }

-- ----------- Plugin Keymaps -----------

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Conform
-- vim.keymap.set("n", "<leader>cf", function()
--   require("conform").format()
-- end, { desc = "Format current file" })
