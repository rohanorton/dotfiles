" UltiSnips Templating idea from Noah Fredrick
" https://noahfrederick.com/log/vim-templates-with-ultisnips-and-projectionist/

if !exists('g:did_UltiSnips_plugin')
    finish
endif

augroup ultisnips_custom
    autocmd!
    autocmd BufNewFile * silent! call snippet#InsertSkeleton()
augroup END
