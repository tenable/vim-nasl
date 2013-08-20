"==========================================================================
"File:         nasl.vim
"Description:  Syntax checking plugin for syntastic.vim
"Maintainer:   Benjamin Bergman
"==========================================================================

if exists("g:loaded_syntastic_nasl_nasl_checker")
    finish
endif
let g:loaded_syntastic_nasl_nasl_checker=1

function! SyntaxCheckers_nasl_nasl_IsAvailable()
    return executable("nasl")
endfunction

function! SyntaxCheckers_nasl_nasl_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': "nasl",
        \ 'args': '-XLW',
        \ 'filetype': 'nasl',
        \ 'subchecker': 'nasl' })

    " See ':help errorformat' for format details
	" NASL 5.2
    let errorformat = '%f(%l): %m'

	" NASL 5.0
    let errorformat .= ',' . '%m (%f\, line %l)'
	" multi-line syntax error
	let errorformat .= ',' . '%Asyntax error\, %m'
	              \ .  ',' . '%Z%.%# %l'

	" Ignore all else
	let errorformat .= ',' . '%-G%.%#'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'nasl',
    \ 'name': 'nasl'})
