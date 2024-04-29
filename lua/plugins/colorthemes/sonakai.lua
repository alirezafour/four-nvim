return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    vim.g.sonokai_style = "espresso"
    vim.g.sonokai_dim_inactive_windows = true
    vim.cmd("colorscheme sonokai")
  end,
}
