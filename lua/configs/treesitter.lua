local options = {
  compiler = { "cl", "clang" },
  ensure_installed = {
    "rust",
    "vimdoc",
    "vim",
    "lua",
    "bash",
    "dockfile",
    "doxigen",
    "html",
    "css",
    "c",
    "cpp",
    "python",
    "cmake",
    "git_config",
    "git_attributes",
    "gitignore",
    "gitcommit",
    "git_rebase",
    "json",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
