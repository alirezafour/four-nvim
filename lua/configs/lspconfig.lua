local M = {}

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(_, bufnr)
  -- helper function to set keys
  local key = function(key, action)
    vim.keymap.set('n', key, action, { buffer = bufnr })
  end

  -- setup keys
  key("<leader>lr", vim.lsp.buf.rename)
  key("<leader>la", vim.lsp.buf.code_action)

  key("gd", vim.lsp.buf.definition)
  key("gD", vim.lsp.buf.declaration)
  key("gi", vim.lsp.buf.implementation)
  key("<leader>lD", vim.lsp.buf.type_definition)

  key("K", vim.lsp.buf.hover)

  -- formating
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, {})
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local servers = { "html", "cssls", "tsserver", "clangd", "cmake", }
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
end

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

return M
