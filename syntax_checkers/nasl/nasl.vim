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
    let errorformat = '%f(%l): %m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'nasl',
    \ 'name': 'nasl'})
