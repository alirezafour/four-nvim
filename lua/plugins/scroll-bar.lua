return {
  "petertriho/nvim-scrollbar",
  event = "VimEnter",
  config = function()
    require("scrollbar").setup()
  end,
}
