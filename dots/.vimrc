" ========================= "
" Rohan's Vim Configuration "
" ========================= "

" Important {{{

    if !has('nvim')
        set nocompatible                " It's not 1970, we don't need to be VI compatible
        set encoding=utf-8              " Always use UTF-8
        scriptencoding utf-8
    endif

" }}}

" Plugins {{{

    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction

    call plug#begin('~/.vim/plugged')

    Plug 'kien/ctrlp.vim'                       " Fuzzy File Finder
    Plug 'JazzCore/ctrlp-cmatcher', {'do': './install.sh'} " Speed up CtrlP
    Plug 'tpope/vim-vinegar'                    " File Manager
    Plug 'SirVer/ultisnips'                     " Ultimate snippets solution for vim
    Plug 'honza/vim-snippets'                   " Some default snippets
    Plug 'scrooloose/syntastic'                 " Static Analysis
    Plug 'tomtom/tcomment_vim'                  " comment and uncomment things (even works on inline code apparently)
    Plug 'tpope/vim-fugitive'                   " GIT Specific tools
    Plug 'tpope/vim-sleuth'                     " Work out indentation rules on the fly
    Plug 'tpope/vim-repeat'                     " Enable '.' repeating with supported plugins
    Plug 'tpope/vim-surround'                   " Quoting/parenthesizing made simple
    Plug 'tpope/vim-speeddating'                " Iterate dates easily
    Plug 'tpope/vim-unimpaired'                 " Tim Pope's bracket mappings
    Plug 'tpope/vim-abolish'                    " easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'tpope/vim-eunuch'                     " Unix commands in vim
    Plug 'tpope/vim-rails', {'for': 'ruby'}     " Rails for vim
    Plug 'tpope/vim-bundler', {'for': 'ruby'}   " For Rails... you don't strictly need bundler, but it helps
    Plug 'tpope/vim-tbone'                      " Integrate with Tmux
    Plug 'tpope/vim-git'                        " Syntax, indent, and filetype plugin files for git
    Plug 'kshenoy/vim-signature'                " show line marks
    Plug 'mileszs/ack.vim'                      " Ack for vim
    Plug 'rking/ag.vim'                         " Ag for vim
    Plug 'vim-scripts/ZoomWin'                  " Toggle zoom
    Plug 'vim-scripts/Gundo'                    " Visualize your undo true
    Plug 'myusuf3/numbers.vim'                  " Intelligently toggling line numbers.
    Plug 'mtth/scratch.vim'                     " Unobtrusive scratch window
    Plug 'godlygeek/tabular'                    " Vim script for text filtering and alignment
    Plug 'flazz/vim-colorschemes'               " Huge collection of colourschemes
    Plug 'terryma/vim-multiple-cursors'         " Multiple selectors
    Plug 'vimoutliner/vimoutliner'              " Outlining
    Plug 'kana/vim-vspec'                       " Vspec vim testing tools
    Plug 'avakhov/vim-yaml', {'for': 'yaml'}    " YAML syntax
    Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'} " Fold markdown on section headings
    Plug 'Keithbsmiley/swift.vim', {'for': 'swift'} " Vim runtime files for Swift
    Plug 'rust-lang/rust.vim', {'for': 'rust'}  " Rust syntax highlighting and stuff
    Plug 'maksimr/vim-jsbeautify'               " JS Beautify in vim
    Plug 'moll/vim-node'                        " Adds support for `gf` inside require('...') amongst other things
    Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'} " Javascript completion
    Plug 'lukaszb/vim-web-indent', { 'for': ['html'] } " Better js and html auto indent
    Plug 'tristen/vim-sparkup',                 " Sparkup for vim HTML
    Plug 'mattn/emmet-vim'                      " Emmet
    Plug 'gregsexton/MatchTag',                 " Highlights the matching HTML tag
    Plug 'ap/vim-css-color'                     " Display CSS colours
    Plug 'aaronj1335/underscore-templates.vim'  " Underscore syntax
    Plug 'rodjek/vim-puppet', {'for': 'puppet'} " Puppet highlighting etc
    Plug 'keith/tmux.vim', {'for': 'tmux'}      " Tmux conf syntax highlighting
    Plug 'benmills/vimux'                       " Run tmux commands from vim
    Plug 'junegunn/vim-peekaboo'                " View contents of register
    Plug 'bronson/vim-trailing-whitespace'      " Highlight trailing whitespace in red, or remove with FixWhitespace
    Plug 'mustache/vim-mustache-handlebars'     " Mustache / Handlebars syntax etc
    Plug 'elzr/vim-json'                        " Better JSON highlighting
    Plug 'freitass/todo.txt-vim'                " Syntax etc for todo.txt
    Plug 'kchmck/vim-coffee-script'             " Syntax highlighting etc for coffeescript
    Plug 'elixir-lang/vim-elixir'               " Syntax highlighting for elixir
    Plug 'pangloss/vim-javascript'              " Syntax highlighting for javascript
    Plug 'mxw/vim-jsx'                          " Syntax highlighting for jsx
    Plug 'severin-lemaignan/vim-minimap'        " Sublime style minimap
    Plug 'rohanorton/elm-vim'                      " Elm syntax etc
    Plug 'Chiel92/vim-autoformat'               " Automatically format
    Plug 'tommcdo/vim-exchange'                 " Exchange words etc using cx
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/promptline.vim'
    Plug 'edkolev/tmuxline.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'terryma/vim-expand-region' " vvv
    Plug 'christoomey/vim-system-copy' " cp to copy to system clipboard
    Plug 'vim-scripts/argtextobj.vim' " arguments text object
    Plug 'tacahiroy/ctrlp-funky' " function navigation with ctrl-p

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
        Plug 'eagletmt/neco-ghc'                " deoplete ghc completion plugin
        Plug 'carlitux/deoplete-ternjs'         " deoplete for javascript
        Plug 'thinca/vim-ref'
        Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
        Plug 'racer-rust/vim-racer'
    else
        Plug 'Shougo/neocomplete.vim'
    endif

    call plug#end()

" }}}

" Copy & Paste {{{

    set pastetoggle=<F2>            " Set F2 to toggle paste mode

    " Custom control-key keybindings for copying, cutting and pasting:
    vnoremap <C-c> "+yi
    vnoremap <C-x> "+c
    vnoremap <C-v> c<ESC>"+p
    inoremap <C-v> <ESC>"+pA

    " Make Y consistent with D and C
    nnoremap Y y$
" }}}

" Syntax & Highlighting {{{

    set background=dark             " Background colour brightness
    filetype plugin indent on       " Auto-indent code
    syntax enable                   " Syntax highlighting

    " the try/catch is to prevent error when first installing and the
    " colorscheme doesn't exist
    try
        colorscheme jellybeans
    catch /^Vim\%((\a\+)\)\=:E185/
    endtry

    " Highlight merge conflict markers
    match Todo '\v^(\<|\=|\>){7}([^=].+)?$'

    " Jump to next/previous merge conflict marker
    nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
    nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

" }}}

" Layout {{{

    set noequalalways " prevent splits automatically equalizing in size

" }}}

" Bells {{{

    set noerrorbells
    set novisualbell
    set t_vb=
    if has("autocmd")
        augroup disable_bell_in_macvim
            autocmd!
            autocmd! GUIEnter * set vb t_vb=
        augroup END
    endif

" }}}

" Searching {{{
"
    set magic          " Changes the way backslashes work in search patterns
    set ignorecase     " Ignore case when searching
    set smartcase      " Try and be smart about cases when searching
    set incsearch      " Shows match for partly typed search commands
    set hlsearch       " Highlights search results

" }}}

" Displaying text {{{

    set nowrap         " Turn off line wrapping
    set lazyredraw     " Don't redraw when performing macros (improves performance)
    set number         " Line numbers
    set cursorline     " Highlight current line
    hi cursorline cterm=none term=none
    highlight CursorLine guibg=#303000 ctermbg=234

    if has("autocmd")
        augroup reset_cursorline
            " clear group
            autocmd!
            autocmd WinEnter * setlocal cursorline      " Turn cursorline on when entering window
            autocmd WinLeave * setlocal nocursorline    " Turn cursorline off when leaving window
        augroup END
    endif

" }}}

" Mouse {{{

    set mouse=a              " No, I'm not l33t, wevs

    " fix not being able to select beyond col 222
    if !has("nvim")
        if has("mouse_sgr")
            set ttymouse=sgr
        else
            set ttymouse=xterm2
        end
    end

" }}}

" Editing Text {{{

    set backspace=2      " Make backspace work like most other apps
    set showmatch        " Show matching brackets
    set virtualedit=block " Allows moving around the screen freely in visual block mode to define your selections.

" }}}

" Tabs & Indenting {{{

    set tabstop=4        " Number of spaces a <Tab> in text stands for
    set shiftwidth=4
    set expandtab        " Expand <Tab> to spaces in Insert mode

    "" SuperRetab i.e. :'<,'>SuperRetab 2
    "command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" }}}

" Buffers {{{

    set hidden           " Hides buffer when closed

" }}}

" Backups & History {{{

    set nobackup         " Don't keep a backup before overwriting a file
    set nowb             " Don't backup file before overwriting
    set noswapfile       " Don't use a swap file

    set history=1000     " set the history quite big
    set undolevels=2000  " set the undo levels to be big
    set viminfo^=%       " Remember info about open buffers on close

    if has("autocmd")
        augroup goto_last_editing_position_on_open
            " clear group
            autocmd!
            autocmd BufReadPost *
                 \ if line("'\"") > 0 && line("'\"") <= line("$") |
                 \   exe "normal! g`\"" |
                 \ endif
         augroup END
     endif

" }}}

" Remaps {{{

    " Control-a conflicts with Tmux keys, so changing iteration keys to + / _
    " (although - seems preferable, this conflicts with vim-vinegar -- which
    " surely takes priority! -- and it feels weird to be pressing shift for
    " one command but not the other)
    nnoremap + <C-a>
    nnoremap _ <C-x>

    " Remaps for commonly mistyped commands:
    :command! WQ wq
    :command! Wq wq
    :command! W w
    :command! Q q

    " Stop opening that stupid window, you never use it anyway!
    map q: :q

    " Quickly escape using jk or kj -- can mash the keys :)
    inoremap jk <ESC>
    inoremap kj <ESC>
    vnoremap jk <ESC>
    vnoremap kj <ESC>

    " Quickly save from normal mode -- double mashing saves :D
    nnoremap jk :w<CR>
    nnoremap kj :w<CR>

    " Tab and Shift-Tab to indent in normal and insert mode
    nnoremap <S-Tab> <<
    inoremap <S-Tab> <ESC><<i

    " Visual mode searching under the cursor
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

    " Changing default WinZoom key to be similar to tmux
    noremap <C-w>z <C-w>o

    " Space is generally pretty useless, remapping to page-up / page-down
    nnoremap <Space> <C-d>
    nnoremap <Nul> <C-u>

    " Insert newline below / above current position using "oo" and "OO"
    " respectively and retain cursor position.
    " Sets mark "z", so be careful if using marks to navigate about. I don't
    " tend to use marks, and if so usually only homerow keys, so this seems
    " safe.
    " The keybinding  might be an issue if you want to start a new line with
    " o/O, I'm trialing it for now... if it doesn't work, might use
    " <C-Shift> or something.
    nnoremap oo mzo<Esc>`z:delmarks z<CR>
    nnoremap OO mzO<Esc>`z:delmarks z<CR>

    " easier pane navigation:
    nnoremap <C-k> <C-w>k
    nnoremap <C-j> <C-w>j
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    " Open / close undo tree
    nnoremap gun :GundoToggle<Cr>

    " Centre screen when jumping
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz
    nnoremap } }zz
    nnoremap { {zz

    " Move visual selection up / down
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

" }}}

" Leader Key {{{

    " I have also started using a convention for leader key for vimux:
    "    \<space>   - compiles and / or executes the current file
    "    \t         - runs tests
    " These are filetype specific, so the mappings will be found in relevent
    " ftplugin file.

    " \a to ag / ack / grep
    if executable('ag')
        nnoremap <leader>a :Ag<space>
    elseif executable('ack')
        nnoremap <leader>a :Ack<space>
    else
        nnoremap <leader>a :grep<space>
    endif

    " \wq to write quit (5 keystrokes to 3)
    nnoremap <leader>wq :wq<CR>

    " \q to quit
    nnoremap <leader>q :q<CR>

    " \w to write
    nnoremap <leader>w :w<CR>

    " \ev to edit .vimrc
    nnoremap <leader>ev :vsplit $MYVIMRC<CR>

    " \sv to source .vimrc
    nnoremap <leader>sv :source $MYVIMRC<CR>

    " \vd to edit vim diary (where I keep notes on vim commands, plugins, etc)
    nnoremap <leader>vd :vsplit ~/Documents/vim_diary.md<CR>

    " \cd to change directory to cwd of buffer
    noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

    " \= and \- to underline current line
    noremap <leader>= yypVr=
    noremap <leader>- yypVr-

" }}}

" Spelling {{{

    " Set F5 to toggle spellcheck
    noremap <F5> :setlocal spell! spelllang=en_gb<CR>"

" }}}

" Terminal {{{

    set t_Co=256                  " Set terminal colour to 256
    if !has("nvim")
        set term=xterm-256color       " Type of terminal used
    end
    set termencoding=utf-8        " Always UTF-8
    if (executable('zsh'))
        set shell=zsh  " set the shell to use
    else
        set shell=bash
    endif

" }}}

" Filetypes {{{

    if has("autocmd")
        augroup set_filetypes
            " clear group
            autocmd!

            autocmd BufNewFile,BufRead *.md        set filetype=markdown

            " html style templates
            autocmd BufNewFile,BufRead *.tl        set filetype=html
            autocmd BufNewFile,BufRead *.tpl       set filetype=html
            autocmd BufNewFile,BufRead *.dust      set filetype=html

            " change syntax of templates...
            autocmd BufNewFile,BufRead *.tpl.html  set syntax=underscore_template

            " yaml
            autocmd BufNewFile,BufRead Archfile    set filetype=yaml

            " rust
            autocmd BufNewFile,BufRead *.rst       set filetype=rust

            " vspec
            autocmd BufNewFile,BufRead */t/*.vim    set filetype=vspec.vim
        augroup END
    endif

"}}}

" Grep / Ack / Ag {{{

    if executable('ag')
        set grepprg  = "ag --vimgrep"
        let g:ackprg = 'ag --vimgrep'
    elseif executable('ack')
        set grepprg="ack --nogroup --nocolor --column"
    endif


"}}}

" Plugin - Airline {{{

    " Airline separators look rubbish wihtout powerline...
    let g:airline_left_sep=' '
    let g:airline_right_sep=' '
    let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ }
    let g:airline#extensions#whitespace#enabled = 0

    " Tmux
    let g:tmuxline_powerline_separators = 0

    " Shell Prompt
    let g:promptline_powerline_symbols = 0
    let g:promptline_preset = {
        \'a'    : [ '$USER' ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
    let g:promptline_theme = 'jelly'
    let g:promptline_symbols = {
                \ 'left'       : '',
                \ 'left_alt'   : ' ',
                \ 'dir_sep'    : '/',
                \ 'truncation' : '...',
                \ 'vcs_branch' : ' ',
                \ 'space'      : ' '}

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

" Plugin - Deoplete {{{

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1

    " fix issue with deoplete + mutliple cursors
    function Multiple_cursors_before()
        let g:deoplete#disable_auto_complete = 1
    endfunction
    function Multiple_cursors_after()
        let g:deoplete#disable_auto_complete = 0
    endfunction

" }}}

" Plugin - Expand Region{{{

    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

" }}}

" Plugin - Fugitive {{{

    " Easy access to some things:
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gr :Gread<CR>

"}}}

" Plugin - GitGutter {{{

    set updatetime=250

"}}}

" Plugin - Mutliple-Cursors {{{

    " change default behaviour to match word (like * and # searching)
    let g:multi_cursor_start_word_key='<C-n>'
    " if wanting standard behaviour... (like g* and g#)
    let g:multi_cursor_start_key='g<C-n>'

" }}}

" Plugin - Peekaboo {{{

    " open peekaboo window in current window
    let g:peekaboo_window="enew"

" }}}

" Plugin - UltisSnip {{{

    let g:UltiSnipsExpandTrigger        = "<Tab>"
    let g:UltiSnipsJumpForwardTrigger   = "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger  = "<C-k>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " \eu to edit ultisnips file
    nnoremap <leader>eu :UltiSnipsEdit<CR>

" }}}

" Plugin - Vim-JSON {{{

    let g:vim_json_syntax_conceal = 0

"}}}
"
" Plugin - Vimux {{{

    nnoremap <leader>\ :VimuxTogglePane<CR>

" }}}

" Misc. {{{

    if has("autocmd")
        augroup source_vimrc_on_save
            autocmd!
            autocmd bufwritepost .vimrc source $MYVIMRC
        augroup END
    endif

    set timeoutlen=200

" }}}

" vim:fdm=marker
