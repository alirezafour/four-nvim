return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    -- opts = function()
    --   return require "configs.treesitter"
    -- end,
    config = function()
      require("nvim-treesitter.configs").setup({
        compiler = { "clang" },
        autotag = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
          "rust",
          "vimdoc",
          "vim",
          "lua",
          "bash",
          "html",
          "css",
          "c",
          "cpp",
          "python",
          "cmake",
          "json",
        },

        highlight = {
          enable = true,
          disable = function(_, bufnr) return vim.b[bufnr].large_buf end,
        },
        incremental_selection = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
