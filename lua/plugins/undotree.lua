return {
  "mbbill/undotree",
  lazy = true,
  cmd ={ "UndotreeToggle", "UndotreeFocus"},
  keys = { { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
