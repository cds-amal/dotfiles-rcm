nnoremap <localLeader>g :GFiles<CR>
nnoremap <localLeader>? :GFiles?<CR>
nnoremap <localLeader>b :Buffers<CR>

nnoremap <localLeader>f :Ag<space>
nnoremap <localLeader>ff :Ag <c-r>=expand("<cword>")<CR>

inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif
