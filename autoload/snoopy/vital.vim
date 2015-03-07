"=============================================================================
" FILE: autoload/snoopy/vital.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:S = vital#of('snoopy').import('Vim.ScriptLocal')

function! snoopy#vital#ScriptLocal() abort
  return s:S
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
