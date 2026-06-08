return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")

			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = { "markdown" },
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"vue",
					"go",
					"yaml",
					"html",
					"css",
					"python",
					"http",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
					"java",
					"rust",
					"ron",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
					},
				},
			})
		end,
	},
}

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	dependencies = {
-- 		{
-- 			"nvim-treesitter/nvim-treesitter-context",
-- 			opts = {
-- 				max_lines = 4,
-- 				multiline_threshold = 2,
-- 			},
-- 		},
-- 	},
-- 	lazy = false,
-- 	branch = "master",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local ts = require("nvim-treesitter")
--
-- 		-- State tracking for async parser loading
-- 		local parsers_loaded = {}
-- 		local parsers_pending = {}
-- 		local parsers_failed = {}
--
-- 		local ns = vim.api.nvim_create_namespace("treesitter.async")
--
-- 		-- Helper to start highlighting and indentation
-- 		local function start(buf, lang)
-- 			local ok = pcall(vim.treesitter.start, buf, lang)
-- 			if ok then
-- 				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 			end
-- 			return ok
-- 		end
--
-- 		-- Install core parsers after lazy.nvim finishes loading all plugins
-- 		vim.api.nvim_create_autocmd("User", {
-- 			pattern = "LazyDone",
-- 			once = true,
-- 			callback = function()
-- 				ts.install({
-- 					"json",
-- 					"javascript",
-- 					"typescript",
-- 					"tsx",
-- 					"vue",
-- 					"go",
-- 					"yaml",
-- 					"html",
-- 					"css",
-- 					"python",
-- 					"http",
-- 					"prisma",
-- 					"markdown",
-- 					"markdown_inline",
-- 					"svelte",
-- 					"graphql",
-- 					"bash",
-- 					"lua",
-- 					"vim",
-- 					"dockerfile",
-- 					"gitignore",
-- 					"query",
-- 					"vimdoc",
-- 					"c",
-- 					"java",
-- 					"rust",
-- 					"bash",
-- 					"comment",
-- 					"git_config",
-- 					"git_rebase",
-- 					"gitcommit",
-- 					"gitignore",
-- 					"luadoc",
-- 					"make",
-- 					"python",
-- 					"regex",
-- 					"scss",
-- 					"svelte",
-- 					"toml",
-- 					"tsx",
-- 					"typescript",
-- 					"typst",
-- 					"xml",
-- 				}, {
-- 					max_jobs = 8,
-- 				})
-- 			end,
-- 		})
--
-- 		-- Decoration provider for async parser loading
-- 		vim.api.nvim_set_decoration_provider(ns, {
-- 			on_start = vim.schedule_wrap(function()
-- 				if #parsers_pending == 0 then
-- 					return false
-- 				end
-- 				for _, data in ipairs(parsers_pending) do
-- 					if vim.api.nvim_buf_is_valid(data.buf) then
-- 						if start(data.buf, data.lang) then
-- 							parsers_loaded[data.lang] = true
-- 						else
-- 							parsers_failed[data.lang] = true
-- 						end
-- 					end
-- 				end
-- 				parsers_pending = {}
-- 			end),
-- 		})
--
-- 		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
--
-- 		local ignore_filetypes = {
-- 			"checkhealth",
-- 			"lazy",
-- 			"mason",
-- 			"snacks_dashboard",
-- 			"snacks_notif",
-- 			"snacks_win",
-- 		}
--
-- 		-- Auto-install parsers and enable highlighting on FileType
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			group = group,
-- 			desc = "Enable treesitter highlighting and indentation (non-blocking)",
-- 			callback = function(event)
-- 				if vim.tbl_contains(ignore_filetypes, event.match) then
-- 					return
-- 				end
--
-- 				local lang = vim.treesitter.language.get_lang(event.match) or event.match
-- 				local buf = event.buf
--
-- 				if parsers_failed[lang] then
-- 					return
-- 				end
--
-- 				if parsers_loaded[lang] then
-- 					-- Parser already loaded, start immediately (fast path)
-- 					start(buf, lang)
-- 				else
-- 					-- Queue for async loading
-- 					table.insert(parsers_pending, { buf = buf, lang = lang })
-- 				end
--
-- 				-- Auto-install missing parsers (async, no-op if already installed)
-- 				ts.install({ lang })
-- 			end,
-- 		})
-- 	end,
-- }
