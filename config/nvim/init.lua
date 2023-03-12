require('configs')
require('keybindings')
require('mappings')
require('plugins')
require('lspconfig-configuration')

vim.cmd([[
augroup vimrc
  autocmd BufWritePre *.tf lua vim.lsp.buf.format()
  autocmd BufWritePost *.py silent !black %
augroup END
]])
