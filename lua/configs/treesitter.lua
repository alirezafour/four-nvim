local options = {
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
}

return options
