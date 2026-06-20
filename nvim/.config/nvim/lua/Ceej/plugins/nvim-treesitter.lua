return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local ts = require("nvim-treesitter")

			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})

			ts.setup({
				ensure_installed = {
					"blade",
					"php",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"vue",
					"go",
					"yaml",
					"python",
					"lua",
					"bash",
					"json",
					"markdown",
					"markdown_inline",
				},

				parsers = {
					blade = {
						install_info = {
							url = "https://github.com/EmranMR/tree-sitter-blade",
							files = {
								"src/parser.c",
								"src/scanner.c",
							},
							branch = "main",
						},
						filetype = "blade",
					},
				},
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					pcall(vim.treesitter.start, ev.buf)
				end,
			})
		end,
	},
}
