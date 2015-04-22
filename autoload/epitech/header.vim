let s:comMap = {
            \ 'c': {'b': '/*', 'm': '**', 'e': '*/'},
            \ 'cpp': {'b': '//', 'm': '//', 'e': '//'},
            \ 'make': {'b': '##', 'm': '##', 'e': '##'},
            \}

function! s:InsertFirst()
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

function! s:IsSupportedFt()
    return has_key(s:comMap, &filetype)
endfunction

function! epitech#header#IsPresent()
    let l:val = search('^.\{2} Last update ', 'cnw')
    return l:val > 0 && l:val < 10
endfunction

function! epitech#header#Put()
    if epitech#header#IsPresent() > 0
        return
    endif

    if !s:IsSupportedFt()
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
    call s:InsertFirst()
    :11
endfunction

function! epitech#header#Update()
    if !s:IsSupportedFt()
        return
    endif

    if epitech#header#IsPresent() > 0
        let save_cursor = getpos(".")
        1,10s/\(.*\) Last update .*/\1 Last update µLASTUPDATEµ µLOGINLASTµ/ge
        1,10s/µLOGINLASTµ/\= g:epi_name/ge
        1,10s/µLASTUPDATEµ/\= strftime("%a %b %d %T %Y")/ge
        call setpos('.', save_cursor)
    endif
endfunction
