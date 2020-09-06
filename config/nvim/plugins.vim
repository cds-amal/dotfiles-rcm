" baseline ------------------ {{{1
" ================================

" plugins are installed from this list
" their configurations are defined in ./plugins-config.vim

call plug#begin()

Plug 'vim-scripts/autoswap.vim'         " handle swap files intelligently
Plug 'tpope/vim-repeat'                 " repeat motions
Plug 'tpope/vim-sensible'               " some sensible settings
Plug 'tpope/vim-surround'               " change your surroundings
Plug 'tpope/vim-unimpaired'             " sensible ][ mappings
Plug 'tpope/vim-speeddating'            " CTRL-A/CTRL-X to increment dates, times and more
Plug 'scrooloose/nerdtree'              " File tree view
Plug 'kshenoy/vim-signature'            " sensible marks

" color business ------------ {{{1
" ================================

Plug 'chuling/vim-equinusocio-material'

" git assistance ------------ {{{1
" ================================

Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'tpope/vim-rhubarb'                "     needed for fugitive
Plug 'airblade/vim-gitgutter'           " Git gutter indicators
Plug 'jreybert/vimagit'

" Languages ----------------- {{{1
" ================================

Plug 'TovarishFin/vim-solidity'
Plug 'rust-lang/rust.vim'

" status line --------------- {{{1
" ================================

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ide things ---------------- {{{1
" ================================
if has('nvim-0.5')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/telescope.nvim'
  Plug 'ThePrimeagen/vim-be-good'          "vim game neovim 5
else
  Plug 'junegunn/fzf'                     " fuzzy finder
  Plug 'junegunn/fzf.vim'                 " fuzzy finder
endif
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

Plug 'wellle/tmux-complete.vim'         " completion from tmux panes
Plug 'christoomey/vim-tmux-navigator'   " Navigate between tmux and vim
Plug 'Yggdroot/indentLine'              " Indent guides
Plug 'scrooloose/nerdcommenter'         " awesome Commenting
Plug 'godlygeek/tabular'

" https://github.com/norcalli/snippets.nvim
" Plug 'norcalli/snippets.nvim'           " snippets

Plug 'tpope/vim-scriptease'              " vim script helpers

call plug#end()
