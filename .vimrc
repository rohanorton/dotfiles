" Rohan's vim configuration

set nocompatible " it's not 1970 anymore bebs

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

execute pathogen#infect()

set encoding=utf8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

set number	" line numbers
set nowrap	" turn off line wrapping

set mouse=a		" no, i'm not l33t, wevs
set backspace=2 " make backspace work like most other apps

set tabstop=2 shiftwidth=2 expandtab

syntax enable	" sytax highlighting
colorscheme jellybeans

filetype plugin indent on " autoindent code

" searching
set ignorecase	" ignore case when searching
set smartcase	" try and be smart about cases when searching
set incsearch	" makes search act like search in modern browsers
set hlsearch	" highlights search results
set magic	" regular expressions

set showmatch	" show matching brackets

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" performance
set lazyredraw	" don't redraw when performing macros

" turn of backups! use git!
set nobackup
set nowb
set noswapfile

set hidden

" syntax highlighting in markdown 
let g:markdown_fenced_languages=[ 'c', 'css', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'scss', 'xml', 'html', 'python' ]


" copy + paste {
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pA
set pastetoggle=<F2>
" }

" NERDtree {
  autocmd VimEnter * NERDTree " open by default
  nmap <leader>e :NERDTreeToggle<CR>
  " close if only one buffer left open
  autocmd bufenter * if (winnr("$") == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
  " ignore: uses regexp, optional [[file]] and [[dir]] can be used in
  " specification
  let NERDTreeIgnore=[]
  let NERDTreeAutoDeleteBuffer=1
  " bit of a hack, but we want nerdtree to be opened as background split ...
  autocmd VimEnter * wincmd p
" }


" back tabs
nmap <S-Tab> << 
imap <S-Tab> <ESC><<i

" powerline
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline:h11
let g:Powerline_symbols = 'fancy'
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

" return to last edit position when opening tabs
autocmd BufReadPost * 
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" better iteration keybindings
nmap + <C-a>
nmap - <C-x>


let g:syntastic_javascript_checkers = ['jslint']
autocmd FileType javascript noremap <buffer> <C-f> :call JsBeautify()<CR>
autocmd FileType json noremap <buffer> <C-f> :call JsBeautify()<CR>

" Scratch {
let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 0
" }

:map <F5> :setlocal spell! spelllang=en_uk<CR>"

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" UltiSnip {
    "let g:BASH_Ctrl_j = 'off'
    "let g:UltiSnipsExpandTrigger="<tab>"
    "let g:UltiSnipsJumpForwardTrigger="<tab>"
    "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsListSnippets  = "<c-tab>"
    let g:UltiSnipsJumpForwardTrigger = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
" }

" rebind for maximising window (similar to tmux)
map <C-w>z <C-w>o


:source ~/.vim/extensions.vim
