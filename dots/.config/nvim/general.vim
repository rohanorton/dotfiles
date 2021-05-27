" Set space to leader
nnoremap <SPACE> <Nop>
let g:mapleader="\<Space>"

let g:coc_node_path = '/Users/rohan/.asdf/shims/node'

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme jellybeans
" set airline theme
let g:airline_theme='jellybeans'

set title
set encoding=utf-8

" Hide buffers
set hidden

set tabstop=2
set shiftwidth=2
set expandtab

set mouse=a " Mouse support

" line numbering
set number

" Automatically update contents of vim if file has changed
set autoread



" Turn off line wrapping
set nowrap


" set timeoutlen=200
set timeoutlen=200 ttimeoutlen=0

set magic          " Changes the way backslashes work in search patterns
set ignorecase     " Ignore case when searching
set smartcase      " Try and be smart about cases when searching
set incsearch      " Shows match for partly typed search commands
set hlsearch       " Highlights search results

" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

set laststatus=2
set ruler
set wildmenu

set noequalalways " prevent splits automatically equalizing in size


set clipboard=unnamedplus

