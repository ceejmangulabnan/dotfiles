-- local util = require("lspconfig.util")
--
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         volar = {
--           filetypes = {
--             "typescript",
--             "javascript",
--             "vue",
--           },
--           root_dir = util.root_pattern("src/App.vue"),
--         },
--       },
--     },
--   },
-- }

-- ~/.config/nvim/lua/plugins/vue.lua
-- ~/.config/LazyVim/lua/plugins/lspconfig.lua
return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Vue Language Server (Volar)
        volar = {
          filetypes = { "vue", "typescript", "javascript" },
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },
        -- TypeScript LSP
        tsserver = {
          -- Only handle TS/JS files, not Vue
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        },
        -- ESLint LSP
        eslint = {
          filetypes = {
            "javascript",
            "typescript",
            "vue",
            "javascriptreact",
            "typescriptreact",
          },
        },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vue",
        "typescript",
        "javascript",
        "html",
        "css",
        "scss",
        "json",
      },
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        vue = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    },
  },

  -- Mason (ensure tools are installed)
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "vue-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
      },
    },
  },
}
