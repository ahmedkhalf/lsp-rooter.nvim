if exists('g:loaded_lsp_rooter') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

lua require'lsp-rooter'

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_lsp_rooter = 1
