local options = {
  compiler = { "cl", "clang" },
  ensure_installed = {
    "rust",
    "vimdoc",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "cpp",
    "python",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
