return {
-- Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  event = {'BufEnter', 'BufNewFile'},
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false }
}
