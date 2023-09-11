return {
  -- status bar on buttom
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- opts = function()
  --   return require "configs.lualine"
  -- end,
  config = function()
    require("lualine").setup({
      icons_enabled = true,
      theme = "gruvbox",
    })
  end,
}
