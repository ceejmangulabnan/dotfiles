return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'markdown',
  -- Some keymaps
  init = function()
    vim.opt.conceallevel = 2
    vim.api.nvim_create_user_command('ObsidianNewBlank ', function()
      vim.cmd 'ObsidianNew '
      vim.cmd 'normal! ggVGd' -- Cleans markdown file
      vim.cmd 'ObsidianTemplate'
    end, {})

    vim.keymap.set('n', '<leader>on', ':ObsidianNewBlank<CR>', { desc = '[O]bsidian [N]ew' })
    vim.keymap.set('n', '<leader>ot', ':ObsidianTemplate<CR>', { desc = '[O]bsidian [T]emplate' })
  end,

  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'tech-notes',
        -- Path to Obsidian Vault
        path = '/mnt/c/Users/ceej/Documents/obsidian-brain',
      },
    },
    -- Where new notes will be created
    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',
    disable_frontmatter = true,
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Modified the function to return the filename as "YYYY-MM-DD-HHMM_title.md"
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- If the current date is August 10, 2024, 12 PM
      -- Returns the filename as 2024-08-10-1200_title.md
      return tostring(os.date '%Y-%m-%d' .. '-' .. os.date '%H%M' .. '_' .. suffix)
    end,

    -- Template Options
    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },

    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    -- see below for full list of options 👇
  },
}
