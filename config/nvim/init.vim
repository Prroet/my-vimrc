source ~/.config/nvim/configs.vim
source ~/.config/nvim/keybindings.vim
" source ~/.config/nvim/statusline.vim
" source ~/.config/nvim/terminal_toggle.vim

lua << EOF
require('mappings')
require('plugins')
require('lspconfig-configuration')
EOF

autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
