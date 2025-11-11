return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			log_level = vim.log.levels.DEBUG,
			log_to_file = true,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				vue = { "prettierd", "prettier" },
			},
			format_on_save = {
				timeout_ms = 5000,
				lsp_fallback = false,
			},
		})
	end,
}
