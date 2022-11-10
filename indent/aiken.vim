" Aiken syntax file
" Language: Aiken
" Maintainer: KtorZ <matthias.benkort@gmail.com>
" Copyright: KtorZ <matthias.benkort@gmail.com>
" License: MPL-2.0

if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal nosmartindent
setlocal nocindent
setlocal indentexpr=GetAikenIndent(v:lnum)

if exists("*GetAikenIndent")
  finish
endif

function GetAikenIndent(lnum)
  setlocal cinkeys=0{,0}

  let l:ind = cindent(a:lnum)
  let l:lline = getline(a:lnum - 1)

  if l:lline =~# '\(->\|=\)\s*$'
    let l:ind = l:ind + &shiftwidth
  elseif l:lline =~# '(\s*$'
    let l:ind = l:ind - &shiftwidth
  endif

  return l:ind
endfunction
