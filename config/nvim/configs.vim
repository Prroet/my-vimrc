set nocompatible
" syntax highlighting
syntax enable
filetype on

" path for finding files
set path+=**
" menu for finding
set wildmenu

" tab is only 2 spaces
set tabstop=2
"set softtabstop=2
set shiftwidth=2
retab
set expandtab
" end of tab settings
" set list if we want to see everything
set listchars=tab:»»,space:·,eol:$
" line numbers.
set number relativenumber

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" c-tab
let g:netrw_usetab = 1
let g:netrw_winsize = 10

" enable matchit package for braces matching
" packadd! matchit

" highlight trailing spaces red
" https://stackoverflow.com/questions/48935451/how-do-i-get-vim-to-highlight-trailing-whitespaces-while-using-vim-at-the-same-t
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

colorscheme solarized
set background=dark
