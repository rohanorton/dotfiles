let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_format_fail_silently = 1

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
