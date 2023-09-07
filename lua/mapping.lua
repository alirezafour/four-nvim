local utility = require "utility"
local maps = utility.empty_map_table()
maps.n[";"] = { ":" }
maps.i["jk"] = { "<Esc>", desc = "exit normal mode" }

-- Nvim-tree
maps.n["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", desc = "display nvim tree" }

-- clear highlight when go to normal mode
maps.n["<Esc>"] = { "<cmd> noh <cr>", desc = "Clear highlights" }

-- navigate within insert mode
maps.i["<C-h>"] = { "<Left>", desc = "Move left" }
maps.i["<C-l>"] = { "<Right>", desc = "Move right" }
maps.i["<C-j>"] = { "<Down>", desc = "Move down" }
maps.i["<C-k>"] = { "<Up>", desc = "Move up" }

-- terminal
maps.n["<A-t>"] = { function () require("nvterm.terminal").toggle('horizontal') end, desc = "toggle horizental terminal" }
maps.t["<A-t>"] = { function () require("nvterm.terminal").toggle('horizontal') end, desc = "toggle horizental terminal" }
maps.n["<A-h>"] = { function () require("nvterm.terminal").toggle('horizontal') end, desc = "toggle horizental terminal" }
maps.t["<A-h>"] = { function () require("nvterm.terminal").toggle('horizontal') end, desc = "toggle horizental terminal" }
maps.n["<A-v>"] = { function () require("nvterm.terminal").toggle('vertical')   end, desc = "toggle vertical terminal" }
maps.t["<A-v>"] = { function () require("nvterm.terminal").toggle('vertical')   end, desc = "toggle vertical terminal" }

-- switch between windows
maps.n["<C-h>"] = { "<c-w>h", desc = "Window left" }
maps.n["<C-l>"] = { "<c-w>l", desc = "Window right" }
maps.n["<C-j>"] = { "<c-w>j", desc = "Window down" }
maps.n["<C-k>"] = { "<c-w>k", desc = "Window up" }

  -- LSP

-- Telescope
maps.n["<leader>ff"] = { "<cmd> Telescope find_files <cr>", desc = "find files in current root" }
maps.n["<leader>fg"] = { "<cmd> Telescope live_grep <cr>", desc = "live group" }
maps.n["<leader>fb"] = { "<cmd> Telescope buffers <cr>", desc = "find in buffers" }
maps.n["<leader>fh"] = { "<cmd> Telescope help_tags <cr>", desc = "show help tags" }

-- Comment
maps.n["<leader>/"] = {
  function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  desc = "Toggle comment line",
}
maps.v["<leader>/"] = {
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  desc = "Toggle comment for selection",
}

utility.set_mappings(maps)
