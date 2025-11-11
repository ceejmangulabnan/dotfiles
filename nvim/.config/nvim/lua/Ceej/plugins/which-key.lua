return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      spelling = true,
      marks = true,
    },
    preset = {
      z = true,
      g = true,
    },
    icons = {
      separator = "",
      group = "",
    },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      -- this was a copy paste and doesn't do anything
      -- and there is the surround plugin installed so
      -- maybet that can get annotated here
      -- ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>b"] = { name = " buffers" },
      ["<leader>c"] = { name = " code" },
      ["<leader>f"] = { name = " file/find" },
      ["<leader>g"] = { name = "󰘭 git" },
      -- ["<leader>i"] = { name = "󰛢 Grapple" },
      ["<leader>j"] = { name = " Flash" },
      ["<leader>m"] = { name = "󱃲 Visual Multi" },
      ["<leader>p"] = { name = " Packages" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>u"] = { name = "󰨇 Ui/Ux" },
      ["<leader>w"] = { name = " Windows" },
      ["<leader>x"] = { name = "󱁤 Diagnostics/Quickfix" },
      ["<leader>t"] = { name = " Terminal" },
      ["<leader>z"] = { name = "󰩈 Quit" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
