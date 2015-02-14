filetype plugin indent on

setlocal cindent
setlocal colorcolumn=80
setlocal comments=s:/*,m:**,ex:*/
setlocal noexpandtab
setlocal shiftwidth=2
setlocal softtabstop=8
setlocal tabstop=8

let c_space_errors = 1

let g:syntastic_c_checkers = ['epinorme']
let g:syntastic_check_on_open = 1
":h youcompleteme-why-did-ycm-stop-using-syntastic-for-diagnostics-display
let g:ycm_show_diagnostics_ui = 0

set list!
set listchars=tab:··
