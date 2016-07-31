function! neomake#makers#ft#elm#EnabledMakers()
    return ['elm_make']
endfunction

function! neomake#makers#ft#elm#elm_make()
	return { 'exe': '/usr/local/sbin/elm-lint', 'errorformat': '%f:%l:%c [%t] %m', }
endfunction


