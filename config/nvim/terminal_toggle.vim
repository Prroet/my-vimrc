autocmd TermOpen * startinsert
function CreateTerminal()
  set splitbelow
  20split+terminal
  ":call chansend(bufnr("$"), 'export EDITOR="nvim -u NORC"')
  set winheight=20
  set winfixheight
endfunction

function ToggleTerminal()
  " Check for an active terminal
  " get first terminal id
  " get window height
  " if height == 1 make larger
  " else make 1
  " resize to 1
  let l:terminal_winnr=uniq(map(filter(getwininfo(), 'v:val.terminal && v:val.tabnr == '. tabpagenr()), 'v:val.winnr'))
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
