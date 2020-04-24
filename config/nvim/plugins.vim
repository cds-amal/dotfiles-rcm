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
Plug 'sheerun/vim-polyglot'             " Mega language support pack
Plug 'kshenoy/vim-signature'            " sensible marks

" color business ------------ {{{1
" ================================

Plug 'altercation/vim-colors-solarized' " Solarized color theme
Plug 'flazz/vim-colorschemes'

" git assistance ------------ {{{1
" ================================

Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'tpope/vim-rhubarb'                "     needed for fugitive
Plug 'airblade/vim-gitgutter'           " Git gutter indicators
Plug 'rbong/vim-flog'                   " Git navigation
Plug 'jreybert/vimagit'

" status line --------------- {{{1
" ================================

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" external api -------------- {{{1
" ================================

Plug 'tyru/open-browser.vim'
Plug 'previm/previm'                    " Markdown preview
Plug 'segeljakt/vim-silicon'

" ide things ---------------- {{{1
" ================================

Plug 'junegunn/fzf'                     " fuzzy finder
Plug 'junegunn/fzf.vim'                 " fuzzy finder
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'                         " Linter

Plug 'wellle/tmux-complete.vim'         " completion from tmux panes
Plug 'christoomey/vim-tmux-navigator'   " Navigate between tmux and vim
Plug 'Yggdroot/indentLine'              " Indent guides
Plug 'jasonwoodland/vim-html-indent'
Plug 'scrooloose/nerdcommenter'         " awesome Commenting
Plug 'godlygeek/tabular'

" vim notes ----------------- {{{1
" ================================

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'tpope/vim-scriptease'              " vim script helpers

call plug#end()
