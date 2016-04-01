
set textwidth=80 " don't allow text over 80 char long

" Highlights text that goes over the 80 char length
highlight OverLength ctermbg=red  ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" syntax highlighting for fenced code blocks
let g:markdown_fenced_languages=[
    \   'c',
    \   'css',
    \   'html',
    \   'javascript',
    \   'js=javascript',
    \   'java',
    \   'cpp',
    \   'cs',
    \   'php',
    \   'json',
    \   'python',
    \   'ruby',
    \   'rb=ruby',
    \   'sass',
    \   'scss',
    \   'vim',
    \   'xml',
    \   'haskell',
    \   'hs=haskell',
    \   'elm',
    \ ]

setlocal spell spelllang=en_gb
set complete+=kspell
