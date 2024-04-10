return {
  "chriskempson/base16-vim",
  lazy = false,
  propity = 1000,
  config = function()
    vim.o.background = "dark"
    vim.cmd("colorscheme base16-tomorrow-night")
  end,
}
