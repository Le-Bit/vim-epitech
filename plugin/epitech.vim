if exists('g:loaded_epitech')
    finish
endif
let g:loaded_epitech = 1

if !exists('g:epi_login')
    let g:epi_login = expand($USER)
endif

if !exists('g:epi_name')
    let name = system('getent passwd $USER | cut -d: -f5')
    let g:epi_name = substitute(name, '\n$', '', '')
endif

if !exists('g:header_auto')
  let g:header_auto = 0
endif

" FIXME document commands
command! EpiNormeCheck call epitech#norme#Check()
command! EpiHeader call epitech#header#Put()

augroup epitech
    autocmd!

    autocmd FileWritePre,BufWritePre * call epitech#header#Update()
    if g:header_auto == 1
        autocmd BufNewFile * call epitech#header#Put()
    endif
augroup END


nnoremap <Leader>n :<C-U>EpiNormeCheck<CR>
nnoremap <Leader>h :<C-U>EpiHeader<CR>
