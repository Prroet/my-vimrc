require('configs')
require('keybindings')

require('mappings')
require('plugins')
require('lspconfig-configuration')

vim.cmd([[
  set guifont=Hack\ Nerd\ Font\ Mono
  autocmd BufWritePre *.tf lua vim.lsp.buf.format()
]])
