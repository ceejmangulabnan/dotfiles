-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Simple LSP optimizations without any buf_request overrides

-- Attempt to resolve LSP timeout with vue projects
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if not client then
--       return
--     end
--
--     -- Optimize Volar specifically
--     if client.name == "volar" then
--       client.config.flags = client.config.flags or {}
--       client.config.flags.debounce_text_changes = 500 -- Longer debounce
--
--       -- Disable capabilities that cause timeouts
--       client.server_capabilities.documentFormattingProvider = false
--       client.server_capabilities.documentRangeFormattingProvider = false
--
--       -- Reduce workspace symbol processing
--       client.server_capabilities.workspaceSymbolProvider = false
--     end
--   end,
-- })

-- Set LSP log level to reduce overhead
vim.lsp.set_log_level("ERROR")

---@diagnostic disable-next-line: deprecated
local ok, _ = pcall(vim.api.nvim_get_autocmds, { group = "LspAttach_conflicts" })
if not ok then
  vim.api.nvim_create_augroup("LspAttach_conflicts", {})
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_conflicts",
  desc = "prevent tsserver and volar competing",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- local active_clients = vim.lsp.get_active_clients()
    local active_clients = vim.lsp.get_clients()

    if client.name == "volar" then
      for _, client_ in pairs(active_clients) do
        if client_.name == "tsserver" then
          client_.stop() -- no arg = default false
        end
      end
    elseif client.name == "tsserver" then
      for _, client_ in pairs(active_clients) do
        if client_.name == "volar" then
          client_.stop() -- no arg = default false
        end
      end
    end
  end,
})
