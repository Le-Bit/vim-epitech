vim-epitech
===========

Syntastic epitech style guide

## Headers

### Login

Your login is fetched from the environnement: ```$USER```. You can override this in your ```.vimrc``` with ```let g:epi_login = 'logi_n'```.

### Full name

For your name, it is fetched from your ```finger``` information (_Full name_ field). You can change this information in your DE configuration manager or in cli with [```chfn```](http://linux.die.net/man/1/chfn). As for the login you can override this value in your ```.vimrc``` with ```let g:epi_name = 'Nils Logi'```.
