" if vimux
" set keybinding for vimux:
map <leader><space> :w<CR>:VimuxRunCommand("clear; cargo run")<CR>

map <leader>t :w<CR>:VimuxRunCommand("clear; cargo test")<CR>

