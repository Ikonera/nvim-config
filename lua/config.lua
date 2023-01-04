local lspconfig = vim.diagnostic.config

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.completeopt = "menu,noselect"
vim.o.mouse =

lspconfig({
  virtual_text = {
    prefix = ""
  }
})
