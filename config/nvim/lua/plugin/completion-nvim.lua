-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd('inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"')
vim.cmd('inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

-- Set completeopt to have a better completion experience
vim.cmd('set completeopt=menuone,noinsert,noselect')

-- Avoid showing message extra message when using completion
vim.cmd('set shortmess+=c')

-- on auto popup
vim.g.completion_enable_auto_popup = 1

-- Whether or not to use the trigger characters provided by the language server
-- for triggering the popup menu.
vim.g.completion_enable_server_trigger = 0

-- use snippets
vim.g.completion_enable_snippet = 'UltiSnips'

vim.g.completion_chain_complete_list = {
  lua = {
    { complete_items = { 'lsp', 'snippet' } },
    { mode= '<c-p>' },
    { mode= '<c-n>' }
  },
  default = {
    { complete_items = { 'lsp', 'snippet' } },
    { mode= '<c-p>' },
    { mode= '<c-n>' }
  }
}
