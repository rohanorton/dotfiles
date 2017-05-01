" if vimux
" set keybinding for vimux:
map <leader><space> :VimuxRunCommand("clear; runhaskell " . bufname("%") )<CR>
map <leader>r :VimuxRunCommand("clear; ghci " . bufname("%") )<CR>

let g:ale_linters = { 'haskell': ['stack-ghc'], }

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc=0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ale_sign_column_always=1
