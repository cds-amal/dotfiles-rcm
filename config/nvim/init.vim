call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'mhinz/vim-signify'
  Plug 'neovim/nvim-lspconfig', { 'do': 'npm i -g typescript-language-server' }
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'pangloss/vim-javascript'
  Plug 'sbdchd/neoformat', { 'do': 'npm i -g prettier-standard' }
  Plug 'szw/vim-maximizer'
  Plug 'tomasiser/vim-code-dark'
  Plug 'tomlion/vim-solidity',    { 'for': ['solidity'] , 'do': 'npm i solhint' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-scriptease'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

  " responsive html preview
  Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

  Plug 'vim-scripts/autoswap.vim'         " handle swap files intelligently
  Plug 'vimwiki/vimwiki'
  Plug 'Yggdroot/indentLine'              " Indent guides
call plug#end()

" todo - slash and burn
source $HOME/.config/nvim/functions/foldtext.vim
source $HOME/.config/nvim/functions/whitespace.vim
source $HOME/.config/nvim/settings.vim


"  -- root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");
"  -- ??

lua << EOF
  vim.lsp.set_log_level("debug");

  local lspconfig = require'lspconfig'
  local configs = require'lspconfig/configs'
  lspconfig.tsserver.setup { }
EOF

source $HOME/.config/nvim/mappings.vim
