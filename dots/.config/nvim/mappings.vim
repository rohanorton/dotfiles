" Key Mappings.

" jk - escape / save
inoremap <silent> jk <esc>
inoremap <silent> kj <esc>
nnoremap <silent> jk :w<CR>
nnoremap <silent> kj :w<CR>

" Make Y consistent with D and C
nnoremap Y y$

" goto last file
nnoremap <silent> gl <c-^>

" Clear search highlight on double-tap escape
nnoremap <silent> <esc><esc> :noh<CR>

" Jump to alternate file.
nnoremap <silent> <leader>. :A<CR>

" Jump to next/prev buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>

" Git / Fugitive
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gc :Gcommit -v -q<CR>

" Overwrite gs -- why would you want to go to sleep?!
nnoremap <silent> gs :Git<CR>


" Line numbers (absolute and relative)
nnoremap <silent> <leader>la :setlocal norelativenumber<CR>
nnoremap <silent> <leader>lr :setlocal relativenumber<CR>


