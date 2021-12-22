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
" c-tab
let g:netrw_usetab = 1
let g:netrw_winsize = 10

" enable matchit package for braces matching
packadd! matchit

command MakeTags silent !ctags -R .
command DestroyTags !rm tags

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
" Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/hashivim/vim-packer.git'
Plug 'https://github.com/hashivim/vim-terraform'
" Plug 'https://github.com/pangloss/vim-javascript'

call plug#end()

" Keybindings
" Command Mode
noremap <F5> :!./%
" build Dockerfile e.g. Dockerfile.example will build exaple:latest
noremap <F6> :!docker build --file % --tag %:e .

autocmd TermOpen * startinsert
function CreateTerminal()
  set splitbelow
  20split+terminal
  ":call chansend(bufnr("$"), 'export EDITOR="nvim -u NORC"')
  set winfixheight
endfunction

function ToggleTerminal()
  " Check for an active terminal
  " get first terminal id
  " get window height
  " if height == 1 make larger
  " else make 1
  " resize to 1
  let l:terminal_winnr=uniq(map(filter(getwininfo(), 'v:val.terminal'), 'v:val.winnr'))
  if len(l:terminal_winnr) == 0
    call CreateTerminal()
  else
    let l:new_term_height=1
    if winheight(l:terminal_winnr[0]) == 1
      let l:new_term_height=20
    endif
    let l:resize_cmd = l:terminal_winnr[0] . "resize" . l:new_term_height
    echo "Resize command: " + l:resize_cmd
    execute l:resize_cmd
  endif
endfunction

noremap <F12> :call ToggleTerminal()<CR>


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
