set nocompatible
" syntax highlighting
syntax enable
filetype on

" Default Vim completion
set omnifunc=syntaxcomplete#Complete

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

" to autocomplete words with hyphen
set iskeyword+=-

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" enable matchit package
packadd! matchit

command MakeTags silent !ctags -R .
command DestroyTags !rm tags
" tagging
"augroup vimrc_tag
"  autocmd VimEnter * MakeTags
"  autocmd VimLeave * DestroyTags
"augroup END
"

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
" Initialize plugin system
"
Plug 'https://github.com/ycm-core/YouCompleteMe.git', { 'do': './install.py'}
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop', 'do': 'git submodule update --init --recursive' }
Plug 'https://github.com/airblade/vim-gitgutter.git'

call plug#end()

"let g:ycm_python_interpreter_path = ''
"let g:ycm_python_sys_path = []
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" Keybindings
" Command Mode
noremap <F5> :!./%
" build Dockerfile e.g. Dockerfile.example will build exaple:latest
noremap <F6> :!docker build --file % --tag %:e .

noremap <F12> :botright+10split+terminal

" Overwrites Register pasting functionality in command mode!
" cnoremap <C-r> YcmCompleter RefactorRename

" highlight trailing spaces red
" https://stackoverflow.com/questions/48935451/how-do-i-get-vim-to-highlight-trailing-whitespaces-while-using-vim-at-the-same-t
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/
