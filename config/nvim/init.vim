call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kshenoy/vim-signature'
  Plug 'mattn/emmet-vim'
  Plug 'mhinz/vim-signify'
  Plug 'neovim/nvim-lspconfig', { 'do': 'npm i -g typescript-language-server' }
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'pangloss/vim-javascript'
  Plug 'sbdchd/neoformat', { 'do': 'npm i -g prettier-standard' }
  Plug 'szw/vim-maximizer'
  Plug 'chuling/equinusocio-material.vim'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'tomlion/vim-solidity',    { 'for': ['solidity'] , 'do': 'npm i solhint' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-scriptease'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-fugitive'        " Git wrapper
  Plug 'tpope/vim-rhubarb'         " Git wrapper
  Plug 'jreybert/vimagit'          " More git integration

  Plug 'SirVer/ultisnips'
  Plug 'joaohkfaria/vim-jest-snippets'

  " responsive html preview
  Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

  " auto session
  Plug 'rmagatti/auto-session'

  Plug 'vim-scripts/autoswap.vim'         " handle swap files intelligently
  Plug 'vimwiki/vimwiki'
  Plug 'Yggdroot/indentLine'              " Indent guides

  " telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'kosayoda/nvim-lightbulb'


call plug#end()

" todo - slash and burn
" source $HOME/.config/nvim/functions/foldtext.vim
source $HOME/.config/nvim/functions/whitespace.vim
source $HOME/.config/nvim/settings.vim
set rtp+=/usr/local/opt/fzf

"  -- root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");
"  -- ??

lua << EOF
  vim.lsp.set_log_level("debug");

  local lspconfig = require'lspconfig'
  local configs = require'lspconfig/configs'
  lspconfig.tsserver.setup {
    on_attach=require'completion'.on_attach
  }
EOF

source $HOME/.config/nvim/mappings.vim
