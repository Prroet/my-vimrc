require('configs')
require('keybindings')
require('mappings')
require('plugins')
require('lspconfig-configuration')

vim.cmd([[
  autocmd BufWritePre *.tf lua vim.lsp.buf.format()
]])

vim.cmd([[
  autocmd BufWritePost *.py !black %
]])
