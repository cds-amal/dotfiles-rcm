" sbdchd/neoformat
nnoremap <leader>F :Neoformat<CR>
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['prettierstandard']
let g:neoformat_javascript_prettierstandard = {
    \ 'exe': '~/.nvm/versions/node/v12.21.0/bin/prettier-standard',
    \ 'replace': 1
    \ }
