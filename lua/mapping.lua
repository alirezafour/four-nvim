local utility = require "utility"
local maps = utility.empty_map_table()

maps.n[";"] = { ":" }
maps.i["jj"] = { "<Esc>", desc = "exit normal mode" }

-- Nvim-tree
maps.n["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", desc = "display nvim tree" }

-- dap
maps.n["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", desc = "dap add break point" }
maps.n["<leader>dr"] = { "<cmd> DapContinue <CR>", desc = "dap start or continue debugger" }

-- split screen
maps.n["<leader><leader>j"] = { "<cmd> split <CR>", desc = "split horizontal" }
maps.n["<leader><leader>l"] = { "<cmd> vsplit <CR>", desc = "split vertical" }

-- negen
maps.n["<Leader>nf"] = { ":lua require('neogen').generate()<CR>", desc = "neogen" }

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
