local opts = {
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
    "codelldb",

    -- rust
    "rust-analyzer",

    -- CI
    "docker-compose-language-service",
    "yaml-language-server",

    -- python
    "python-lsp-server",
  },
}

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  event = "VeryLazy",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  config = function()
    require("mason").setup({

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
    })

    require("mason-lspconfig").setup({
      -- auto install missing
      automatic_installation = true,
    })

    require("mason-nvim-dap").setup()

    -- custom cmd to install all mason binaries listed
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end, {})
    --
    vim.g.mason_binaries_list = opts.ensure_installed
  end,
}
