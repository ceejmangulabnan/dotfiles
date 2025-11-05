return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
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
				timeout_ms = 10000,
				lsp_fallback = true,
			},
		})
	end,
}
