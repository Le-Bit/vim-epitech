" Vim sources ftplugin scripts for c too for cpp files. What a good idea! Or is it?
if (&ft != 'c')
    finish
endif

filetype plugin indent on

setlocal cindent
setlocal colorcolumn=81
setlocal comments=s:/*,m:**,ex:*/
setlocal list
setlocal listchars=tab:··
setlocal noexpandtab
setlocal shiftwidth=2
setlocal softtabstop=8
setlocal tabstop=8

if get(g:, "epi_mode_emacs") || (get(g:, "epi_mode_auto") && epitech#header#IsPresent())
    setlocal cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s
else
    setlocal cinoptions=(0
endif

let c_space_errors = 1
