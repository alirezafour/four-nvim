return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    vim.g.sonokai_style = "maia"
    vim.g.sonokai_dim_inactive_windows = true
    vim.g.sonokai_diagnostic_virtual_text = 'highlighted'
    vim.g.sonokai_colors_override = {
      bg0 = {"#121212", "235"},
      bg_dim = {"#242120", "236"},
    }
    vim.cmd("colorscheme sonokai")
  end,
}
