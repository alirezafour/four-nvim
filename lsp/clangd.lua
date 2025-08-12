return {
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=iwyu",
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = {
    'c', 'cpp', 'objc', 'objcpp', 'cppx', 'cc', 'cxx', 'cppm', 'h', 'hpp', 'hppx', 'hh', 'hppm', 'ixx' },
  init_options = {
    fallbackFlags = { '-std=c++23', },
    directoryFilters = {
      "-.git", "-.vscode", "-build", "-.vscode-test", "-cache", "-out",
    },
  },

  -- {
    on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local key = function(mode, key, action, keyopts)
        vim.keymap.set(mode, key, action, keyopts)
      end
      key({ 'n', 'v' }, "gd", "<cmd> tjump <CR>", opts)
    end,
    capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokensSupport = true,
      }
    }
  },
  -- }
}
