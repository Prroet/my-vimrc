source ~/.config/nvim/configs.vim
source ~/.config/nvim/keybindings.vim
" source ~/.config/nvim/statusline.vim
" source ~/.config/nvim/terminal_toggle.vim

lua << EOF
require('mappings')
require('plugins')
require('lspconfig').pyright.setup{}
require('lspconfig').sumneko_lua.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').terraformls.setup{}
require('lspconfig').rls.setup{
  settings = {
    rust = {
      unstable_features = false,
      build_on_save = false,
      all_features = true,
    }   
  },
require('lspconfig').clangd.setup{}
}
EOF

autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
