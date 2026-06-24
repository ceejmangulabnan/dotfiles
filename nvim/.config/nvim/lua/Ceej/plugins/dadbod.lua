vim.keymap.set("n", "<leader>d", "", { desc = "+database" })

vim.keymap.set("n", "<leader>db", "<cmd>DBUI<cr>", { desc = "DB UI" })
vim.keymap.set("n", "<leader>dc", "<cmd>DBUIToggle<cr>", { desc = "Toggle DB UI" })
vim.keymap.set("n", "<leader>de", "<cmd>DBUIExecuteQuery<cr>", { desc = "Execute query" })
return {
	{
		"tpope/vim-dadbod",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
	},
	{
		"kristijanhusak/vim-dadbod-completion",
	},
}
