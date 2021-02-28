nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gC    <cmd>lua vim.lsp.buf.code_action()<CR>

" fold navigation
nnoremap [z zk
nnoremap ]z zj
nnoremap <SPACE> za  " Toggle current fold under cursor

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>


" auto completion
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" defx
"
nnoremap <silent> <leader>n :Defx
  \ `escape(expand('%:p:h'), ' :')`
  \ -search=`expand('%:p')`
  \ -split=vertical
  \ -winwidth=50
  \ -direction=topleft<CR>

nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
