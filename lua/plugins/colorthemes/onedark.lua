return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    require("onedark").setup {
      style = "warmer",
    }
    require("onedark").load()
  end,
}
