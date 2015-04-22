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

if !exists('g:epi_indent')
  let g:epi_indent = 0
endif
if g:epi_indent == 1
  setlocal cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s
endif

let c_space_errors = 1
