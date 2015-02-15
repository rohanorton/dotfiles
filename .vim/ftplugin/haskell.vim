" if vimux
" set keybinding for vimux:
map <leader><space> :VimuxRunCommand("clear; runhaskell " . bufname("%") )<CR>

