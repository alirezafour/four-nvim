return{
  "FabijanZulj/blame.nvim",
  event = "BufEnter",
  config = function()
    require('blame').setup {
      date_format = "%Y.%m",
    }
    vim.keymap.set("n", "<leader>bl", "<cmd>BlameToggle<cr>")
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "BlameViewOpened",
    --   callback = function(event)
    --     local blame_type = event.data
    --     if blame_type == "window" then
    --       require("barbecue.ui").toggle(false)
    --     end
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "BlameViewClosed",
    --   callback = function(event)
    --     local blame_type = event.data
    --     if blame_type == "window" then
    --       require("barbecue.ui").toggle(true)
    --     end
    --   end,
    -- })
  end,
}
