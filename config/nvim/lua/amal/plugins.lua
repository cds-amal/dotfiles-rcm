vim.cmd [[packadd vimball]]

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    use 'tjdevries/tree-sitter-lua'
    use 'tjdevries/pastery.vim'
    use 'tjdevries/astronauta.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'anott03/nvim-lspinstall'
    use 'itchyny/lightline.vim'
    use 'itchyny/vim-gitbranch'

    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-fzf-writer.nvim'
    use 'nvim-telescope/telescope-packer.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use { 'turbio/bracey.vim', run = 'npm install --prefix server' }
    use 'Yggdroot/indentLine'
    use 'kosayoda/nvim-lightbulb'
    use 'SirVer/ultisnips'
    use 'joaohkfaria/vim-jest-snippets'


    -- VIM EDITOR: {{{

    -- Little know features:
    --   :SSave
    --   :SLoad
    --       These are wrappers for mksession that work great. I never have to use
    --       mksession anymore or worry about where things are saved / loaded from.
    use 'mhinz/vim-startify'

    -- Better profiling output for startup.
    use 'dstein64/vim-startuptime'

    -- :Messages <- view messages in quickfix list
    -- :Verbose  <- view verbose output in preview window.
    -- :Time     <- measure how long it takes to run some stuff.
    use 'tpope/vim-scriptease'

    -- Quickfix enhancements. See :help vim-qf
    use 'romainl/vim-qf'

    -- TODO: Eventually statusline should consume this.
    use 'mkitt/tabline.vim'

    -- Pretty icons. Not necessarily required.
    use 'ryanoasis/vim-devicons'

    -- Undo helper
    use 'sjl/gundo.vim'

    -- Crazy good box drawing
    use 'gyim/vim-boxdraw'

    -- }}}

    --  LANGUAGE: {{{
    use 'elzr/vim-json'
    use 'mattn/emmet-vim'
    use 'euclidianAce/BetterLua.vim'
    -- use { 'prettier/vim-prettier', run = 'yarn global install' }
    use { 'vim-scripts/JavaScript-Indent', ft = 'javascript' }
    use { 'pangloss/vim-javascript', ft = { 'javascript', 'html' } }
    -- }}}

    -- LSP {{{

    -- Configurations for neovim lsp.
    --   neovim/neovim has all of the LSP code.
    use { 'neovim/nvim-lspconfig',
          run = 'npm i -g typescript-language-server' 
    }
    use 'nvim-lua/lsp_extensions.nvim'
    use 'wbthomason/lsp-status.nvim'

    -- STREAM: Figure out how to use snippets better
    use 'hrsh7th/nvim-compe'

    -- Completion stuff
    -- local_use 'rofl.nvim'

    -- use {
    --   'nvim-treesitter/completion-treesitter',
    --   run = function() vim.cmd [[TSUpdate]] end
    -- }

    -- use 'hrsh7th/vim-vsnip'
    -- use 'hrsh7th/vim-vsnip-integ'
    -- use 'norcalli/snippets.nvim'
    -- use 'norcalli/ui.nvim'
    use 'albertoCaroM/completion-tmux'

    -- Debug adapter protocol
    --   Have not yet checked this out, but looks awesome.
    -- use 'puremourning/vimspector'
    -- use 'mfussenegger/nvim-dap'
    -- use 'mfussenegger/nvim-dap-python'
    -- use { 
    --   'theHamsta/nvim-dap-virtual-text',
    --   run = function()
    --     vim.g.dap_virtual_text = true
    --   end
    -- }

    -- }}}
    -- TREE SITTER: {{{
    use { 'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate'
    }
        
    use 'nvim-treesitter/playground'
    use 'vigoux/architext.nvim'

    -- }}}
    -- NAVIGATION: {{{

    use 'pechorin/any-jump.vim'

    -- TEXT MANIUPLATION {{{
    use 'godlygeek/tabular'        -- Quickly align text by pattern
    use 'tpope/vim-commentary'     -- Easily comment out lines or objects
    use 'tpope/vim-repeat'         -- Repeat actions better
    use 'tpope/vim-abolish'        -- Cool things with words!
    use 'tpope/vim-characterize'
    use 'tpope/vim-dispatch'
    use 'AndrewRadev/splitjoin.vim'
    use 'AndrewRadev/sideways.vim' -- Easy sideways movement

    use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install'}
    use 'christoomey/vim-tmux-navigator'

    use 'mhinz/vim-signify'
    use 'kshenoy/vim-signature'


    use 'tpope/vim-surround'
    use {'sbdchd/neoformat', run = 'npm i -g prettier-standard'}
    use 'szw/vim-maximizer'
    use 'chuling/equinusocio-material.vim'
    use 'lifepillar/vim-gruvbox8'
    use {'tomlion/vim-solidity',ft = {'solidity'} , run = 'npm i -g solhint'}
    use 'tpope/vim-speeddating'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'jreybert/vimagit'

    -- Do I even use any of these?
    -- use 'kana/vim-textobj-user'

    use 'tjdevries/standard.vim'
    use 'tjdevries/conf.vim'
    use {'junegunn/fzf', run = './install --all' }     -- Fuzzy Searcher
    use {'junegunn/fzf.vim'}
    -- use 'lervag/wiki.vim'
    use 'vimwiki/vimwiki'
  end,

  config = {
    _display = {
      open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]

          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.bufnr
        local win = float_win.win_id

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
}

