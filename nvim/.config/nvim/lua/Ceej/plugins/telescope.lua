return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local whichkey = require("which-key")

		-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		whichkey.add({
			{ "<leader>s", group = "Search" },
		})

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}

-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	branch = "master", -- using master to fix issues with deprecated to definition warnings
-- 	-- '0.1.x' for stable ver.
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
-- 		"nvim-tree/nvim-web-devicons",
-- 		"andrew-george/telescope-themes",
-- 	},
-- 	config = function()
-- 		local telescope = require("telescope")
-- 		local actions = require("telescope.actions")
-- 		local builtin = require("telescope.builtin")
--
-- 		telescope.load_extension("fzf")
-- 		telescope.load_extension("themes")
--
-- 		telescope.setup({
-- 			defaults = {
-- 				path_display = { "smart" },
-- 				mappings = {
-- 					i = {
-- 						["<C-k>"] = actions.move_selection_previous,
-- 						["<C-j>"] = actions.move_selection_next,
-- 					},
-- 				},
-- 			},
-- 			extensions = {
-- 				themes = {
-- 					enable_previewer = true,
-- 					enable_live_preview = true,
-- 					persist = {
-- 						enabled = true,
-- 						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		-- Keymaps
-- 		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
-- 		vim.keymap.set("n", "<leader>pWs", function()
-- 			local word = vim.fn.expand("<cWORD>")
-- 			builtin.grep_string({ search = word })
-- 		end, { desc = "Find Connected Words under cursor" })
--
-- 		vim.keymap.set(
-- 			"n",
-- 			"<leader>ths",
-- 			"<cmd>Telescope themes<CR>",
-- 			{ noremap = true, silent = true, desc = "Theme Switcher" }
-- 		)
-- 	end,
-- }
