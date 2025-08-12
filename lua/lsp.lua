vim.lsp.enable({ "clangd", "lua_ls" })
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method('textDocument/switchSourceHeader') then
      local function switch_source_header()
        local bufnr = vim.api.nvim_get_current_buf()
        local params = {
          uri = vim.uri_from_bufnr(bufnr)
        }
        client:request('textDocument/switchSourceHeader', params, function(err, result, ctx)
          if err then
            vim.notify(
              string.format("Error on LSP request '%s': %s", ctx.method, err.message),
              vim.log.levels.ERROR
            )
            return
          end

          if not result or type(result) ~= 'string' or result == '' then
            vim.notify("Corresponding file could not be determined by the language server.", vim.log.levels.WARN)
            return
          end

          vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
        end, bufnr)
      end
      print("It suppert switchSourceHeader")
      vim.keymap.set('n', 'go', switch_source_header, { silent = true })
    end
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
