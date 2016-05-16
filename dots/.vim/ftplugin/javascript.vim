" ========== "
" Javascript "
" ========== "

noremap <buffer> <leader><b> :call JsBeautify()<CR>

map <leader><space> :VimuxRunCommand("clear; npm start")<CR>
map <leader>t :VimuxRunCommand("clear; npm test")<CR>

nmap gd :TernDef<CR>

function! s:set_javascript_checker() " {{{
    " Set which linter syntastic uses based on lint option comments
    let l:lint_comment_line_num = search('\/\*.s.int', 'nwb')
    " Could be eslint, jslint, jshint
    let l:linter = matchstr(getline(l:lint_comment_line_num), '.s.int')

    if (len(l:linter))
        let g:syntastic_javascript_checkers = [ l:linter ]
    endif
endfunction " }}}

" Presume eslint
let g:syntastic_javascript_checkers = ['eslint']

if has("autocmd")
    augroup set_js_linter
        " clear group
        autocmd!
        " check on save for lint comments that might suggest linter
        autocmd BufWritePre <buffer> call s:set_javascript_checker()
    augroup END
endif

" Allow jsx in js files:
let g:jsx_ext_required = 0

" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete

" vim:fdm=marker
