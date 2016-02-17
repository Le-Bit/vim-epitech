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

if !exists('g:header_update')
  let g:header_update = 1
endif

" This is used to remove blank lines containing numbers 
" when copy/pasting epitech subject
fu! EpitechCleaner()
  :g/^[ \t]*\d\+$/d
endfunction

command! EpiCleaner call EpitechCleaner()

" FIXME document commands
command! EpiNormeCheck call epitech#norme#Check()
command! EpiHeader call epitech#header#Put()

augroup epitech
    autocmd!

    if g:header_update == 1
      autocmd FileWritePre,BufWritePre * call epitech#header#Update()
    endif
    if g:header_auto == 1
        autocmd BufNewFile * call epitech#header#Put()
    endif
augroup END


nmap <Leader>n :<C-U>EpiNormeCheck<CR>
nmap <Leader>h :<C-U>EpiHeader<CR>
