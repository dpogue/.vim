" SDL

fun! s:FTsdl()
  let n = 1
  while n < 50 && n < line("$")
    if getline(n) =~ '\<struct\>'
      let g:urusdl_noUru=1
      setf urusdl
      return
    elseif getline(n) =~ '\<STATEDESC\>'
      let g:urusdl_noEoa=1
      setf urusdl
      return
    endif
    let n = n + 1
  endwhile
  setf sdl
endfun


autocmd BufNewFile,BufRead *.pr     set filetype=sdl
autocmd BufRead *.sdl               call s:FTsdl()
autocmd BufNewFile *.sdl            set filetype=urusdl
