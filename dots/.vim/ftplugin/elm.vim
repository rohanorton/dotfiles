" Neomake makers:
" Using https://github.com/rohanorton/elm-lint-script
let g:neomake_elm_elm_lint_maker = { 'exe': '/usr/local/sbin/elm-lint', 'errorformat': '%f:%l:%c [%t] %m' }
let g:neomake_elm_enabled_makers = ['elm_lint']

let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

if !has("nvim")
    call neocomplete#util#set_default_dictionary(
      \ 'g:neocomplete#sources#omni#input_patterns',
      \ 'elm',
      \ '\.')
else

end

set expandtab
set shiftwidth=4
set softtabstop=4

nnoremap K :ElmShowDocs<CR>
noremap _t :ElmShowInferredType<CR>
noremap _T :ElmInsertInferredType<CR>
