local options = {
   ensure_installed = {
    -- lua stuff
    "lua-language-server",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cmake-language-server",

    -- rust
    "rust-analyzer",

    -- CI
    "docker-compose-language-service",
    "yaml-language-server",

    -- python
    "python-lsp-server",
   }, -- not an option from mason.nvim

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "✓",
      package_uninstalled = "✗",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10, 
}

return options
