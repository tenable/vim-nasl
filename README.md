vim-nasl
========

Vim extensions for programming in NASL.

Installation can be done through [Vundle] or your favourite vim plugin manager.

Alternatively, for a bare-bones or custom install, just clone this repo and copy these folders (indent, syntax, syntax_checkers) into ~/.vim, then proceed with the instructions below.

Syntax Highlighting
-------------------

Add the following to your `.vimrc`:

```vim
let nasl_space_errors = 1
autocmd BufNewFile,BufRead *.audit set syntax=xml
autocmd BufNewFile,BufRead *.nasl set filetype=nasl
autocmd BufNewFile,BufRead *.inc set filetype=nasl
autocmd BufNewFile,BufRead *.inc set indentexpr=
```

To set the recommended formatting settings for NASL files, add this too:

```vim
autocmd FileType nasl setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2 colorcolumn=120
```

[Syntastic]
-----------

Currently, Syntastic support is provided by `nasl -XLW` (from the nessus package) or `nasl-parse parse` (from the nasl gem). Ensure that one of these is in your path to enable the syntax checker.

If you want to use both syntax checkers, you might want to add something like this to your `.vimrc`:

```vim
let g:syntastic_nasl_checkers = ['nasl_parse', 'nasl']
```

This will first run your file through `nasl-parse` and then, if no errors were found, run it through `nasl`.

[Tagbar]
--------

Instructions here: https://github.com/majutsushi/tagbar/wiki#nasl.

Tagbar integration is very crude so far. The simple, regex method has many limitations, so a true parser method would be a huge improvement.

[Syntastic]:https://github.com/scrooloose/syntastic
[Tagbar]:https://github.com/majutsushi/tagbar
[Vundle]:https://github.com/gmarik/vundle
