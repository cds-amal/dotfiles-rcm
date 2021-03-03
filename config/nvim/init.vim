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
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'pangloss/vim-javascript'
  Plug 'sbdchd/neoformat', { 'do': 'npm i -g prettier-standard' }
  Plug 'szw/vim-maximizer'
  Plug 'chuling/equinusocio-material.vim'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
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
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 't9md/vim-choosewin'
  Plug 'dhruvasagar/vim-table-mode'

  " Completion
  Plug 'nvim-lua/completion-nvim'
  Plug 'albertoCaroM/completion-tmux'
  Plug 'nvim-treesitter/completion-treesitter'
  Plug 'steelsojka/completion-buffers'

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

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif
