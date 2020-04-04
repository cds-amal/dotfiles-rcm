scriptencoding utf-8
" Summary & credits --------- {{{1
" ================================
"
" Override default `foldtext()`
" Inspired by Greg Hurrel: https://bit.ly/30jj9Ro

if exists("loaded_myfoldtext")
    finish
endif
let loaded_myfoldtext = 1

" local script vars --------- {{{1
" ================================

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

" Myfoldtext ---------------- {{{1
" ================================

function! Myfoldtext() abort
  let l:foldlength=(v:foldend - v:foldstart + 1)
  let l:zeroPadedFoldLength=repeat('0', 4-strlen(l:foldlength)) . l:foldlength
  let l:lines='[' . l:zeroPadedFoldLength . s:small_l .  ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction
