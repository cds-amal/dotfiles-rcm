" toggle conceallevel
nnoremap <silent> <localleader><localleader> :call ConceallevelToggle()<cr>

function! ConceallevelToggle()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=1
  endif
endfunction

