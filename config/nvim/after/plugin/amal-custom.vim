" toggle conceallevel
nnoremap <silent> <localleader><localleader> :call ConceallevelToggle()<cr>

function! ConceallevelToggle()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=1
  endif
endfunction

" Define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=darkgray

" Highlight the current line
nnoremap <silent> <Leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>

" Clear all the highlighted lines
nnoremap <silent> <Leader>c :call clearmatches()<CR>

" Open tab for notes
" gt to change tab
nnoremap <silent> n<CR> :tab drop tmp/notes.md<CR>
