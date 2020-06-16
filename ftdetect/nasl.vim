let nasl_space_errors = 1
au BufRead,BufNewFile *.audit set syntax=xml
au BufRead,BufNewFile *.nasl set filetype=nasl
au BufRead,BufNewFile *.inc  set filetype=nasl " this may conflict with other uses...comment to disable
au BufRead,BufNewFile *.static  set filetype=nasl " this may conflict with other uses...comment to disable
au BufRead,BufNewFile *.inc  set indentexpr=
