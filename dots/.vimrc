" ========================= "
" Rohan's Vim Configuration "
" ========================= "

" Important {{{

    set nocompatible                " It's not 1970, we don't need to be VI compatible
    set encoding=utf-8              " Always use UTF-8
    scriptencoding utf-8

" }}}

" Vundle {{{

    filetype off                                  " Necessary for Vundle setup
    set rtp+=~/.vim/bundle/Vundle.vim             " Set bundle directory
    call vundle#begin()                           " Vundle setup

    " Load plugins:
    Plugin 'gmarik/Vundle.vim'                    " Plugin Manager
    Plugin 'kien/ctrlp.vim'                       " Fuzzy File Finder
    Plugin 'JazzCore/ctrlp-cmatcher'              " Speed up CtrlP
    Plugin 'scrooloose/syntastic'                 " Static Analysis
    Plugin 'scrooloose/nerdcommenter'             " easy commenting for code
    "Plugin 'scrooloose/nerdtree'                  " File Manager
    Plugin 'tpope/vim-fugitive'                   " GIT Specific tools
    Plugin 'tpope/vim-sleuth'                     " Work out indentation rules on the fly
    Plugin 'tpope/vim-vinegar'                    " File Manager
    Plugin 'tpope/vim-repeat'                     " Enable '.' repeating with supported plugins
    Plugin 'tpope/vim-surround'                   " Quoting/parenthesizing made simple
    Plugin 'tpope/vim-speeddating'                " Iterate dates easily
    Plugin 'tpope/vim-unimpaired'                 " Tim Pope's bracket mappings
    Plugin 'tpope/vim-abolish'                    " easily search for, substitute, and abbreviate multiple variants of a word
    Plugin 'tpope/vim-commentary'                 " comment and uncomment things
    Plugin 'tpope/vim-eunuch'                     " Unix commands in vim
    Plugin 'tpope/vim-rails'                      " Rails for vim
    Plugin 'tpope/vim-bundler'                    " For Rails... you don't strictly need bundler, but it helps
    Plugin 'lukaszb/vim-web-indent'               " Better js and html auto indent
    Plugin 'kshenoy/vim-signature'                " show line marks
    Plugin 'tristen/vim-sparkup'                  " Sparkup for vim HTML
    Plugin 'gregsexton/MatchTag'                  " Highlights the matching HTML tag
    Plugin 'mileszs/ack.vim'                      " Ack from vim
    Plugin 'vim-scripts/ZoomWin'                  " Toggle zoom
    Plugin 'vim-scripts/Gundo'                    " Visualize your undo true
    Plugin 'myusuf3/numbers.vim'                  " Intelligently toggling line numbers.
    Plugin 'mtth/scratch.vim'                     " Unobtrusive scratch window
    Plugin 'Keithbsmiley/swift.vim'               " Vim runtime files for Swift
    Plugin 'godlygeek/tabular'                    " Vim script for text filtering and alignment
    Plugin 'SirVer/ultisnips'                     " Ultimate snippets solution for vim
    Plugin 'honza/vim-snippets'                   " Some default snippets
    Plugin 'aaronj1335/underscore-templates.vim'  " Underscore syntax
    Plugin 'flazz/vim-colorschemes'               " Huge collection of colourschemes
    Plugin 'ap/vim-css-color'                     " Display CSS colours
    Plugin 'maksimr/vim-jsbeautify'               " JS Beautify in vim
    Plugin 'terryma/vim-multiple-cursors'         " Multiple selectors
    Plugin 'avakhov/vim-yaml'                     " YAML syntax
    Plugin 'vimoutliner/vimoutliner'              " Outlining
    Plugin 'benmills/vimux'                       " Run tmux commands from vim
    Plugin 'kana/vim-vspec'                       " Vspec vim testing tools
    Plugin 'rust-lang/rust.vim'                   " Rust syntax highlighting and stuff
    Plugin 'takac/vim-hardtime'                   " Makes using hjkl and arrow harder (1 second pause)
    Plugin 'nelstrom/vim-markdown-folding'        " Fold markdown on section headings
    Plugin 'Valloric/YouCompleteMe'               " Syntax completion
    Plugin 'marijnh/tern_for_vim'                 " Javascript completion
    Plugin 'rodjek/vim-puppet'                    " Puppet highlighting etc

    call vundle#end()                            " Vundle setup
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

    " the try/catch is to prevent error when first installing and the
    " colorscheme doesn't exist
    try
        colorscheme jellybeans
    catch /^Vim\%((\a\+)\)\=:E185/
    endtry

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
    autocmd WinEnter * setlocal cursorline      " Turn cursorline on when entering window
    autocmd WinLeave * setlocal nocursorline    " Turn cursorline off when leaving window
    highlight CursorLine guibg=#303000 ctermbg=234

" }}}

" Mouse {{{

    set mouse=a              " No, I'm not l33t, wevs

    " fix not being able to select beyond col 222
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end

" }}}

" Editing Text {{{

    set backspace=2      " Make backspace work like most other apps
    set showmatch        " Show matching brackets

" }}}

" Tabs & Indenting {{{

    "set tabstop=4        " Number of spaces a <Tab> in text stands for
    "set shiftwidth=4
    "set expandtab        " Expand <Tab> to spaces in Insert mode

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

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif

" }}}

" Remaps {{{

    " Control-a conflicts with Tmux keys, so changing iteration keys to + / _
    " (although - seems preferable, this conflicts with vim-vinegar -- which
    " surely takes priority! -- and it feels weird to be pressing shift for
    " one command but not the other)
    nmap + <C-a>
    nmap _ <C-x>

    " Remaps for commonly mistyped commands:
    :command! WQ wq
    :command! Wq wq
    :command! W w
    :command! Q q
    :command! W w
    :command! Q q

    " Tab and Shift-Tab to indent in normal and insert mode
    nmap <S-Tab> <<
    imap <S-Tab> <ESC><<i

    " Visual mode searching under the cursor
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

    " Changing default WinZoom key to be similar to tmux
    map <C-w>z <C-w>o

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
    nnoremap oo mzo<Esc>`z
    nnoremap OO mzO<Esc>`z

" }}}

" Leader Key {{{

    " I have also started using a convention for leader key for vimux:
    "    \<space>   - compiles and / or executes the current file
    "    \t         - runs tests
    " These are filetype specific, so the mappings will be found in relevent
    " ftplugin file.

    " \a to ag / ack / grep
    if executable('ag')
        nnoremap <leader>a :Ag
    elseif executable('ack')
        nnoremap <leader>a :Ack
    else
        nnoremap <leader>a :grep
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
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

" }}}

" Spelling {{{

    " Set F5 to toggle spellcheck
    :map <F5> :setlocal spell! spelllang=en_gb<CR>"

" }}}

" Terminal {{{

    set t_Co=256                  " Set terminal colour to 256
    set term=xterm-256color       " Type of terminal used
    set termencoding=utf-8        " Always UTF-8
    set shell=/usr/local/bin/zsh  " set the shell to use

" }}}

" Filetypes {{{

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

"}}}

" Grep / Ack / Ag {{{

    if executable('ag')
        set grepprg="ag --nogroup --nocolor --column"
        let g:ackprg = 'ag --nogroup --nocolor --column'
        command -nargs=+ -complete=file -bar Ag silent! grep!  <args>|cwindow|redraw!
    elseif executable('ack')
        set grepprg="ack --nogroup --nocolor --column"
    endif


"}}}

" Plugin - Ctr-P {{{

    " use ctrlp matcher plugin for speedier speedy speed
    let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

    " show dotfiles
    let g:ctrlp_show_hidden = 1

    if executable('ag')
        " Use ag in CtrlP for listing files. Lightning fast and respects
        " .gitignore
        let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
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

" Plugin - Fugitive {{{

    " Easy access to some things:
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gb :Gblame<CR>

"}}}

" Plugin - Hardtime {{{

    let g:hardtime_default_on = 1 " turn hardtime on

    let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
    let g:list_of_visual_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
    let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

    let g:hardtime_ignore_buffer_patterns = []

    let g:hardtime_ignore_quickfix = 1

    let g:hardtime_allow_different_key = 1 "allow a key if it is different from the previous key ('jk' but not 'jj')

    let g:hardtime_timeout = 2000 " timeout in ms

    let g:hardtime_showmsg = 1 " show message

    let g:hardtime_maxcount = 1 " number of keypresses that start hardtime

" }}}

" Plugin - Mutliple-Cursors {{{

    " change default behaviour to match word (like * and # searching)
    let g:multi_cursor_start_word_key='<C-n>'
    " if wanting standard behaviour... (like g* and g#)
    let g:multi_cursor_start_key='g<C-n>'

" }}}

" Plugin - NERDTree {{{

    "nmap <leader>e :NERDTreeToggle<CR>
    "autocmd VimEnter * NERDTree     " Open by default

    "" Close if only one buffer left open:
    "autocmd bufenter * if (winnr("$") == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

    "" Ignore uses regexp, optional [[file]] or [[dir]]:
    "let NERDTreeIgnore=[]

    "let NERDTreeAutoDeleteBuffer=1

    "autocmd VimEnter * wincmd p     " Have NERDTree open as background split

" }}}

" Plugin - Powerline {{{

    " Source the Powerline plugin

    if filereadable("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
	source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

	set gfn=DejaVu\ Sans\ Mono\ for\ Powerline:h11  " Set Font
	let g:Powerline_symbols = 'fancy'               " Allow fancy symbols

	set laststatus=2                                " Prevent statusline from being hidden if no splits
    endif

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

" Plugin - Vimux {{{

    nnoremap <leader>\ :VimuxTogglePane<CR>

" }}}

" Plugin - YouCompleteMe {{{

    let g:ycm_key_list_select_completion=[]
    let g:ycm_key_list_previous_completion=[]

"}}}

" Misc. {{{

    if has("autocmd")
        " Source the vimrc file after saving it
        autocmd bufwritepost .vimrc source $MYVIMRC

        " Strip trailing whitespace ... may not want this on all files, but it
        " is for now
        autocmd BufWritePre * :%s/\s\+$//e|norm!``
    endif

    set timeoutlen=200

" }}}

" vim:fdm=marker
