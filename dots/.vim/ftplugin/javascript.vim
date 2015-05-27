" ========== "
" Javascript "
" ========== "

noremap <buffer> <leader><b> :call JsBeautify()<CR>

map <leader><space> :VimuxRunCommand("clear; npm start")<CR>
map <leader>t :VimuxRunCommand("clear; npm test")<CR>

nmap gd :TernDef<CR>

function! s:set_javascript_checker() " {{{
    " Set which linter syntastic uses based on lint option comments
    let l:lint_comment_line_num = search('\/\*js.int', 'nwb')
    let l:linter = matchstr(getline(l:lint_comment_line_num), 'js.int')

    if (len(l:linter))
        let g:syntastic_javascript_checkers = [ l:linter ]
    endif
endfunction " }}}

" Presume jslint
let g:syntastic_javascript_checkers = ['jslint']

if has("autocmd")
    augroup set_js_linter
        " clear group
        autocmd!
        " check on save for lint comments that might suggest linter
        autocmd BufWritePre <buffer> call s:set_javascript_checker()
    augroup END
endif

" vim:fdm=marker
