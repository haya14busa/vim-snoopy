"=============================================================================
" FILE: autoload/unite/sources/snoopy.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:S = snoopy#vital#ScriptLocal()

let s:source = {
\ 'name': 'scriptnames',
\ 'description': 'Snoopy :scriptnames unite interface'
\ }

function! unite#sources#snoopy#define() abort
  return s:source
endfunction

function! s:source.gather_candidates(args, context)
  return unite#util#sort_by(values(map(s:S.scriptnames(), "{
  \   'word': (s:rpad(v:key, 4) . ': ' . v:val),
  \   'kind': 'file',
  \   'action__path': v:val,
  \   '__sid': v:key
  \ }")), 'str2nr(v:val.__sid)')
endfunction

function! s:rpad(str, num) abort
  return repeat(' ', a:num - strdisplaywidth(a:str)) . a:str
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
