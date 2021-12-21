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
" make sure netrw is always 25 width

function SetupExplorer()
  :Vexplore
  :vertical 0resize30
  :wincmd h
  :set winfixwidth
endfunction

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :call SetupExplorer()
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
if has('nvim')
  call plug#begin(stdpath('data') . '/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
" Initialize plugin system
"
Plug 'https://github.com/ycm-core/YouCompleteMe.git', { 'do': './install.py'}
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop', 'do': 'git submodule update --init --recursive' }
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/hashivim/vim-packer.git'
Plug 'https://github.com/hashivim/vim-terraform'
" Plug 'https://github.com/pangloss/vim-javascript'

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

function OpenTerminal()
  " TODO toggle terminal
  20split+terminal
  call chansend(bufnr(), 'export EDITOR="nvim -u NORC"')
  set winfixheight
endfunction

set splitbelow
noremap <F12> :call OpenTerminal()<CR>
" TODO send export EDITOR=nvim -u NORC via term_sendkeys(buffer_id, keys_to_send)


" Overwrites Register pasting functionality in command mode!
" cnoremap <C-r> YcmCompleter RefactorRename

" highlight trailing spaces red
" https://stackoverflow.com/questions/48935451/how-do-i-get-vim-to-highlight-trailing-whitespaces-while-using-vim-at-the-same-t
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/


" Status Line {
"        set laststatus=2                             " always show statusbar
        set statusline=
        set statusline=
        set statusline+=%-10.3n\                     " buffer number
        set statusline+=%f\                          " filename
        set statusline+=%h%m%r%w                     " status flags
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
        set statusline+=%=                           " right align remainder
        set statusline+=HexVal\ 
        set statusline+=0x%-8B                       " character value
        set statusline+=Pos\ 
        set statusline+=%-14(%l,%c%V%)               " line, character
        set statusline+=%<%P                         " file position
"}
