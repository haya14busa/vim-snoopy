"=============================================================================
" FILE: plugin/snoopy.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_snoopy
endif
if exists('g:loaded_snoopy')
  finish
endif
let g:loaded_snoopy = 1
let s:save_cpo = &cpo
set cpo&vim

" --- vital Vim.ScriptLocal wrapper

let s:S = snoopy#vital#ScriptLocal()

function! s:capitalize(str) abort
  return toupper(a:str[0]) . a:str[1:]
endfunction

function! s:default_names() abort
  let r = {}
  for key in keys(s:S)
    let r[key] = s:capitalize(key)
  endfor
  return r
endfunction

function! s:define_funcs(funcnames) abort
  for key in keys(a:funcnames)
    let g:{a:funcnames[key]} = s:S[key]
  endfor
endfunction

" Funcname config
let g:snoopy_funcnames = get(g:, 'snoopy_funcnames', s:default_names())

call s:define_funcs(g:snoopy_funcnames)

" --- commands

" Open the <SID> file
command! -nargs=1 SnoopyOpen :execute ':edit' fnameescape(s:S.sid2path(<args>))

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
