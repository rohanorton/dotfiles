" UltiSnips Templating idea from Noah Fredrick
" https://noahfrederick.com/log/vim-templates-with-ultisnips-and-projectionist/

function! snippet#Title(basename)
  if exists("g:template_title")
    " Setting g:template_title lets us override the title (once)
    let title = g:template_title
    unlet g:template_title
    return title
  endif
  if exists("b:template_title")
    " Setting b:template_title also lets us override the title
    return b:template_title
  endif
  " Otherwise derive from file's basename
  let title = substitute(a:basename, '\C\(\l\)\(\u\|\d\)', '\1_\l\2', 'g')
  let title = substitute(title, '^.', '\u&', 'g')
  let title = substitute(title, '_\(.\)', ' \u\1', 'g')
  return title
endfunction



function! s:try_insert(skel)
    execute "normal! i_" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"

    if g:ulti_expand_res == 0
        silent! undo
    endif

    return g:ulti_expand_res
endfunction

function! snippet#InsertSkeleton() abort
    let filename = expand('%')

    " Abort on non-empty buffer or extant file
    if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
        return
    endif

    call s:try_insert('skel')
endfunction
