" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" lets go full retard mode with neovim

source ~/.config/nvim/configs.vim
source ~/.config/nvim/keybindings.vim
" source ~/.config/nvim/statusline.vim
source ~/.config/nvim/terminal_toggle.vim
lua require('plugins')
lua require'lspconfig'.pyright.setup{}
