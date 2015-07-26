" ============================= "
" Rohan's Neo-Vim Configuration "
" ============================= "

" Plugins {{{

    call plug#begin('~/.nvim/plugged')

    Plug 'kien/ctrlp.vim'                       " Fuzzy File Finder
    Plug 'JazzCore/ctrlp-cmatcher', {'do': './install.sh'} " Speed up CtrlP
    Plug 'scrooloose/nerdtree' " File Manager
    Plug 'flazz/vim-colorschemes'               " Huge collection of colourschemes
    Plug 'elzr/vim-json'                        " Better JSON highlighting
    Plug 'scrooloose/syntastic'                 " Static Analysis
    Plug 'floobits/floobits-neovim', { 'do': 'pip install neovim' } " Vim Pair programming

    call plug#end()

" }}}

" Syntax & Highlighting {{{

    set background=dark             " Background colour brightness
    filetype plugin indent on       " Auto-indent code
    syntax enable                   " Syntax highlighting

    " the try/catch is to prevent error when first installing and the
    " colorscheme doesn't exist
    try
        colorscheme railscast
    catch /^Vim\%((\a\+)\)\=:E185/
    endtry

" }}}

" Plugin - Ctr-P {{{

    " use ctrlp matcher plugin for speedier speedy speed
    let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

    " show dotfiles
    let g:ctrlp_show_hidden = 1

    " follow symlinks (ignore loops)
    let g:ctrlp_follow_symlinks = 1

    if executable('ag')
        " Use ag in CtrlP for listing files. Lightning fast and respects
        " .gitignore
        let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
              \ --ignore "*_bak"
              \ --ignore "*.bak"
              \ --ignore .git
              \ --ignore .svn
              \ --ignore .hg
              \ --ignore .DS_Store
              \ --ignore "**/*.pyc"
              \ --ignore node_modules
              \ -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    endif



" }}}

let g:vim_json_syntax_conceal = 0

" vim:fdm=marker
