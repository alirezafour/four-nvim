return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  config = function()
    -- export on_attach & capabilities for custom lspconfigs
    local on_attach = function(_, bufnr)
      -- helper function to set keys
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local key = function(mode, key, action, keyopts)
        vim.keymap.set(mode, key, action, keyopts)
      end

      opts.desc = "lsp rename"
      key("n", "<leader>gr", vim.lsp.buf.rename, opts)
      opts.desc = "lsp code action"
      key({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)
      opts.desc = "lsp type definition"
      key("n", "gtd", vim.lsp.buf.type_definition, opts)
      opts.desc = "lsp definition"
      key("n", "gd", vim.lsp.buf.definition, opts)
      opts.desc = "lsp declaration"
      key("n", "gD", vim.lsp.buf.declaration, opts)
      opts.desc = "lsp implementation"
      key("n", "gi", vim.lsp.buf.implementation, opts)
      opts.desc = "show lsp references in telescope"
      key("n", "gR", "<cmd> Telescope lsp_references <CR>", opts)
      opts.desc = "show lsp definition in telescope"
      key("n", "gt", "<cmd> Telescope lsp_type_definitions <CR>", opts)

      -- diagnostic
      opts.desc = "lsp show line diagnostics"
      key("n", "<leader>gd", vim.diagnostic.open_float, opts)
      opts.desc = "telescope buffer diagnostics"
      key("n", "<leader>gD", "<cmd> Telescope diagnostics bufnr=0 <CR>", opts)
      opts.desc = "lsp go previous diagnostic"
      key("n", "g[", vim.diagnostic.goto_prev, opts)
      opts.desc = "lsp go next diagnostic"
      key("n", "g]", vim.diagnostic.goto_next, opts)

      opts.desc = "lsp hover"
      key("n", "K", vim.lsp.buf.hover, opts)
      opts.desc = "reset lsp"
      key("n", "<leader>gR", "<cmd> LspRestart <CR>", opts)

      -- formating
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, {})
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    capabilities.textDocument.completion.completionItem = {
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

    require("lspconfig").clangd.setup {
      on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        local key = function(mode, key, action, keyopts)
          vim.keymap.set(mode, key, action, keyopts)
        end
        on_attach(client, bufnr)
        key("n", "<A-o>", "<cmd> ClangdSwitchSourceHeader <CR>", opts)
      end,
      capabilities = capabilities,
    }

    local servers = { "html", "cssls", "tsserver", "cmake", "rust_analyzer" }
    for _, lsp in ipairs(servers) do
      require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

    require("lspconfig").lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,

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
  end,
}
