vim-nasl
========

Vim extensions for programming in NASL.

Installation can be done through [Vundle] or your favourite vim plugin manager.

Syntax Highlighting
-------------------

Add the following to your `.vimrc`:

```vim
autocmd BufNewFile,BufRead *.nasl set filetype=nasl
autocmd BufNewFile,BufRead *.inc set filetype=nasl
autocmd BufNewFile,BufRead *.inc set indentexpr=
```

To set the recommended formatting settings for NASL files, add this too:

```vim
autocmd FileType nasl setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=2 colorcolumn=70
```

[Syntastic]
-----------

Currently, Syntastic support is provided by `nasl -XLW`. Ensure that it is in your path to enable this syntax checker.

[Tagbar]
--------

Instructions here: https://github.com/majutsushi/tagbar/wiki#nasl.

Tagbar integration is very crude so far. The simple, regex method has many limitations, so a true parser method would be a huge improvement.

[Syntastic]:https://github.com/scrooloose/syntastic
[Tagbar]:https://github.com/majutsushi/tagbar
[Vundle]:https://github.com/gmarik/vundle
