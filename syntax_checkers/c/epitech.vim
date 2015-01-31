if exists('g:loaded_syntastic_epitech_c_checker')
    finish
endif
let g:loaded_syntastic_epitech_c_checker = 1

if !exists('g:syntastic_c_compiler_options')
    let g:syntastic_c_compiler_options = '-std=c89 -Wall -Wextra'
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_c_epitech_IsAvailable() dict
    return executable('perl') && executable(self.getExec())
endfunction

function! SyntaxCheckers_c_epitech_GetLocList() dict
    let makeprg = self.makeprgBuild({})

    let errorformat =
        \ '%W%f:%l: warning: %m,'.
        \ '%E%f:%l:%c:%m,'.
        \ '%-G%.%#'

    return SyntasticMake({
                \ 'makeprg': makeprg,
                \ 'errorformat': errorformat })
endfunction

let s:moulinorme = expand('<sfile>:p:h').'/norme.pl'
call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'c',
            \ 'name': 'epitech',
            \ 'exec': s:moulinorme })

let &cpo = s:save_cpo
unlet s:save_cpo
