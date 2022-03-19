source ~/.config/nvim/configs.vim
source ~/.config/nvim/keybindings.vim
" source ~/.config/nvim/statusline.vim
" source ~/.config/nvim/terminal_toggle.vim

lua << EOF
-- require('lua/mappings')
require('plugins')
require('lspconfig').pyright.setup{}
require('lspconfig').sumneko_lua.setup{}
EOF
