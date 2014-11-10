if exists('g:loaded_epitech_header')
    finish
endif

let s:comMap = {
            \ 'c': {'b': '/*', 'm': '**', 'e': '*/'},
            \ 'cpp': {'b': '//', 'm': '//', 'e': '//'},
            \ 'make': {'b': '##', 'm': '##', 'e': '##'},
            \}

function GetFullName()
    let val = system('getent passwd $USER | cut -d: -f5')
    return substitute(val, '\n$', '', '')
endfunction

function HasHeader()
  let l:save_cursor = getpos(".")
  let l:ret = search('Last update \w\+ \w\+ \d\+ \d\+:\d\+:\d\+ \d\+')
  call setpos('.', l:save_cursor)
  return l:ret
endfunction

function PutHeader()
  if HasHeader() > 0
    return
  endif

  if !has_key(s:comMap, &filetype)
      echoerr "Epitech header: Unsupported filetype: " . &filetype
      return
  endif

  let l:bcom = s:comMap[&filetype]['b']
  let l:mcom = s:comMap[&filetype]['m']
  let l:ecom = s:comMap[&filetype]['e']

  let l:ret = append(0, l:bcom)
  let l:ret = append(1, l:mcom . " µFILENAMEµ for µPROJECTNAMEµ in µPATHFILEµ")
  let l:ret = append(2, l:mcom . " ")
  let l:ret = append(3, l:mcom . " Made by µNAMEµ")
  let l:ret = append(4, l:mcom . " Login   <µLOGINµ@epitech.eu>")
  let l:ret = append(5, l:mcom . " ")
  let l:ret = append(6, l:mcom . " Started on  µCREATDAYµ µNAMEµ")
  let l:ret = append(7, l:mcom . " Last update µLASTUPDATEµ µLOGINLASTµ")
  let l:ret = append(8, l:ecom)
  let l:ret = append(9, "")
  call InsertFirst()
  :11
endfunction

function InsertFirst()
  call inputsave()
  let proj_name = input('Enter project name: ')
  call inputrestore()
  1,10s/µFILENAMEµ/\= expand('%:t')/ge
  1,10s/µPATHFILEµ/\= expand("%:p:h")/ge
  1,10s/µLOGINµ/\= g:epi_login/ge
  1,10s/µNAMEµ/\= g:epi_name/ge
  1,10s/µPROJECTNAMEµ/\= proj_name/ge
  1,10s/µCREATDAYµ/\= strftime("%a %b %d %T %Y")/ge
  1,10s/µLASTUPDATEµ/\= strftime("%a %b %d %T %Y")/ge
  1,10s/µLOGINLASTµ/\= g:epi_name/ge
endfunction

function UpdateTimeHeader()
  if HasHeader() > 0
    let save_cursor = getpos(".")
    1,10s/\(.*\) Last update .*/\1 Last update µLASTUPDATEµ µLOGINLASTµ/ge
    1,10s/µLOGINLASTµ/\= g:epi_name/ge
    1,10s/µLASTUPDATEµ/\= strftime("%a %b %d %T %Y")/ge
    call setpos('.', save_cursor)
  endif
endfunction

" ------------------------------------------------------------------------------
"  Initialisation
" ------------------------------------------------------------------------------

if !exists('g:epi_login')
    let g:epi_login = expand($USER)
endif

if !exists('g:epi_name')
    let g:epi_name = GetFullName()
endif

if !exists('g:header_auto')
  let g:header_auto = 0
endif

map <C-c><C-h> <Esc>:call PutHeader()<CR>

autocmd FileWritePre,BufWritePre * call UpdateTimeHeader()
autocmd FileWritePre,BufWritePre * call UpdateHeader()

if g:header_auto == 1
  autocmd BufNewFile *.c,*.h,*.cpp,*.hh,*.hpp,Makefile call PutHeader()
endif

let g:loaded_epitech_header = 1
