return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			vtsls = {},
			vue_ls = {},
			ts_ls = {},
			cssls = {},
			tailwindcss = {},
			marksman = {},
			pyright = {},
		}

		mason_lspconfig.setup({
			ensure_installed = servers,
		})

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"prettierd",
			"prettier",
			"stylua",
		})

		mason_tool_installer.setup({
			ensure_installed = ensure_installed,
		})

		local vue_language_server_path = vim.fn.expand("$MASON/packages")
			.. "/vue-language-server"
			.. "/node_modules/@vue/language-server"

		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}

		local vtsls_config = {
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							vue_plugin,
						},
					},
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		}

		for server, config in pairs(servers) do
			if server == "vtsls" then
				vim.lsp.config("vtsls", vtsls_config)
				vim.lsp.enable({ "vtsls" })
			else
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end
	end,
}
