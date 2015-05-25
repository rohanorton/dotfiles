" ========== "
" Javascript "
" ========== "

noremap <buffer> <leader><b> :call JsBeautify()<CR>

map <leader><space> :VimuxRunCommand("clear; npm start")<CR>
map <leader>t :VimuxRunCommand("clear; npm test")<CR>

nmap gd :TernDef<CR>

function! s:set_javascript_checker() " {{{
    " Set which linter syntastic uses based on lint option comments

    let l:linter = ""
    let l:line_number = 0
    let l:last_line = line('$')

    while l:line_number < l:last_line 
        let l:str = matchstr(getline(l:line_number), '\/\*js.int')
        if len(l:str)
            let l:linter = matchstr(l:str, 'js.int')
            break
        endif 
        let l:line_number = l:line_number + 1
    endwhile

    if (len(l:linter))
        let g:syntastic_javascript_checkers = [ l:linter ]
    endif
endfunction " }}}

" Presume jslint
let g:syntastic_javascript_checkers = ['jslint']
" But check on save for lint comments that might suggest otherwise...
autocmd BufWritePre <buffer> call s:set_javascript_checker()

" vim:fdm=marker
