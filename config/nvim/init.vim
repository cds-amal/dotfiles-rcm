scriptencoding utf-8
" nvim setup     ------------ {{{1
" ================================

if !has('nvim')
  set nocompatible
endif
"}}}

" python setup   ------------ {{{1
" ================================

let g:python_host_prog  = $HOME.'/.pyenvs/nvim-2.7.10/bin/python'
let g:python3_host_prog  = $HOME.'/.pyenvs/nvim-3.7.1/bin/python'
let mapleader = ","
"}}}

" vim plug setup ------------ {{{1
" ================================

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
"}}}

" color workaround ---------- {{{1
" ================================

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 endif

if (has("termguicolors"))
  set termguicolors
endif
"}}}

" load & config plugins ----- {{{1
" ================================

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugins-config.vim
source $HOME/.config/nvim/functions/whitespace.vim
"}}}

" General settings ---------- {{{1
" ================================

set grepprg=ag         " use silver searcher for grepping

" relativenumber ------------ {{{2

set number             " Show line numbers
set relativenumber     " Relative number

" zap whitespace ------------ {{{2

autocmd BufWritePre * call TrimWhiteSpace()

" filetype rules ------------ {{{2

" let babelrc be a json file
au BufNewFile,BufRead .babelrc set filetype=json
au filetype css,html,javascript,json,sh,typescript setlocal foldmethod=syntax
au filetype vim setlocal foldmethod=marker

" omni completion ----------- {{{2
set completeopt+=longest,menuone

" folding        ------------ {{{2
if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
  source $HOME/.config/nvim/functions/foldtext.vim
  set foldlevelstart=2                " start folded can overide ft in ftplugin/
  set foldtext=Myfoldtext()
  " Set foldlevel to detected max foldleve + 1
  au BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
endif

" Save/load foldlevels when navigating in/out of buffers
" https://vim.fandom.com/wiki/Make_views_automatic
au BufWinLeave *.* mkview
au BufWinEnter *.* silent! loadview
"}}}

" Mappings       ------------ {{{1
" ================================

" navigation     ------------ {{{2

nmap <localLeader>vi :e ~/dotfiles/config/nvim/init.vim<CR>
nmap <localLeader>vp :e ~/dotfiles/config/nvim/plugins.vim<CR>
nmap <localLeader>vs :e ~/dotfiles/config/nvim/plugins-config.vim<CR>

nmap <leader>m  :tabp<CR><C-G>   " Prev tab
nmap <leader>.  :tabn<CR><C-G>   " Next tab

nmap <C-h> <C-w>h      " Navigate panes - left
nmap <C-L> <C-w>l      " Navigate panes - right
nmap <C-j> <C-w>j      " Navigate panes - down
nmap <C-k> <C-w>k      " Navigate panes - up
nnoremap <silent> // :noh<CR>   " Remove highlight after search

nnoremap [z zj         " Navigate fold down
nnoremap ]z zk         " Navigate fold up
nnoremap <SPACE> za    " Toggle current fold under cursor

" date/time      ------------ {{{2
nnoremap <localLeader>dd :put =strftime('%F ')<CR>
nnoremap <localLeader>tt :put =strftime('%T%z ')<CR>
nnoremap <localLeader>DD :put =strftime('%FT%T%z ')<CR>
nnoremap <leader><TAB> :tabnew %<CR>   "open new tab with contents of current pane

" close all other buffers --- {{{2
" mnemonic - buffer only
"
nnoremap <leader>bo  :%bd \| e#<CR>

" filepath helper ----------- {{{2
" put filename and fullpath in "-register so it's available to <c-r>
"
nmap <leader>cf : let @" = expand("%")<cr>
nmap <leader>cp : let @" = expand("%:p")<cr>

" zsh vimode     ------------ {{{2
" For zsh vi-mode command split
" splits a single line command on every -- or -,
" appending a \ on every eol
" mnemonic: cs = command split
nnoremap <localLeader>cs :s:\(\s\{1,}\)\(-\+\): \\\r  \2:cg<CR>

" fzf integration ----------- {{{2
nmap <localLeader>b :Buffers<CR>
nmap <localLeader>f :Files<CR>
nmap <localLeader>g :GFiles?<CR>
nmap <localLeader>h :History<CR>
nmap <localLeader>m :Map<CR>
nmap <localLeader>s :Ag<space>
nmap <localLeader>ss :Ag <c-r>=expand("<cword>")<CR>
"}}}2


" ☠☠ DANGER ☠☠  ------------- {{{1
" ================================

" debug settings    --------- {{{2
" enable debugging
" set verbose=9
" set verbosefile=vilog.log
