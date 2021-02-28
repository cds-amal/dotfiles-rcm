" default options

" set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noselect
set shortmess+=c
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_confirm_key = "\<CR>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_chain_complete_list = {
    \ 'lua': [
    \    'string': [
    \        {'mode': '<c-p>'},
    \        {'mode': '<c-n>'}],
    \    'func' : [
    \        {'complete_items': ['lsp']}],
    \    'default': [
    \       {'complete_items': ['lsp', 'snippet']},
    \       {'mode': '<c-p>'},
    \       {'mode': '<c-n>'}],
    \],
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['lsp', 'snippet']},
    \       {'mode': '<c-p>'},
    \       {'mode': '<c-n>'}],
    \   'comment': []
    \   }
    \}
imap  <c-j> <Plug>(completion_next_source)
imap  <c-k> <Plug>(completion_prev_source)

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
set noswapfile
filetype plugin indent on

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set termguicolors
let mapleader = ","

let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
nnoremap <silent> <leader>vim :e $MYVIMRC<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-]>"
let g:UltiSnipsJumpBackwardTrigger="<c-[>"

colorscheme gruvbox8_hard

" itchyny/lightline.vim and itchyny/vim-gitbranch
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'gruvbox8',
      \ }

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" sbdchd/neoformat
nnoremap <leader>F :Neoformat<CR>
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['prettierstandard']
let g:neoformat_javascript_prettierstandard = {
    \ 'exe': '~/.nvm/versions/node/v10.20.1/bin/prettier-standard',
    \ 'replace': 1
    \ }

" junegunn/fzf.vim
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
"
au BufWinLeave *.* mkview
au BufWinEnter *.* silent! loadview

au CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

lua <<EOF
  require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

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


let g:vimwiki_root = '~/vimwiki'
let g:vimwiki_listsyms = ' ○◐●✓'
let g:vimwiki_list = [
    \{'path': '~/vimwiki',              'ext': '.md'},
    \{'path': '~/vimwiki/config',       'ext': '.md'},
    \{'path': '~/vimwiki/tbg',          'ext': '.md'},
    \{'path': '~/vimwiki/tbg/drizzle',  'ext': '.md'},
    \{'path': '~/vimwiki/tbg/ganache',  'ext': '.md'},
    \{'path': '~/vimwiki/tbg/teams',    'ext': '.md'},
    \{'path': '~/vimwiki/tbg/truffle',  'ext': '.md'},
    \{'path': '~/vimwiki/tbg/webinars', 'ext': '.md'}]


" rmagatti/auto-session
let g:auto_session_root_dir = "~/.local/share/nvim/sessions"


autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open', 'choose')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
	nnoremap <silent><buffer><expr> > defx#do_action('resize',
	\ defx#get_context().winwidth + 10)
	nnoremap <silent><buffer><expr> < defx#do_action('resize',
	\ defx#get_context().winwidth - 10)
endfunction

