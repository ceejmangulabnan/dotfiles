vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
})

-- Reverse split directions
vim.opt.splitbelow = true -- horizontal splits open ABOVE
vim.opt.splitright = true -- vertical splits open to the LEFT
