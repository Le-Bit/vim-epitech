vim-epitech
===========

An all-in-one configuration to ease (n)vim usage at Epitech.

## Installation

If you use https://github.com/junegunn/vim-plug
add the line
```
Plug 'LeBarbu/vim-epitech'
```
to your .vimrc

You can of course use the plugin manager that you like

## Headers

You can add Epitech headers to your files with `<Leader>h` (Default leader mapping is '\').
You can disable the auto-updated header when saving a file by setting `let g:header_update = 0` in your .vimrc.

### Login

Your login is fetched from the environnement: `$USER`. You can override this in your `.vimrc` with `let g:epi_login = 'logi_n'`.

### Full name

For your name, it is fetched from your `finger` information (_Full name_ field). You can change this information in your DE configuration manager or in cli with [`chfn`](http://linux.die.net/man/1/chfn). As for the login you can override this value in your `.vimrc` with `let g:epi_name = 'Nils Logi'`.

## Indentation

You can use the exact same indent style as emacs (the GNU one, for more info : http://en.wikipedia.org/wiki/Indent_style#GNU_style ) by using `let g:epi_mode_emacs = 1` in your `.vimrc`. Alternatively you can have emacs indentation only for Epitech's files (having a valid header) with `let g:epi_mode_auto = 1`.

## Checker

You can call the checker with the command `:EpiNormeCheck`.
By default the checker is called with `epinorme <file>`. Program used can be override with `g:epi_checker_bin`. Just give the path to your script.
You can then see the error report with `<Leader>n` (Default leader mapping is '\').

##  Syntastic

If you want to make your own norm script interact  with syntastic, it must take the filename as argument
And give the following output on stderr:
    filename:line:collumn:error description

You can use the following scripts:
    https://github.com/casimir/epinorme
    
## Cleaning file when copy/pasting code in epitech subject

Because of Epitech's PDF format, pasting part of code from a Epitech PDF will result in a bad formatted file (because of line numbers in PDF).

You can do

`:EpiCleaner`

in vim to clean your pasted file.
