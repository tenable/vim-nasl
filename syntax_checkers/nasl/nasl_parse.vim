"==========================================================================
"File:         nasl_parse.vim
"Description:  Syntax checking plugin for syntastic.vim
"Maintainer:   Benjamin Bergman
"==========================================================================

if exists("g:loaded_syntastic_nasl_nasl_parse_checker")
	finish
endif
let g:loaded_syntastic_nasl_nasl_parse_checker=1

function! SyntaxCheckers_nasl_nasl_parse_IsAvailable()
	return executable("nasl-parse")
endfunction

function! SyntaxCheckers_nasl_nasl_parse_GetLocList()
	let makeprg = syntastic#makeprg#build({
		\ 'exe': "nasl-parse",
		\ 'args': 'parse',
		\ 'filetype': 'nasl',
		\ 'subchecker': 'nasl' })

	" See ':help errorformat' for format details
	let errorformat = '%+AThe language%.%#,' .
	                \ '%CContext for row %l\, column %c in file %f:,' .
	                \ '%-Z%.%#'

	" Ignore all else
	let errorformat .= ',' . '%-G%.%#'

	return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
	\ 'filetype': 'nasl',
	\ 'name': 'nasl_parse'})
