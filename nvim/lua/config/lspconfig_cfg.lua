local present1, config = pcall(require, "lspconfig")
local present2, installer = pcall(require, "nvim-lsp-installer")
if not (present1 or present2) then
  vim.notify("Fail to setup LSP", vim.log.levels.ERROR, {
    title = "plugins",
  })
  return
end

installer.setup({
    ensure_installed = {
        "rust_analyzer",
        "sumneko_lua",
        "texlab",
    },
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "…",
            server_uninstalled = "✗"
        }
    }
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = "",
  })
end

local lsp_publish_diagnostics_options = {
  virtual_text = {
    prefix = "←",
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = true, -- update diagnostics insert mode
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  lsp_publish_diagnostics_options
)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local function map(short, cmd)
    vim.keymap.set('n', short, cmd, { noremap=true, silent=true, buffer=bufnr })
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map('gd', vim.lsp.buf.definition)
  map('gr', vim.lsp.buf.references)
  map('K', vim.lsp.buf.hover)
  map('<leader>D', vim.lsp.buf.type_definition)
  map('<leader>rn', vim.lsp.buf.rename)
  map('<leader>ca', vim.lsp.buf.code_action)
  map('<leader>f', function() vim.lsp.buf.format { async = true } end)
end

config.sumneko_lua.setup {
    on_attach = on_attach
}
config.clangd.setup{
    on_attach = on_attach,
}
config.texlab.setup{
    on_attach = on_attach,
}
config.rust_analyzer.setup{
    on_attach = on_attach,
}
