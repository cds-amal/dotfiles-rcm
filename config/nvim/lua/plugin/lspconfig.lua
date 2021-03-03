vim.lsp.set_log_level("debug");

local lspconfig = require'lspconfig'
-- local configs = require'lspconfig/configs'

lspconfig.tsserver.setup {
  on_attach=require'completion'.on_attach
}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('data')..'/lspinstall/lua-language-server'
-- local sumneko_binary = '/usr/bin/lua-language-server'

local sumneko_root_path = '/Users/cds/dev/lua-language-server'
local sumneko_binary = '/usr/local/bin/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach=require'completion'.on_attach,
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

local map_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'gd',  [[<Cmd>lua vim.lsp.buf.definition()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', 'gi',  [[<Cmd>lua vim.lsp.buf.implementation()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', 'gs',  [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', 'gr',  [[<Cmd>lua vim.lsp.buf.references()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', 'gn',  [[<Cmd>lua vim.lsp.buf.rename()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', 'ga',  [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', '<space>e', [[<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', '<space>q', [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', '[d', [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], map_opts)
vim.api.nvim_set_keymap('n', ']d', [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], map_opts)

