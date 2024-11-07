return {
  -- Only load whichkey after all the gui
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = { "<leader>", "<c-r>", '"', "'", "`", "c", "v", "g" },
  cmd = "WhichKey",
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
