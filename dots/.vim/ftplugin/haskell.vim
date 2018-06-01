" if vimux
" set keybinding for vimux:
map <leader><space> :VimuxRunCommand("clear; runhaskell " . bufname("%") )<CR>
map <leader>r :VimuxRunCommand("clear; ghci " . bufname("%") )<CR>

let g:ale_linters = { 'haskell': ['stack-ghc', 'ghc-mod', 'hlint', 'hdevtools', 'hfmt'], }

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc=0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ale_sign_column_always=1

" noremap <silent> tw :GhcModTypeInsert<CR>
" noremap <silent> ts :GhcModSplitFunCase<CR>
" noremap <silent> tq :GhcModType<CR>
" noremap <silent> te :GhcModTypeClear<CR>

" au BufWrite * :Autoformat
