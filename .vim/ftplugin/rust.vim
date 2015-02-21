" if vimux
" set keybinding for vimux:
map <leader><space> :VimuxRunCommand("clear; rustc " . bufname("%") . " && ./" . expand("%:r") )<CR>

map <leader>t :VimuxRunCommand("clear; rustc --test " . bufname("%") . " && ./" . expand("%:r") . "; rm " . expand("%:r"))<CR>

