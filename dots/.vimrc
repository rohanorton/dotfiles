" ========================= "
" Rohan's Vim Configuration "
" ========================= "

" Important {{{

    if !has('nvim')
        set nocompatible                " It's not 1970, we don't need to be VI compatible
        set encoding=utf-8              " Always use UTF-8
        scriptencoding utf-8
    endif

    set exrc
    set secure

" }}}

" Plugins {{{

    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction

    call plug#begin('~/.vim/plugged')

    Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy File Finder
    Plug 'JazzCore/ctrlp-cmatcher', {'do': './install.sh'} " Speed up CtrlP
    Plug 'tpope/vim-vinegar'                    " File Manager
    Plug 'SirVer/ultisnips'                     " Ultimate snippets solution for vim
    Plug 'honza/vim-snippets'                   " Some default snippets
    Plug 'w0rp/ale'                             " Async linting
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
    Plug 'tpope/vim-projectionist'
    Plug 'kshenoy/vim-signature'                " show line marks
    Plug 'mileszs/ack.vim'                      " Ack for vim
    Plug 'drn/zoomwin-vim'                      " Toggle zoom
    Plug 'myusuf3/numbers.vim'                  " Intelligently toggling line numbers.
    Plug 'godlygeek/tabular'                    " Vim script for text filtering and alignment
    Plug 'flazz/vim-colorschemes'               " Huge collection of colourschemes
    Plug 'avakhov/vim-yaml', {'for': 'yaml'}    " YAML syntax
    Plug 'keith/swift.vim', {'for': 'swift'} " Vim runtime files for Swift
    Plug 'rust-lang/rust.vim', {'for': 'rust'}  " Rust syntax highlighting and stuff
    Plug 'maksimr/vim-jsbeautify'               " JS Beautify in vim
    Plug 'moll/vim-node'                        " Adds support for `gf` inside require('...') amongst other things
    Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'} " Javascript completion
    Plug 'lukaszb/vim-web-indent', { 'for': ['html'] } " Better js and html auto indent
    Plug 'tristen/vim-sparkup',                 " Sparkup for vim HTML
    Plug 'mhinz/vim-mix-format'
    Plug 'mattn/emmet-vim'                      " Emmet
    Plug 'aaronj1335/underscore-templates.vim'  " Underscore syntax
    Plug 'keith/tmux.vim', {'for': 'tmux'}      " Tmux conf syntax highlighting
    Plug 'benmills/vimux'                       " Run tmux commands from vim
    Plug 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespace in red
    Plug 'mustache/vim-mustache-handlebars'     " Mustache / Handlebars syntax etc
    Plug 'elzr/vim-json'                        " Better JSON highlighting
    Plug 'freitass/todo.txt-vim'                " Syntax etc for todo.txt
    Plug 'kchmck/vim-coffee-script'             " Syntax highlighting etc for coffeescript
    Plug 'elixir-lang/vim-elixir'               " Syntax highlighting for elixir
    Plug 'pangloss/vim-javascript'              " Syntax highlighting for javascript
    Plug 'mxw/vim-jsx'                          " Syntax highlighting for jsx
    " Plug 'ElmCast/elm-vim'                      " Elm syntax etc
    Plug 'Zaptic/elm-vim'                      " Elm syntax etc (but with better test support)
    Plug 'Chiel92/vim-autoformat'               " Automatically format
    Plug 'tommcdo/vim-exchange'                 " Exchange words etc using cx
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/promptline.vim'
    " Plug 'edkolev/tmuxline.vim'   " Messes with my custom tmux prompt. Might
                                    " remove later, but tempted to try and use
                                    " this to do what I'm doing in
                                    " tmux-jellybeans (probably not possible)
    Plug 'airblade/vim-gitgutter'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'terryma/vim-expand-region' " vvv
    Plug 'christoomey/vim-system-copy' " cp to copy to system clipboard
    Plug 'jiangmiao/auto-pairs' " auto-close stuff
    Plug 'chrisbra/NrrwRgn'
    Plug 'flowtype/vim-flow'
    Plug 'junegunn/vim-peekaboo'                " View contents of register
    Plug '/usr/local/opt/fzf'                   " Installed via brew
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/vim-pseudocl'
    Plug 'junegunn/vim-oblique'
    Plug 'junegunn/limelight.vim' " Focussed writing
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-endwise' " auto end in ruby
    Plug 'raichoo/purescript-vim'
    Plug 'idris-hackers/idris-vim'
    Plug 'craigemery/vim-autotag' " automatically + intelligently update tags file on filesave
    Plug 'jparise/vim-graphql'
    Plug 'leafgarland/typescript-vim'
    Plug 'prettier/vim-prettier', {
                \ 'do': 'yarn install',
                \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

    Plug 'vim-erlang/vim-erlang-omnicomplete'
    Plug 'slashmili/alchemist.vim'
    Plug 'c-brenn/phoenix.vim'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'Chiel92/vim-autoformat'
    Plug 'blindFS/vim-taskwarrior'

    " Custom text objects...
    Plug 'kana/vim-textobj-user'
    Plug 'vim-scripts/argtextobj.vim' " arguments text object
    Plug 'andyl/vim-textobj-elixir'
    Plug 'kana/vim-textobj-function'
    Plug 'thinca/vim-localrc'
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
    Plug 'xolox/vim-misc'
    Plug 'rhysd/vim-clang-format'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


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
    set laststatus=2   " Always show status bar
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
    " Make sure to set timeoutlen to something smaller than the default
    " otherwise this is unbearable!!
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

    " Open / close undo tree
    nnoremap gun :GundoToggle<Cr>

    " Centre screen when jumping

    " Move visual selection up / down
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    " JSON prettify
    nnoremap <C-f> :%!python -m json.tool<CR>


    " Ctrl-Space for omni-completions. Awww Yeah!
    inoremap <C-Space> <C-x><C-o>
    imap <C-@> <C-Space>

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
        vnoremap <leader>a "xy:Ag <C-R>x<CR>
    elseif executable('ack')
        nnoremap <leader>a :Ack<space>
        vnoremap <leader>a "xy:Ack <C-R>x<CR>
    else
        nnoremap <leader>a :grep<space>
        vnoremap <leader>a "xy:grep <C-R>x<CR>
    endif

    " \wq to write quit (5 keystrokes to 3)
    nnoremap <leader>wq :wq<CR>

    " \q to quit
    nnoremap <leader>q :q<CR>

    " \qa to quit all
    nnoremap <leader>qa :qa<CR>

    " \qq to force quit
    nnoremap <leader>qq :q!<CR>

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

    noremap <leader>; :

    " Jump to alternate file
    noremap <leader>. :A<CR>

    " start search+replace quicker
    nnoremap <leader>/ :%s///<left><left>
    vnoremap <leader>/ :s///<left><left>

    " ALTERNATE LEADER:
    " I have my leader as \ but using <space> here as an alternative leader
    " key (it's easier for working with capital letters)

    " These commands are for wrapping selected text.
    " we want to utilise vim-surround for this action, hence not using a
    " noremap
    vmap <space>( S(
    vmap <space>) S)
    vmap <space>{ S{
    vmap <space>} S}
    vmap <space>< S<
    vmap <space>> S>
    vmap <space>[ S[
    vmap <space>] S]
    vmap <space>" S"
    vmap <space>' S'

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

            " JSON
            autocmd BufNewFile,BufRead .eslintrc   set filetype=json
            autocmd BufNewFile,BufRead .babelrc    set filetype=json
            autocmd BufNewFile,BufRead .prettierrc set filetype=json

            " html style templates
            autocmd BufNewFile,BufRead *.tl        set filetype=html
            autocmd BufNewFile,BufRead *.tpl       set filetype=html
            autocmd BufNewFile,BufRead *.dust      set filetype=html

            " change syntax of templates...
            autocmd BufNewFile,BufRead *.tpl.html  set syntax=underscore_template

            " graphql
            autocmd BufNewFile,BufRead *.graphcool set filetype=graphql

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
        set grepprg="ag --vimgrep"
        let g:ackprg='ag --vimgrep'
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

" Plugin - Ale {{{

    let g:ale_sign_column_always = 1
    let g:airline#extensions#ale#enabled = 1
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    let g:ale_echo_msg_error_str = 'Error'
    let g:ale_echo_msg_warning_str = 'Warning'
    let g:ale_echo_msg_format = '[%linter%] %severity%: %s '

" }}}

" Plugin - Better Whitespace {{{

    let g:better_whitespace_filetypes_blacklist=['GV']

    "Muscle memory gets the better of me:
    :command! FixWhitespace StripWhitespace

" }}}

" Plugin - Completor {{{

    let g:completor_erlang_omni_trigger = '[^\s]+:[^\s]+'

" }}}

" Plugin - Ctr-P {{{

    " use ctrlp matcher plugin for speedier speedy speed
    " let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

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

    if exists("*Multiple_cursors_before")
        " fix issue with deoplete + mutliple cursors
        function Multiple_cursors_before()
            let g:deoplete#disable_auto_complete = 1
        endfunction
        function Multiple_cursors_after()
            let g:deoplete#disable_auto_complete = 0
        endfunction
    endif

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

" Plugin - FZF {{{

 set rtp+=/usr/local/opt/fzf

 " Ag completions
 command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"}}}

" Plugin - GitGutter {{{

    set updatetime=250

"}}}

" Plugin - Language Client {{{

    let g:LanguageClient_serverCommands = {
        \ 'reason': ['ocaml-language-server', '--stdio'],
        \ 'ocaml': ['ocaml-language-server', '--stdio'],
        \ }
    " Automatically start language servers.
    let g:LanguageClient_autoStart = 1

" }}}

" Plugin - Limelight {{{

    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

" }}}

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

" Plugin - Vim-Test {{{

    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>s :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>

    let test#strategy = "vimux"

"}}}

" Plugin - Vimux {{{

    nnoremap <leader>\ :VimuxTogglePane<CR>

" }}}

" Misc. {{{

    let g:autotagTagsFile="tags"
    let g:calendar_google_calendar = 1
    let g:rustfmt_autosave = 1

    if has("autocmd")
        augroup source_vimrc_on_save
            autocmd!
            autocmd bufwritepost .vimrc source $MYVIMRC
        augroup END

        augroup format_on_save
            autocmd!
            autocmd FileType c ClangFormatAutoEnable
        augroup END

        augroup mkdir_on_write
            autocmd!
            autocmd BufWritePre *
                        \ if !isdirectory(expand("<afile>:p:h")) |
                        \ call mkdir(expand("<afile>:p:h"), "p") |
                        \ endif
        augroup END

        augroup goyo_limelight_setup
            autocmd! User GoyoEnter Limelight
            autocmd! User GoyoLeave Limelight!
        augroup END
    endif

    set timeoutlen=200
    set title

" }}}

" vim:fdm=marker
