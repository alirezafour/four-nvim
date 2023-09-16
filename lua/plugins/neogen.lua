return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require('neogen').setup({
      snippet_engine = "luasnip",
      enabled = true,
      input_after_comment = true,
    })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
