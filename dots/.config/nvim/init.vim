source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/coc-config.vim
source $HOME/.config/nvim/mappings.vim

" {{{ FZF

    " setup fuzzy finder to work like ctrlp
    let $FZF_DEFAULT_COMMAND = 'rg --files' " Use ripgrep
    nnoremap <C-p> :Files<CR>
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>/ :Rg<space>

" }}}


" {{{ Airline


    " Airline separators look rubbish wihtout powerline...
    let g:airline_left_sep=' '
    let g:airline_right_sep=' '
    let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : ':',
            \ 'v'  : 'v',
            \ 'V'  : 'V',
            \ 's'  : 's',
            \ 'S'  : 'S',
            \ }
     let g:airline#extensions#whitespace#enabled = 0

" }}}


augroup help_config
  autocmd!
  autocmd FileType help :set number
augroup END

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/nvim/undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

augroup strip_trailing_whitespace_on_save
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup end

" Source vimrc on save
augroup source_vimrc_on_save
    autocmd!
    autocmd bufwritepost init.vim source $MYVIMRC
augroup END

