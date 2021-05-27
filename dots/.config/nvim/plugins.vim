" Plugins

call plug#begin(stdpath('data') . '/plugged')

    Plug 'dense-analysis/ale' " asynchronous static analysis
    Plug 'sheerun/vim-polyglot' " curated language packs
    " Plug 'prettier/vim-prettier' " make things pretty
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy file finder
    Plug 'junegunn/fzf.vim' " usefully packaged fzf commands
    Plug 'janko/vim-test' " run file tests with command
    " Plug 'SirVer/ultisnips' " snippet
    Plug 'benmills/vimux' " vim integration with tmux
    Plug 'tpope/vim-projectionist' " project setup files
    Plug 'tpope/vim-commentary' " (un)comment code quickly
    " Plug 'tpope/vim-surround' " working with surrounding symbols
    Plug 'tpope/vim-vinegar' " file traversing with -
    " Plug 'tpope/vim-endwise' " Add ends to things
    Plug 'tpope/vim-eunuch' " Unix commands in vim
    Plug 'tpope/vim-abolish' " Abolish + Subvert for better matching
    Plug 'tpope/vim-unimpaired' " [p etc
    Plug 'tpope/vim-repeat' " better .
    Plug 'vim-airline/vim-airline' " Bottom bar
    " Plug 'myusuf3/numbers.vim' " relative line numbers in normal, absolute in insert

    " GIT
    Plug 'tpope/vim-fugitive' " git git git
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/gv.vim'
    Plug 'sodapopcan/vim-twiggy' " branches
    Plug 'rbong/vim-flog' " git tree viewer (needs fugitive)
    Plug 'jreybert/vimagit' " magit for vim :O

    " Color schemes....
    " Plug 'jacoborus/tender.vim'
    Plug 'nanotech/jellybeans.vim'
    Plug 'vim-airline/vim-airline-themes'

    " Fetch that line + column.
    " Odd name, makes opening a file at line/column number easier:
    "     vim somefile.txt:14:100
    Plug 'wsdjeg/vim-fetch'

    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
    Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}

    Plug 'mbbill/undotree'
    Plug 'godlygeek/tabular'

" Initialize plugin system
call plug#end()
