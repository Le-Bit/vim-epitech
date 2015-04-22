" Return the path of the norme checker
function! epitech#norme#GetChecker()
    if exists('g:epi_checker_bin')
        return g:epi_checker_bin
    else
        return 'epinorme'
    endif
endfunction

" Run a norme check and open location list if needed
function! epitech#norme#Check()
    let checker = epitech#norme#GetChecker()
    if empty(checker)
        return
    endif

    silent cexpr system(checker . ' ' . shellescape(expand('%')))
    cwindow
endfunction
