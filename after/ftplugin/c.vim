filetype plugin indent on

setlocal cindent
setlocal colorcolumn=80
setlocal comments=s:/*,m:**,ex:*/
setlocal shiftwidth=2
setlocal softtabstop=8
setlocal tabstop=8

let c_space_errors = 1

" Configure Syntastic and YCM
let g:syntastic_c_checkers = ['epitech']
let g:ycm_show_diagnostics_ui = 0
