" default options

set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set number             " Show line number
set relativenumber     " Relative number
set ignorecase
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=750
filetype plugin indent on
let mapleader = ","
if (has("termguicolors"))
  set termguicolors
endif

let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
nnoremap <silent> <leader>vim :e $MYVIMRC<CR>

" tomasiser/vim-code-dark
colorscheme codedark

" itchyny/lightline.vim and itchyny/vim-gitbranch
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'codedark',
      \ }

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" sbdchd/neoformat
nnoremap <leader>F :Neoformat<CR>
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['prettierstandard']
" let g:neoformat_javascript_prettierstandard = {
"             \ 'exe': '~/.nvm/versions/node/v10.20.1/bin/prettier-standard',
"             \ 'replace': 1
"             \ }

" junegunn/fzf.vim
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
  " junegunn/fzf.vim
  au! FileType fzf tunmap <buffer> <Esc>
endif

" Save/load foldlevels when navigating in/out of buffers
" https://vim.fandom.com/wiki/Make_views_automatic
au BufWinLeave *.* mkview
au BufWinEnter *.* silent! loadview

" zap trailing ws on save
autocmd BufWritePre * call TrimWhiteSpace()

" toggle conceallevel
nnoremap <silent> <localleader><localleader> :call ConceallevelToggle()<cr>

function! ConceallevelToggle()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=1
  endif
endfunction
