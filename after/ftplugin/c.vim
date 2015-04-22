filetype plugin indent on

setlocal colorcolumn=80
setlocal comments=s:/*,m:**,ex:*/
setlocal list
setlocal listchars=tab:··
setlocal noexpandtab
setlocal shiftwidth=2
setlocal softtabstop=8
setlocal tabstop=8

setlocal cindent
if get(g:, "epitech_mode_emacs") || (get(g:, "epitech_mode_auto") && epitech#header#IsPresent())
    setlocal cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s
else
    setlocal cinoptions=
endif

let c_space_errors = 1
