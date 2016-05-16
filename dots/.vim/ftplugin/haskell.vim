" if vimux
" set keybinding for vimux:
map <leader><space> :VimuxRunCommand("clear; runhaskell " . bufname("%") )<CR>

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

