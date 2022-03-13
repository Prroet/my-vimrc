" Keybindings
" Command Mode
noremap <F5> :!./%
" build Dockerfile e.g. Dockerfile.example will build exaple:latest
noremap <F6> :!docker build --file % --tag %:e .
