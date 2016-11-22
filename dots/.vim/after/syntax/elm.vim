if has("conceal")
    syntax match elmLambda /\\/ conceal cchar=λ

    hi link elmLambda elmLambda
    hi! link Conceal elmLambda
    setlocal conceallevel=2
    setlocal concealcursor=cnvi
endif
