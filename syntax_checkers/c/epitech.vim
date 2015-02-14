if exists('g:loaded_syntastic_epitech_c_checker')
    finish
endif
let g:loaded_syntastic_epitech_c_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_c_epitech_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! SyntaxCheckers_c_epinorme_GetLocList() dict
    let makeprg = self.makeprgBuild({})

    let errorformat =
        \ '%W%f:%l: warning: %m,'.
        \ '%E%f:%l:%c:%m,'.
        \ '%-G%.%#'

    return SyntasticMake({
                \ 'makeprg': makeprg,
                \ 'errorformat': errorformat })
endfunction

let checker = {
            \ 'filetype': 'c',
            \ 'name': 'epinorme'}
if exists('g:epitech_checker_bin')
    let checker.exec = g:epitech_checker_bin
endif
call g:SyntasticRegistry.CreateAndRegisterChecker(checker)

let &cpo = s:save_cpo
unlet s:save_cpo
