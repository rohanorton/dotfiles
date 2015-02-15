" ========================= "
" Rohan's Vim Configuration "
" ========================= "

" Important {{{

    set nocompatible                " It's not 1970, we don't need to be VI compatible
    set encoding=utf-8              " Always use UTF-8

" }}}

" Vundle {{{

    filetype off                                 " Necessary for Vundle setup
    set rtp+=~/.vim/bundle/vundle/               " Set bundle directory
    call vundle#rc()                             " Vundle setup

    " Load plugins:
    Bundle 'gmarik/vundle'                       " Plugin Manager
    Bundle 'scrooloose/nerdtree'                 " File Manager
    Bundle 'scrooloose/nerdcommenter'            " easy commenting for code
    Bundle 'scrooloose/syntastic'                " Static Analysis
    Bundle 'kien/ctrlp.vim'                      " Fuzzy File Finder
    Bundle 'tpope/vim-fugitive'                  " GIT Specific tools
    Bundle 'tpope/vim-repeat'                    " Enable '.' repeating with supported plugins
    Bundle 'tpope/vim-surround'                  " Quoting/parenthesizing made simple
    Bundle 'tpope/vim-speeddating'               " Iterate dates easily
    Bundle 'tpope/vim-unimpaired'                " Tim Pope's bracket mappings
    Bundle 'tpope/vim-abolish'                   " easily search for, substitute, and abbreviate multiple variants of a word
    Bundle 'tpope/vim-commentary'                " comment and uncomment things
    Bundle 'tpope/vim-eunuch'                    " Unix commands in vim
    Bundle 'Raimondi/delimitMate'                " Go to the closing character / tag
    Bundle 'lukaszb/vim-web-indent'              " Better js and html auto indent
    Bundle 'hallison/vim-markdown'               " Markdown highlighting
    Bundle 'kshenoy/vim-signature'               " show line marks
    Bundle 'tristen/vim-sparkup'                 " Sparkup for vim HTML
    Bundle 'gregsexton/MatchTag'                 " Highlights the matching HTML tag
    Bundle 'mileszs/ack.vim'                     " Ack from vim
    Bundle 'vim-scripts/ZoomWin'                 " Toggle zoom
    Bundle 'vim-scripts/Gundo'                   " Visualize your undo true
    Bundle 'myusuf3/numbers.vim'                 " Intelligently toggling line numbers.
    Bundle 'mtth/scratch.vim'                    " Unobtrusive scratch window
    Bundle 'Keithbsmiley/swift.vim'              " Vim runtime files for Swift
    Bundle 'godlygeek/tabular'                   " Vim script for text filtering and alignment
    Bundle 'SirVer/ultisnips'                    " Ultimate snippets solution for vim
    Bundle 'honza/vim-snippets'                  " Some default snippets
    Bundle 'aaronj1335/underscore-templates.vim' " Underscore syntax
    Bundle 'flazz/vim-colorschemes'              " Huge collection of colourschemes
    Bundle 'ap/vim-css-color'                    " Display CSS colours
    Bundle 'maksimr/vim-jsbeautify'              " JS Beautify in vim
    Bundle 'plasticboy/vim-markdown'             " Markdown syntax highlighting and matching rules
    Bundle 'terryma/vim-multiple-cursors'        " Multiple selectors
    Bundle 'avakhov/vim-yaml'                    " YAML syntax
    Bundle 'vimoutliner/vimoutliner'             " Outlining
    Bundle 'benmills/vimux'                      " Run tmux commands from vim

    filetype on                                  " Finally, let's not forget to turn this back on

" }}}

" Copy & Paste {{{

    set pastetoggle=<F2>            " Set F2 to toggle paste mode

    " Custom control-key keybindings for copying, cutting and pasting:
    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-v> c<ESC>"+p
    imap <C-v> <ESC>"+pA

" }}}

" Syntax & Highlighting {{{

    set background=dark             " Background colour brightness
    filetype plugin indent on       " Auto-indent code
    syntax enable                   " Syntax highlighting
    colorscheme jellybeans

" }}}

" Searching {{{
" 
    set magic                       " Changes the way backslashes work in search patterns
    set ignorecase                  " Ignore case when searching
    set smartcase                   " Try and be smart about cases when searching
    set incsearch                   " Shows match for partly typed search commands
    set hlsearch                    " Highlights search results

" }}}

" Displaying text {{{

    set scrolloff=10                " Number of screen lines to show around cursor
    set nowrap                      " Turn off line wrapping
    set lazyredraw                  " Don't redraw when performing macros (improves performance)
    set number                      " Line numbers

" }}}

" Mouse {{{

    set mouse=a                     " No, I'm not l33t, wevs

" }}}

" Editing Text {{{

    set backspace=2                 " Make backspace work like most other apps
    set showmatch                   " Show matching brackets

" }}}

" Tabs & Indenting {{{

    set tabstop=4                   " Number of spaces a <Tab> in text stands for
    set shiftwidth=4
    set expandtab                   " Expand <Tab> to spaces in Insert mode

" }}}

" Buffers {{{

    set hidden                      " Hides buffer when closed

" }}}

" Backups {{{

    set nobackup " Don't keep a backup before overwriting a file
    set nowb " Don't backup file before overwriting
    set noswapfile " Don't use a swap file

" }}}

" Remaps {{{

    " Look ma, no arrow keys!
    noremap <Up> <NOP>
    noremap <Down> <NOP>
    noremap <Left> <NOP>
    noremap <Right> <NOP>

    " Control-a conflicts with Tmux keys, so changing iteration keys to + / -
    nmap + <C-a> 
    nmap - <C-x>

    " Remaps for commonly mistyped commands:
    :command! qw wq
    :command! W w
    :command! Q q

    " Tab and Shift-Tab to indent in normal and insert mode
    nmap <Tab> >> 
    nmap <S-Tab> << 
    imap <S-Tab> <ESC><<i

    " Visual mode searching under the cursor
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

    " Changing default WinZoom key to be similar to tmux
    map <C-w>z <C-w>o
    
" }}}

" Leader Key {{{

  :nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" }}}

" Spelling {{{

    " Set F5 to toggle spellcheck
    :map <F5> :setlocal spell! spelllang=en_uk<CR>"

" }}}

" Terminal {{{

    set t_Co=256 " Set terminal colour to 256 
    set term=xterm-256color " Type of terminal used
    set termencoding=utf-8 " Always UTF-8
    set shell=/usr/local/bin/zsh " set the shell to use

" }}}

" Filetypes {{{

    autocmd BufNewFile,BufRead *.md       set filetype=markdown

    " html style templates
    autocmd BufNewFile,BufRead *.tl       set filetype=html
    autocmd BufNewFile,BufRead *.tpl      set filetype=html
    autocmd BufNewFile,BufRead *.dust     set filetype=html

    " change syntax accordingly...
    autocmd BufNewFile,BufRead *.tpl.html set syntax=underscore_template

    " yaml
    autocmd BufNewFile,BufRead Archfile   set filetype=yaml

"}}}

" Plugin - NERDTree {{{

    nmap <leader>e :NERDTreeToggle<CR>
    autocmd VimEnter * NERDTree " Open by default

    " Close if only one buffer left open:
    autocmd bufenter * if (winnr("$") == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

    " Ignore uses regexp, optional [[file]] or [[dir]]:
    let NERDTreeIgnore=[]

    let NERDTreeAutoDeleteBuffer=1

    autocmd VimEnter * wincmd p " Have NERDTree open as background split

" }}}

" Plugin - Powerline {{{

    " Source the Powerline plugin
    source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

    set gfn=DejaVu\ Sans\ Mono\ for\ Powerline:h11 " Set Font
    let g:Powerline_symbols = 'fancy' " Allow fancy symbols

    set laststatus=2 " Prevent statusline from being hidden if no splits
    
" }}}

" Plugin - UltisSnip {{{

    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsListSnippets  = "<C-tab>"
    let g:UltiSnipsJumpForwardTrigger = "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

" }}}

" vim:fdm=marker
